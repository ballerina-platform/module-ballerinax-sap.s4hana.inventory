// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

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
import ballerinax/sap;

#

#

# This service enables you to retrieve material stock information using the OData protocol with filter data provided in the payload. It can be consumed by external warehouse applications.
public isolated client class Client {
    final sap:Client clientEp;

    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string hostname, int port = 443) returns error? {
        string serviceUrl = string `https://${hostname}:${port}/sap/opu/odata/sap/API_MATERIAL_STOCK_SRV`;
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        sap:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Get entity from A_MaterialSerialNumber by key
    #
    # + Material - Material Number
    # + SerialNumber - Serial Number
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_MaterialSerialNumber(string Material, string SerialNumber, map<string|string[]> headers = {}, *GetA_MaterialSerialNumberQueries queries) returns A_MaterialSerialNumberWrapper|error {
        string resourcePath = string `/A_MaterialSerialNumber(Material='${getEncodedUri(Material)}',SerialNumber='${getEncodedUri(SerialNumber)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads material ID and base unit of measure for a specific material
    #
    # + Material - Material Number
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_MaterialStock(string Material, map<string|string[]> headers = {}, *GetA_MaterialStockQueries queries) returns A_MaterialStockWrapper|error {
        string resourcePath = string `/A_MaterialStock('${getEncodedUri(Material)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads material stocks in account model for a specific set of stock identifiers
    #
    # + Material - Material in Respect of Which Stock is Managed
    # + Plant - Plant
    # + StorageLocation - Storage Location
    # + Batch - Batch Number (Stock Identifier)
    # + Supplier - Supplier for Special Stock
    # + Customer - Customer for Special Stock
    # + WBSElementInternalID - Valuated Sales Order Stock WBS Element
    # + SDDocument - Sales order number of valuated sales order stock
    # + SDDocumentItem - Sales Order Item of Valuated Sales Order Stock
    # + InventorySpecialStockType - Special Stock Type
    # + InventoryStockType - Stock Type of Goods Movement (Stock Identifier)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_MatlStkInAcctMod(string Material, string Plant, string StorageLocation, string Batch, string Supplier, string Customer, string WBSElementInternalID, string SDDocument, string SDDocumentItem, string InventorySpecialStockType, string InventoryStockType, map<string|string[]> headers = {}, *GetA_MatlStkInAcctModQueries queries) returns A_MatlStkInAcctModWrapper|error {
        string resourcePath = string `/A_MatlStkInAcctMod(Material='${getEncodedUri(Material)}',Plant='${getEncodedUri(Plant)}',StorageLocation='${getEncodedUri(StorageLocation)}',Batch='${getEncodedUri(Batch)}',Supplier='${getEncodedUri(Supplier)}',Customer='${getEncodedUri(Customer)}',WBSElementInternalID='${getEncodedUri(WBSElementInternalID)}',SDDocument='${getEncodedUri(SDDocument)}',SDDocumentItem='${getEncodedUri(SDDocumentItem)}',InventorySpecialStockType='${getEncodedUri(InventorySpecialStockType)}',InventoryStockType='${getEncodedUri(InventoryStockType)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads material stocks in account model for a specific set of stock identifiers including material ID and base unit
    #
    # + Material - Material in Respect of Which Stock is Managed
    # + Plant - Plant
    # + StorageLocation - Storage Location
    # + Batch - Batch Number (Stock Identifier)
    # + Supplier - Supplier for Special Stock
    # + Customer - Customer for Special Stock
    # + WBSElementInternalID - Valuated Sales Order Stock WBS Element
    # + SDDocument - Sales order number of valuated sales order stock
    # + SDDocumentItem - Sales Order Item of Valuated Sales Order Stock
    # + InventorySpecialStockType - Special Stock Type
    # + InventoryStockType - Stock Type of Goods Movement (Stock Identifier)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getMaterialStockOfA_MatlStkInAcctMod(string Material, string Plant, string StorageLocation, string Batch, string Supplier, string Customer, string WBSElementInternalID, string SDDocument, string SDDocumentItem, string InventorySpecialStockType, string InventoryStockType, map<string|string[]> headers = {}, *GetMaterialStockOfA_MatlStkInAcctModQueries queries) returns A_MaterialStockWrapper|error {
        string resourcePath = string `/A_MatlStkInAcctMod(Material='${getEncodedUri(Material)}',Plant='${getEncodedUri(Plant)}',StorageLocation='${getEncodedUri(StorageLocation)}',Batch='${getEncodedUri(Batch)}',Supplier='${getEncodedUri(Supplier)}',Customer='${getEncodedUri(Customer)}',WBSElementInternalID='${getEncodedUri(WBSElementInternalID)}',SDDocument='${getEncodedUri(SDDocument)}',SDDocumentItem='${getEncodedUri(SDDocumentItem)}',InventorySpecialStockType='${getEncodedUri(InventorySpecialStockType)}',InventoryStockType='${getEncodedUri(InventoryStockType)}')/to_MaterialStock`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entities from A_MaterialSerialNumber
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_MaterialSerialNumbers(map<string|string[]> headers = {}, *ListA_MaterialSerialNumbersQueries queries) returns CollectionOfA_MaterialSerialNumberWrapper|error {
        string resourcePath = string `/A_MaterialSerialNumber`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads material ID and base unit of measure
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_MaterialStocks(map<string|string[]> headers = {}, *ListA_MaterialStocksQueries queries) returns CollectionOfA_MaterialStockWrapper|error {
        string resourcePath = string `/A_MaterialStock`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads material stocks in account model
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_MatlStkInAcctMods(map<string|string[]> headers = {}, *ListA_MatlStkInAcctModsQueries queries) returns CollectionOfA_MatlStkInAcctModWrapper|error {
        string resourcePath = string `/A_MatlStkInAcctMod`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entities from related to_MaterialSerialNumber
    #
    # + Material - Material in Respect of Which Stock is Managed
    # + Plant - Plant
    # + StorageLocation - Storage Location
    # + Batch - Batch Number (Stock Identifier)
    # + Supplier - Supplier for Special Stock
    # + Customer - Customer for Special Stock
    # + WBSElementInternalID - Valuated Sales Order Stock WBS Element
    # + SDDocument - Sales order number of valuated sales order stock
    # + SDDocumentItem - Sales Order Item of Valuated Sales Order Stock
    # + InventorySpecialStockType - Special Stock Type
    # + InventoryStockType - Stock Type of Goods Movement (Stock Identifier)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listMaterialSerialNumbersOfA_MatlStkInAcctMod(string Material, string Plant, string StorageLocation, string Batch, string Supplier, string Customer, string WBSElementInternalID, string SDDocument, string SDDocumentItem, string InventorySpecialStockType, string InventoryStockType, map<string|string[]> headers = {}, *ListMaterialSerialNumbersOfA_MatlStkInAcctModQueries queries) returns CollectionOfA_MaterialSerialNumberWrapper|error {
        string resourcePath = string `/A_MatlStkInAcctMod(Material='${getEncodedUri(Material)}',Plant='${getEncodedUri(Plant)}',StorageLocation='${getEncodedUri(StorageLocation)}',Batch='${getEncodedUri(Batch)}',Supplier='${getEncodedUri(Supplier)}',Customer='${getEncodedUri(Customer)}',WBSElementInternalID='${getEncodedUri(WBSElementInternalID)}',SDDocument='${getEncodedUri(SDDocument)}',SDDocumentItem='${getEncodedUri(SDDocumentItem)}',InventorySpecialStockType='${getEncodedUri(InventorySpecialStockType)}',InventoryStockType='${getEncodedUri(InventoryStockType)}')/to_MaterialSerialNumber`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get entities from related to_MatlStkInAcctMod
    #
    # + Material - Material Number
    # + SerialNumber - Serial Number
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listMatlStkInAcctModsOfA_MaterialSerialNumber(string Material, string SerialNumber, map<string|string[]> headers = {}, *ListMatlStkInAcctModsOfA_MaterialSerialNumberQueries queries) returns CollectionOfA_MatlStkInAcctModWrapper|error {
        string resourcePath = string `/A_MaterialSerialNumber(Material='${getEncodedUri(Material)}',SerialNumber='${getEncodedUri(SerialNumber)}')/to_MatlStkInAcctMod`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads material stock information for a specific material
    #
    # + Material - Material Number
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listMatlStkInAcctModsOfA_MaterialStock(string Material, map<string|string[]> headers = {}, *ListMatlStkInAcctModsOfA_MaterialStockQueries queries) returns CollectionOfA_MatlStkInAcctModWrapper|error {
        string resourcePath = string `/A_MaterialStock('${getEncodedUri(Material)}')/to_MatlStkInAcctMod`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Send a group of requests
    #
    # + headers - Headers to be sent with the request 
    # + request - Batch request 
    # + return - Batch response 
    remote isolated function performBatchOperation(http:Request request, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/$batch`;
        // TODO: Update the request as needed;
        return self.clientEp->post(resourcePath, request, headers);
    }
}