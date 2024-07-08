// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
import ballerina/time;
import ballerina/uuid;
import ballerinax/sap.s4hana.api_material_stock_srv as stock;
import ballerinax/sap.s4hana.ce_apireservationdocument_0001 as reservation;

configurable string username = ?;
configurable string password = ?;
configurable string hostname = ?;

final reservation:Client reservationClient = check new (
    {
        auth: {
            username,
            password
        }
    },
    hostname
);

final stock:Client stockClient = check new (
    {
        auth: {
            username,
            password
        }
    },
    hostname
);

isolated service /material on new http:Listener(9090) {
    isolated resource function post reserve(string id, float quantity) returns http:Created|http:NotFound|http:InternalServerError|error {

        stock:A_MaterialStockWrapper|error response = stockClient->getA_MaterialStock(id, \$expand = ["to_MatlStkInAcctMod"]);
        if response is error {
            log:printWarn(string `Material of id ${id} not found.`);
            return http:NOT_FOUND;
        }

        string baseUnit = response.d?.MaterialBaseUnit ?: "";
        stock:A_MatlStkInAcctMod[]? material = response.d?.to_MatlStkInAcctMod?.results;
        if material is () || material.length() == 0 {
            log:printWarn(string `Material of id ${id} not found.`);
            return http:NOT_FOUND;
        }

        // For simplicity it is assumed material is stored only on one location
        string? availableQuantity = material[0]?.MatlWrhsStkQtyInMatlBaseUnit;
        if availableQuantity is () || check float:fromString(availableQuantity) < quantity {
            log:printWarn(string `Not sufficent stock for material of id ${id}.`);
            return http:NOT_FOUND;
        }

        reservation:A_ReservationDocumentHeader_2|error revrRes = createReservation(id, quantity, baseUnit);
        if revrRes is error {
            log:printError(string `Error occurred while creating reservation document.`, revrRes);
            return http:INTERNAL_SERVER_ERROR;
        }
        log:printInfo(string `Reservation document created successfully. Reservation id: ${revrRes.Reservation ?: ""}.`);
        return http:CREATED;
    }
}

isolated function createReservation(string product, float quantity, string unit) returns reservation:A_ReservationDocumentHeader_2|error {
    time:Utc currentUtcTime = time:utcNow();
    string currentDate = currentUtcTime.toString().substring(0, 11);
    string uniqueId = uuid:createType4AsString().substring(0, 11);
    reservation:CreateA_ReservationDocumentHeader_2 payload = {
        Reservation: uniqueId,
        ReservationDate: currentDate,
        _ReservationDocumentItem: [
            {
                Product: product,
                ResvnItmRequiredQtyInEntryUnit: quantity.toString(),
                EntryUnit: unit
            }
        ]
    };
    return reservationClient->createReservationDocument(payload);
}
