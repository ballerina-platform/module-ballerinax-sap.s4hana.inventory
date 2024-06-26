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

import ballerina/constraint;
import ballerina/http;

public type MatlStkInAcctModOfA_MaterialSerialNumberExpandOptions ("to_MaterialSerialNumber"|"to_MaterialStock")[];

public type A_MatlStkInAcctModOrderByOptions ("Material"|"Material desc"|"Plant"|"Plant desc"|"StorageLocation"|"StorageLocation desc"|"Batch"|"Batch desc"|"Supplier"|"Supplier desc"|"Customer"|"Customer desc"|"WBSElementInternalID"|"WBSElementInternalID desc"|"SDDocument"|"SDDocument desc"|"SDDocumentItem"|"SDDocumentItem desc"|"InventorySpecialStockType"|"InventorySpecialStockType desc"|"InventoryStockType"|"InventoryStockType desc"|"WBSElementExternalID"|"WBSElementExternalID desc"|"MaterialBaseUnit"|"MaterialBaseUnit desc"|"MatlWrhsStkQtyInMatlBaseUnit"|"MatlWrhsStkQtyInMatlBaseUnit desc")[];

# Represents the Queries record for the operation: listMaterialSerialNumbersOfA_MatlStkInAcctMod
public type ListMaterialSerialNumbersOfA_MatlStkInAcctModQueries record {
    # Skip the first n items, see [Paging - Skip](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=66)
    int \$top?;
    # Filter items by property values, see [Filtering](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=64)
    string \$filter?;
    # Order items by property values, see [Sorting](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    MaterialSerialNumberOfA_MatlStkInAcctModOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    MaterialSerialNumberOfA_MatlStkInAcctModExpandOptions \$expand?;
    # Include count of items, see [Inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67)
    "allpages"|"none" \$inlinecount?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    MaterialSerialNumberOfA_MatlStkInAcctModSelectOptions \$select?;
};

# Represents the Queries record for the operation: getMaterialStockOfA_MatlStkInAcctMod
public type GetMaterialStockOfA_MatlStkInAcctModQueries record {
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    MaterialStockOfA_MatlStkInAcctModExpandOptions \$expand?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    MaterialStockOfA_MatlStkInAcctModSelectOptions \$select?;
};

public type A_MatlStkInAcctModSelectOptions ("Material"|"Plant"|"StorageLocation"|"Batch"|"Supplier"|"Customer"|"WBSElementInternalID"|"SDDocument"|"SDDocumentItem"|"InventorySpecialStockType"|"InventoryStockType"|"WBSElementExternalID"|"MaterialBaseUnit"|"MatlWrhsStkQtyInMatlBaseUnit"|"to_MaterialSerialNumber"|"to_MaterialStock")[];

public type A_MaterialStockWrapper record {
    A_MaterialStock d?;
};

public type A_MatlStkInAcctMod record {
    # Material in Respect of Which Stock is Managed
    @constraint:String {maxLength: 40}
    string Material?;
    @constraint:String {maxLength: 4}
    string Plant?;
    @constraint:String {maxLength: 4}
    string StorageLocation?;
    # Batch Number (Stock Identifier)
    @constraint:String {maxLength: 10}
    string Batch?;
    # Supplier for Special Stock
    @constraint:String {maxLength: 10}
    string Supplier?;
    # Customer for Special Stock
    @constraint:String {maxLength: 10}
    string Customer?;
    # Valuated Sales Order Stock WBS Element
    @constraint:String {maxLength: 24}
    string WBSElementInternalID?;
    # Sales order number of valuated sales order stock
    @constraint:String {maxLength: 10}
    string SDDocument?;
    # Sales Order Item of Valuated Sales Order Stock
    @constraint:String {maxLength: 6}
    string SDDocumentItem?;
    @constraint:String {maxLength: 1}
    string InventorySpecialStockType?;
    # Stock Type of Goods Movement (Stock Identifier)
    @constraint:String {maxLength: 2}
    string InventoryStockType?;
    # Work Breakdown Structure Element (WBS Element) Edited
    string? WBSElementExternalID?;
    string? MaterialBaseUnit?;
    string? MatlWrhsStkQtyInMatlBaseUnit?;
    A_MatlStkInAcctMod_to_MaterialSerialNumber to_MaterialSerialNumber?;
    A_MaterialStock to_MaterialStock?;
};

