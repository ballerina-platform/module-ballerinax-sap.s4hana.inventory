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

import ballerina/http;
import ballerina/log;
import ballerina/mime;
import ballerinax/sap.s4hana.api_material_document_srv as matDoc;

configurable S4HanaClientConfig s4hanaClientConfig = ?;

configurable string ocrToken = ?;
configurable string deliveryNoteUrl = "";

const OCR_REQUEST_PATH = "/invoice_parser";
const OCR_URL = "https://api.edenai.run/v2/ocr";

final http:Client ocrHttpClient = check new (
    url = OCR_URL,
    auth = {token: ocrToken},
    cookieConfig = {enabled: true}
);

matDoc:Client materialDocumentClient = check new (
    {
        auth: {
            username: s4hanaClientConfig.username,
            password: s4hanaClientConfig.password
        }
    },
    s4hanaClientConfig.hostname
);

public function main() {
    PaperDeliveryNote|error noteResponse = readPaperDeliveryNote();
    if noteResponse is error {
        log:printError(string `Error while reading paper delivery note : ${noteResponse.message()}`);
        return;
    }

    string materialDocumentYear = "2024";
    string materialDocument = "10000";
    string materialDocumentItem = "UB";

    matDoc:CreateA_MaterialDocumentItem[] orderItems = from InvoiceItem lineItem in noteResponse.item_lines
        select
        {
            MaterialDocumentYear: materialDocumentYear,
            MaterialDocument: materialDocument,
            MaterialDocumentItem: materialDocumentItem,
            QuantityInBaseUnit: lineItem.quantity.toString()
        };

    matDoc:CreateA_MaterialDocumentHeader payload = {
        MaterialDocumentYear: materialDocumentYear,
        MaterialDocument: materialDocument,
        to_MaterialDocumentItem: {
            results: orderItems
        }
    };

    matDoc:A_MaterialDocumentHeaderWrapper|error response = materialDocumentClient->createA_MaterialDocumentHeader(payload);
    if response is error {
        log:printError("Error creating material document: " + response.message());
        return;
    }

    log:printInfo(string `Material document created successfully: ${response.d?.MaterialDocument ?: ""}`);
}

isolated function readPaperDeliveryNote() returns PaperDeliveryNote|error {
    ExtractedInvoice|http:Error response = ocrHttpClient->post(
        path = OCR_REQUEST_PATH,
        message = {
        show_original_response: "false",
        fallback_providers: "",
        providers: "mindee,google",
        language: "en",
        file_url: deliveryNoteUrl
    },
        headers = {[http:CONTENT_TYPE]: mime:APPLICATION_JSON},
        targetType = ExtractedInvoice
    );

    if response is http:Error {
        return response;
    }
    return response.eden\-ai.extracted_data[0];
}
