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

configurable SAPAuthConfig sapAuthConfig = ?;

final reservation:Client reservationClient = check new (
    config = {
        auth: {
            username : sapAuthConfig.username,
            password : sapAuthConfig.password
        }
    },
    hostname = sapAuthConfig.hostname
);

final stock:Client stockClient = check new (
    config = {
        auth: {
            username : sapAuthConfig.username,
            password : sapAuthConfig.password
        }
    },
    hostname = sapAuthConfig.hostname
);

service /material on new http:Listener(9090) {
    resource function post stock(map<float> requiredStocks) returns error? {
        foreach [string, float] [key, value] in requiredStocks.entries() {
            [boolean, string?]|error materialDetails = check checkMaterialAvailabilityAndReturnBaseUnit(key, value);
            if materialDetails is error{
                log:printInfo("Request failed: " + key + " Material Not Found");
            } else{
                boolean stockAvailable = materialDetails[0];
                if stockAvailable {
                    reservation:A_ReservationDocumentHeader_2|error reservationResult = check createReservation(key, value, materialDetails[1]) ?: {};
                    if reservationResult is reservation:A_ReservationDocumentHeader_2 {
                        string? reservationId = reservationResult?.Reservation; 
                        log:printInfo("Reservation document " + <string>reservationId + " has been successfully created");
                    } else{
                        log:printInfo("Error: " + reservationResult.message());
                    }
                } else {
                    log:printInfo("No Sufficient Stock For Material " + key + ".");
                }
            }
        }
    }
}

function checkMaterialAvailabilityAndReturnBaseUnit(string product, float inStock) returns [boolean, string?]|error {
    stock:A_MaterialStockWrapper|error materialAvailabilityResponse = check stockClient->getA_MaterialStock(product);
    if materialAvailabilityResponse is error{
        return error("GET request failed: " + materialAvailabilityResponse.message());
    }
    stock:A_MatlStkInAcctMod[]? material = materialAvailabilityResponse.d?.to_MatlStkInAcctMod?.results;
    if material is () {
        return [false, ""];
    }
    foreach stock:A_MatlStkInAcctMod item in material {
        string quantity = <string>item?.MatlWrhsStkQtyInMatlBaseUnit;
        float stock = check float:fromString(quantity);
        string? baseUnit = item?.MaterialBaseUnit;
        if stock > inStock {
            return [true, baseUnit];
        } 
    }
    return [false, ""];
}

function createReservation(string product, float quantity, string? unit) returns reservation:A_ReservationDocumentHeader_2|error? {
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