public type MaterialSerialNumberOfA_MatlStkInAcctModSelectOptions ("Material"|"SerialNumber"|"Plant"|"StorageLocation"|"InventorySpecialStockType"|"Batch"|"InventoryStockType"|"Equipment"|"Customer"|"Supplier"|"SDDocument"|"SDDocumentItem"|"WBSElementInternalID"|"WBSElementExternalID"|"to_MatlStkInAcctMod")[];

public type MaterialStockOfA_MatlStkInAcctModSelectOptions ("Material"|"MaterialBaseUnit"|"to_MatlStkInAcctMod")[];

public type A_MaterialStockSelectOptions ("Material"|"MaterialBaseUnit"|"to_MatlStkInAcctMod")[];

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig|http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Represents the Queries record for the operation: listA_MaterialStocks
public type ListA_MaterialStocksQueries record {
    # Skip the first n items, see [Paging - Skip](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=66)
    int \$top?;
    # Filter items by property values, see [Filtering](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=64)
    string \$filter?;
    # Order items by property values, see [Sorting](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    A_MaterialStockOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    A_MaterialStockExpandOptions \$expand?;
    # Include count of items, see [Inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67)
    "allpages"|"none" \$inlinecount?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    A_MaterialStockSelectOptions \$select?;
};

public type A_MaterialSerialNumber record {
    # Material Number
    @constraint:String {maxLength: 40}
    string Material?;
    @constraint:String {maxLength: 18}
    string SerialNumber?;
    string? Plant?;
    string? StorageLocation?;
    # Special Stock Indicator
    string? InventorySpecialStockType?;
    # Batch Number
    string? Batch?;
    # Stock Type of Goods Movement (Primary Posting)
    string? InventoryStockType?;
    # Equipment Number
    string? Equipment?;
    # Special stock customer account number
    string? Customer?;
    # Account number of the vendor
    string? Supplier?;
    # Sales Order Number
    string? SDDocument?;
    # Item Number in Sales Order
    string? SDDocumentItem?;
    # Work Breakdown Structure Element (WBS Element)
    string? WBSElementInternalID?;
    # Work Breakdown Structure Element (WBS Element) Edited
    string? WBSElementExternalID?;
    A_MaterialSerialNumber_to_MatlStkInAcctMod to_MatlStkInAcctMod?;
};

public type MatlStkInAcctModOfA_MaterialStockOrderByOptions ("Material"|"Material desc"|"Plant"|"Plant desc"|"StorageLocation"|"StorageLocation desc"|"Batch"|"Batch desc"|"Supplier"|"Supplier desc"|"Customer"|"Customer desc"|"WBSElementInternalID"|"WBSElementInternalID desc"|"SDDocument"|"SDDocument desc"|"SDDocumentItem"|"SDDocumentItem desc"|"InventorySpecialStockType"|"InventorySpecialStockType desc"|"InventoryStockType"|"InventoryStockType desc"|"WBSElementExternalID"|"WBSElementExternalID desc"|"MaterialBaseUnit"|"MaterialBaseUnit desc"|"MatlWrhsStkQtyInMatlBaseUnit"|"MatlWrhsStkQtyInMatlBaseUnit desc")[];

# The number of entities in the collection. Available when using the [$inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67) query option.
public type count string;

public type A_MaterialSerialNumberExpandOptions ("to_MatlStkInAcctMod")[];

public type MaterialSerialNumberOfA_MatlStkInAcctModExpandOptions ("to_MatlStkInAcctMod")[];

public type CollectionOfA_MatlStkInAcctMod record {
    count __count?;
    A_MatlStkInAcctMod[] results?;
};

# Represents the Queries record for the operation: listA_MaterialSerialNumbers
public type ListA_MaterialSerialNumbersQueries record {
    # Skip the first n items, see [Paging - Skip](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=66)
    int \$top?;
    # Filter items by property values, see [Filtering](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=64)
    string \$filter?;
    # Order items by property values, see [Sorting](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    A_MaterialSerialNumberOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    A_MaterialSerialNumberExpandOptions \$expand?;
    # Include count of items, see [Inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67)
    "allpages"|"none" \$inlinecount?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    A_MaterialSerialNumberSelectOptions \$select?;
};

public type A_MaterialStockExpandOptions ("to_MatlStkInAcctMod")[];

