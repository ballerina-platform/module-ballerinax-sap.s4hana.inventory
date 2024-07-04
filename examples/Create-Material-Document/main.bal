import ballerina/io;
import ballerina/log;
import ballerina/http;
import ballerinax/sap.s4hana.api_material_document_srv as materialdocument;

const OCR_REQUEST_PATH = "/invoice_parser";
const OCR_URL = "https://api.edenai.run/v2/ocr";
const CONTENT_TYPE = "Content-Type";
const APPLICATION_JSON = "application/json";


final http:Client ocrHttpClient = check getOCRHttpClient();
configurable string ocrToken = ?;
configurable SAPAuthConfig sapAuthConfig = ?;
configurable string invoiceUrl = ?;

isolated function getOCRHttpClient() returns http:Client|error {
        http:BearerTokenConfig tokenAuthHandler = {token: ocrToken};
        return new (url = OCR_URL, auth = tokenAuthHandler, cookieConfig = {enabled: true});
}
public function main() returns error? {
    PaperInvoice|error invoiceResponse = readPaperInvoice();
    if invoiceResponse is error {
        log:printError("Error while reading paper invoice: " + invoiceResponse.message());
        return;
    }

    SAPMaterialDocument sapOrder = check transformOrderData(invoiceResponse);
    io:print(sapOrder);

    materialdocument:Client materialDocumentClient = check new (
        config = {
            auth: {
                username: sapAuthConfig.username,
                password:sapAuthConfig.password
            }
        },
        hostname = sapAuthConfig.hostname
    );

    materialdocument:CreateA_MaterialDocumentHeader payload = {
         MaterialDocumentYear:sapOrder.MaterialDocumentYear, 
         MaterialDocument: sapOrder.MaterialDocument
    };

    materialdocument:A_MaterialDocumentHeaderWrapper createAMaterialDocumentHeader = check materialDocumentClient->createA_MaterialDocumentHeader(payload);
    io:print(createAMaterialDocumentHeader);
}
isolated function readPaperInvoice() returns PaperInvoice|error {
    ExtractedInvoice|http:Error response = ocrHttpClient->post(
        path = OCR_REQUEST_PATH,
        message = {
        show_original_response: "false",
        fallback_providers: "",
        providers: "mindee,google",
        language: "en",
        file_url: invoiceUrl   //The url for the image of the invoice used in this example was included to the config.toml file. For testing purposes your invoice URL link can be included to the config.toml file
    },
        headers = {[CONTENT_TYPE] : APPLICATION_JSON},
        targetType = ExtractedInvoice
    );

    if response is http:Error {
        return response;
    }
    return response.eden\-ai.extracted_data[0];
}

isolated function transformOrderData(PaperInvoice paperInvoice) returns SAPMaterialDocument|error {
    string materialDocumentYear = "2022";
    string materialDocument = "10000";
    OrderItem[] orderItems = from InvoiceItem lineItem in paperInvoice.item_lines
        select
        {
            Description: lineItem.description,
            OrderQuantity: lineItem.quantity
        };

    return {
        MaterialDocumentYear:materialDocumentYear,
        MaterialDocument:materialDocument,
        OrderItem:orderItems
    };
}
