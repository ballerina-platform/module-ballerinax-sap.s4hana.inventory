// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;
import ballerina/http;
import ballerinax/sap.s4hana.api_material_document_srv as materialdocument;

const OCR_REQUEST_PATH = "/invoice_parser";
const OCR_URL = "https://api.edenai.run/v2/ocr";
const CONTENT_TYPE = "Content-Type";
const APPLICATION_JSON = "application/json";


final http:Client ocrHttpClient = check new (
    url = OCR_URL, 
    auth = {token: ocrToken}, 
    cookieConfig = {enabled: true}
);

materialdocument:Client materialDocumentClient = check new (
        config = {
            auth: {
                username: sapAuthConfig.username,
                password:sapAuthConfig.password
            }
        },
        hostname = sapAuthConfig.hostname
    );
                                             
configurable string ocrToken = ?;
configurable SAPAuthConfig sapAuthConfig = ?;
configurable string invoiceUrl = ?;

public function main() returns error? {
    PaperInvoice|error invoiceResponse = readPaperInvoice();
    if invoiceResponse is error {
        log:printError("Error while reading paper invoice: " + invoiceResponse.message());
        return;
    }

    SAPMaterialDocument sapOrder = check transformOrderData(invoiceResponse);

    materialdocument:CreateA_MaterialDocumentHeader payload = {
         MaterialDocumentYear:sapOrder.MaterialDocumentYear, 
         MaterialDocument: sapOrder.MaterialDocument
    };

    materialdocument:A_MaterialDocumentHeaderWrapper|error createAMaterialDocumentHeader = check materialDocumentClient->createA_MaterialDocumentHeader(payload);
    
    if createAMaterialDocumentHeader is error {
    log:printError("Error creating material document: " + createAMaterialDocumentHeader.message());
    } else {
    log:printInfo("Material document created successfully: " + createAMaterialDocumentHeader.toString());
    }

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
