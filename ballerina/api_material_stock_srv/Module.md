## Overview

[S/4HANA](https://www.sap.com/india/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE.

The `ballerinax/sap.s4hana.api_material_stock_srv` package provides APIs that enable seamless integration with the [Material Stock - Read API v1.1.0](https://api.sap.com/api/API_MATERIAL_STOCK_SRV/overview). This service enables you to retrieve material stock information using the OData protocol with filter data provided in the payload. It can be consumed by external warehouse applications.

## Setup guide

1. Sign in to your S/4HANA dashboard.

2. Under the `Communication Management` section, click on the `Display Communications Scenario` title.

   ![Display Scenarios](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-1-display-scenarios.png)

3. In the search bar, type `Material Stock Integration` and select the corresponding scenario from the results.

   ![Search Sales Order](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-2-search-sales-order.png)

4. In the top right corner of the screen, click on `Create Communication Arrangement`.

   ![Click Create Arrangement](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-3-click-create-arrangement.png)

5. Enter a unique name for the arrangement.

   ![Give Arrangement Name](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-4-give-arrangement-name.png)

6. Choose an existing `Communication System` from the dropdown menu and save your arrangement.

   ![Select Existing Communication Arrangement](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-5-select-communication-system.png)

7. The hostname (`<unique id>-api.s4hana.cloud.sap`) will be displayed in the top right corner of the screen.

   ![View Hostname](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-6-view-hostname.png)

## Quickstart

To use the `sap.s4hana.api_material_stock_srv` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `sap.s4hana.api_material_stock_srv` module.

```ballerina
import ballerinax/sap.s4hana.api_material_stock_srv as materialstock;
```

### Step 2: Instantiate a new connector

Use the hostname and credentials to initiate a client

```ballerina
configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

materialstock:Client materialStockClient = check new (
    hostname = hostname,
    config = {
        auth: {
            username,
            password
        }
    }
);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

```ballerina
materialstock:CollectionOfA_MaterialStockWrapper listAMaterialStocks = check materialStockClient->listA_MaterialStocks();
```

### Step 4: Run the Ballerina application

```bash
bal run
```
