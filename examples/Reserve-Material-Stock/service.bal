import ballerina/http;
import ballerina/log;
import ballerina/time;
import ballerina/uuid;
import ballerinax/sap.s4hana.api_material_stock_srv as stock;
import ballerinax/sap.s4hana.ce_apireservationdocument_0001 as reservation;

configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

final reservation:Client reservationClient = check new (
    config = {
        auth: {
            username,
            password
        }
    },
    hostname = hostname
);

final stock:Client stockClient = check new (
    config = {
        auth: {
            username,
            password
        }
    },
    hostname = hostname
);

service /material on new http:Listener(9090) {
    resource function get stock(map<string> stocks) returns error? {
        foreach var [key, value] in stocks.entries() {
            float requiredStock = check float:fromString(value);
            [boolean, string?] materialDetails = check checkMaterialStock(key, requiredStock);
            boolean stockAvailable = materialDetails[0];
            string? materialBaseUnit = materialDetails[1];
            if stockAvailable {
                reservation:A_ReservationDocumentHeader_2 reservationResult = check createReservation(key, <string>stocks[key], materialBaseUnit) ?: {};
                if reservationResult is reservation:A_ReservationDocumentHeader_2 {
                    log:printInfo("Reservation document has been successfully created");
                }
            }
            else {
                log:printInfo("No sufficient stock.");
            }
        }
    }
}

function checkMaterialStock(string product, float inStock) returns [boolean, string?]|error {
    stock:GetA_MaterialStockQueries stockQueries = {
        \$select: ["Material", "MaterialBaseUnit", "to_MatlStkInAcctMod"]
    };
    stock:A_MaterialStockWrapper materialStockResponse = check stockClient->getA_MaterialStock(product, queries = stockQueries);
    stock:A_MatlStkInAcctMod[]? material = materialStockResponse.d?.to_MatlStkInAcctMod?.results;
    if material is () {
        log:printInfo("No materials found in the response.");
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

function createReservation(string product, string quantity, string? unit) returns reservation:A_ReservationDocumentHeader_2|error? {
    time:Utc currentUtcTime = time:utcNow();
    string currentDate = currentUtcTime.toString().substring(0, 11);
    string uniqueId = uuid:createType4AsString().substring(0, 11);
    reservation:CreateA_ReservationDocumentHeader_2 payload = {
        "Reservation": uniqueId,
        "ReservationDate": currentDate,
        "_ReservationDocumentItem": [{"Product": product, "ResvnItmRequiredQtyInEntryUnit": quantity, "EntryUnit": unit}]
    };
    reservation:A_ReservationDocumentHeader_2 reservationResponse = check reservationClient->createReservationDocument(payload);
    return reservationResponse;
}