public type MatlStkInAcctModOfA_MaterialSerialNumberSelectOptions ("Material"|"Plant"|"StorageLocation"|"Batch"|"Supplier"|"Customer"|"WBSElementInternalID"|"SDDocument"|"SDDocumentItem"|"InventorySpecialStockType"|"InventoryStockType"|"WBSElementExternalID"|"MaterialBaseUnit"|"MatlWrhsStkQtyInMatlBaseUnit"|"to_MaterialSerialNumber"|"to_MaterialStock")[];

public type CollectionOfA_MaterialStock record {
    count __count?;
    A_MaterialStock[] results?;
};

public type CollectionOfA_MaterialSerialNumber record {
    count __count?;
    A_MaterialSerialNumber[] results?;
};

public type A_MaterialSerialNumberSelectOptions ("Material"|"SerialNumber"|"Plant"|"StorageLocation"|"InventorySpecialStockType"|"Batch"|"InventoryStockType"|"Equipment"|"Customer"|"Supplier"|"SDDocument"|"SDDocumentItem"|"WBSElementInternalID"|"WBSElementExternalID"|"to_MatlStkInAcctMod")[];

public type A_MatlStkInAcctModWrapper record {
    A_MatlStkInAcctMod d?;
};

public type A_MaterialStockOrderByOptions ("Material"|"Material desc"|"MaterialBaseUnit"|"MaterialBaseUnit desc")[];

public type MatlStkInAcctModOfA_MaterialSerialNumberOrderByOptions ("Material"|"Material desc"|"Plant"|"Plant desc"|"StorageLocation"|"StorageLocation desc"|"Batch"|"Batch desc"|"Supplier"|"Supplier desc"|"Customer"|"Customer desc"|"WBSElementInternalID"|"WBSElementInternalID desc"|"SDDocument"|"SDDocument desc"|"SDDocumentItem"|"SDDocumentItem desc"|"InventorySpecialStockType"|"InventorySpecialStockType desc"|"InventoryStockType"|"InventoryStockType desc"|"WBSElementExternalID"|"WBSElementExternalID desc"|"MaterialBaseUnit"|"MaterialBaseUnit desc"|"MatlWrhsStkQtyInMatlBaseUnit"|"MatlWrhsStkQtyInMatlBaseUnit desc")[];

# Represents the Queries record for the operation: listMatlStkInAcctModsOfA_MaterialSerialNumber
public type ListMatlStkInAcctModsOfA_MaterialSerialNumberQueries record {
    # Skip the first n items, see [Paging - Skip](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=66)
    int \$top?;
    # Filter items by property values, see [Filtering](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=64)
    string \$filter?;
    # Order items by property values, see [Sorting](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    MatlStkInAcctModOfA_MaterialSerialNumberOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    MatlStkInAcctModOfA_MaterialSerialNumberExpandOptions \$expand?;
    # Include count of items, see [Inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67)
    "allpages"|"none" \$inlinecount?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    MatlStkInAcctModOfA_MaterialSerialNumberSelectOptions \$select?;
};

public type CollectionOfA_MaterialStockWrapper record {
    CollectionOfA_MaterialStock d?;
};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://{host}:{port}";
|};

# Represents the Queries record for the operation: getA_MaterialSerialNumber
public type GetA_MaterialSerialNumberQueries record {
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    A_MaterialSerialNumberExpandOptions \$expand?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    A_MaterialSerialNumberSelectOptions \$select?;
};

public type A_MaterialSerialNumberWrapper record {
    A_MaterialSerialNumber d?;
};

public type A_MatlStkInAcctModExpandOptions ("to_MaterialSerialNumber"|"to_MaterialStock")[];

public type A_MaterialSerialNumber_to_MatlStkInAcctMod record {
    A_MatlStkInAcctMod[] results?;
};

public type MatlStkInAcctModOfA_MaterialStockSelectOptions ("Material"|"Plant"|"StorageLocation"|"Batch"|"Supplier"|"Customer"|"WBSElementInternalID"|"SDDocument"|"SDDocumentItem"|"InventorySpecialStockType"|"InventoryStockType"|"WBSElementExternalID"|"MaterialBaseUnit"|"MatlWrhsStkQtyInMatlBaseUnit"|"to_MaterialSerialNumber"|"to_MaterialStock")[];

