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

import sap.s4hana.ce_apireservationdocument_0001.mock as _;

import ballerina/log;
import ballerina/os;
import ballerina/test;

configurable boolean isTestOnLiveServer = os:getEnv("IS_TEST_ON_S4HANA_SERVER") == "false";

configurable string hostname = isTestOnLiveServer ? os:getEnv("HOST_NAME") : "localhost";
configurable string username = isTestOnLiveServer ? os:getEnv("USERNAME") : "admin";
configurable string password = isTestOnLiveServer ? os:getEnv("PASSWORD") : "admin";

boolean isBalBuild = os:getEnv("IS_BAL_BUILD") == "true";
string certPathPostFix = isBalBuild ? "../" : "/home/ballerina/ballerina/";

Client s4HanaClient = test:mock(Client);

@test:BeforeSuite
function initializeClientsForS4HanaServer() returns error? {
    if (isTestOnLiveServer) {
        log:printInfo("Running tests on S4HANA server");
        s4HanaClient = check new (
            config = {
                auth: {
                    username,
                    password
                }
            },
            hostname = hostname
        );
    } else {
        log:printInfo("Running tests on mock server");
        s4HanaClient = check new (
            config = {
                auth: {
                    username,
                    password
                },
                secureSocket: {
                    cert: certPathPostFix + "resources/public.crt"
                }
            },
            hostname = hostname,
            port = 9090
        );
    }
}

@test:Config {
}
function testListReservationDocuments() returns error? {
    CollectionOfA_ReservationDocumentHeader_2 listReservationDocuments = check s4HanaClient->listReservationDocuments();
    test:assertTrue(listReservationDocuments.value !is (), "The collection list of reservation documents is expected to be non-empty.");
}

@test:Config {
}
function testListReservationDocumentItems() returns error? {
    CollectionOfA_ReservationDocumentItem_2 listReservationDocumentItems = check s4HanaClient->listReservationDocumentItems();
    test:assertTrue(listReservationDocumentItems.value !is (), "The collection list of reservation document items is expected to be non-empty.");
}

@test:Config {
}
function testCreateReservationDocument() returns error? {
    A_ReservationDocumentHeader_2|error reservationDocument = s4HanaClient->createReservationDocument({
        "Reservation": "145324",
        "ReservationDate": "22/04/2024"});
    test:assertTrue(reservationDocument is error, "The physical inventory document creation response expected to be 500");
    error e = <error>reservationDocument;
    test:assertEquals(e.detail()["statusCode"], 500, "Expected 500 status code");
}
