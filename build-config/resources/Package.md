## Package Overview

[S/4HANA](https://www.sap.com/india/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE.

@description@

## Setup guide

1. Sign in to your S/4HANA dashboard.

2. Under the `Communication Management` section, click on the `Display Communications Scenario` title.

   ![Display Scenarios](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-1-display-scenarios.png)

3. In the search bar, type `@communication-scenario@` and select the corresponding scenario from the results.

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

To use the `@package-name@` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `@package-name@` module.

```ballerina
@import-statement@
```

### Step 2: Instantiate a new connector

Use the hostname and credentials to initiate a client

```ballerina
configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

@client-init@
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
@api-invocation@
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

Discover the capabilities of the S/4 HANA Inventory connectors with a collection
of [examples](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples). These
examples showcase the connectors' ability to facilitate seamless integration with the S/4HANA system across diverse
scenarios, including the digitization of paper delivery notes and enhancing point-of-sale (POS) systems for direct S/4
HANA communication.

1. [POS Integration with S/4 HANA](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples/pos-to-s4hana) -
   Dive into how the `sap.s4hana.api_material_stock_srv:Client` and `sap.s4hana.ce_apireservationdocument_0001:Client`
   can be leveraged in Ballerina for robust integration with S/4HANA APIs. This example focuses on the automatic
   creation of reservation documents based on real-time stock availability, demonstrating an efficient inventory
   management process.

2. [Warehouse Automation through S/4 HANA Integration](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples/warehouse-to-s4hana) -
   Utilize the `sap.s4hana.api_material_document_srv:Client` for seamless API interactions with the S/4HANA system. This
   example highlights the use of Eden AI OCR technology for the automatic digitization of paper delivery notes. The
   processed data facilitates the creation of material documents in S/4HANA, showcasing an innovative approach to
   warehouse management and operational documentation.

## Report Issues

To report bugs, request new features, start new discussions, view project boards, etc., go to
the [Ballerina library parent repository](https://github.com/ballerina-platform/ballerina-library).

## Useful Links

- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.