# Represents the Queries record for the operation: listA_MatlStkInAcctMods
public type ListA_MatlStkInAcctModsQueries record {
    # Skip the first n items, see [Paging - Skip](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=66)
    int \$top?;
    # Filter items by property values, see [Filtering](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=64)
    string \$filter?;
    # Order items by property values, see [Sorting](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    A_MatlStkInAcctModOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    A_MatlStkInAcctModExpandOptions \$expand?;
    # Include count of items, see [Inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67)
    "allpages"|"none" \$inlinecount?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    A_MatlStkInAcctModSelectOptions \$select?;
};

public type A_MaterialStock record {
    # Material Number
    @constraint:String {maxLength: 40}
    string Material?;
    string? MaterialBaseUnit?;
    A_MaterialSerialNumber_to_MatlStkInAcctMod to_MatlStkInAcctMod?;
};

public type A_MaterialSerialNumberOrderByOptions ("Material"|"Material desc"|"SerialNumber"|"SerialNumber desc"|"Plant"|"Plant desc"|"StorageLocation"|"StorageLocation desc"|"InventorySpecialStockType"|"InventorySpecialStockType desc"|"Batch"|"Batch desc"|"InventoryStockType"|"InventoryStockType desc"|"Equipment"|"Equipment desc"|"Customer"|"Customer desc"|"Supplier"|"Supplier desc"|"SDDocument"|"SDDocument desc"|"SDDocumentItem"|"SDDocumentItem desc"|"WBSElementInternalID"|"WBSElementInternalID desc"|"WBSElementExternalID"|"WBSElementExternalID desc")[];

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type MaterialStockOfA_MatlStkInAcctModExpandOptions ("to_MatlStkInAcctMod")[];

# Represents the Queries record for the operation: listMatlStkInAcctModsOfA_MaterialStock
public type ListMatlStkInAcctModsOfA_MaterialStockQueries record {
    # Skip the first n items, see [Paging - Skip](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=66)
    int \$top?;
    # Filter items by property values, see [Filtering](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=64)
    string \$filter?;
    # Order items by property values, see [Sorting](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=65)
    MatlStkInAcctModOfA_MaterialStockOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    MatlStkInAcctModOfA_MaterialStockExpandOptions \$expand?;
    # Include count of items, see [Inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67)
    "allpages"|"none" \$inlinecount?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    MatlStkInAcctModOfA_MaterialStockSelectOptions \$select?;
};

# Represents the Queries record for the operation: getA_MatlStkInAcctMod
public type GetA_MatlStkInAcctModQueries record {
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    A_MatlStkInAcctModExpandOptions \$expand?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    A_MatlStkInAcctModSelectOptions \$select?;
};

public type MatlStkInAcctModOfA_MaterialStockExpandOptions ("to_MaterialSerialNumber"|"to_MaterialStock")[];

public type CollectionOfA_MatlStkInAcctModWrapper record {
    CollectionOfA_MatlStkInAcctMod d?;
};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Represents the Queries record for the operation: getA_MaterialStock
public type GetA_MaterialStockQueries record {
    # Expand related entities, see [Expand](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=63)
    A_MaterialStockExpandOptions \$expand?;
    # Select properties to be returned, see [Select](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=68)
    A_MaterialStockSelectOptions \$select?;
};

public type CollectionOfA_MaterialSerialNumberWrapper record {
    CollectionOfA_MaterialSerialNumber d?;
};

public type MaterialSerialNumberOfA_MatlStkInAcctModOrderByOptions ("Material"|"Material desc"|"SerialNumber"|"SerialNumber desc"|"Plant"|"Plant desc"|"StorageLocation"|"StorageLocation desc"|"InventorySpecialStockType"|"InventorySpecialStockType desc"|"Batch"|"Batch desc"|"InventoryStockType"|"InventoryStockType desc"|"Equipment"|"Equipment desc"|"Customer"|"Customer desc"|"Supplier"|"Supplier desc"|"SDDocument"|"SDDocument desc"|"SDDocumentItem"|"SDDocumentItem desc"|"WBSElementInternalID"|"WBSElementInternalID desc"|"WBSElementExternalID"|"WBSElementExternalID desc")[];

public type A_MatlStkInAcctMod_to_MaterialSerialNumber record {
    A_MaterialSerialNumber[] results?;
};
