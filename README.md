# Ballerina SAP S/4HANA Inventory Connectors

[![Build](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-sap.s4hana.inventory.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/s4hana.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fs4hana)

[SAP S/4HANA](https://www.sap.com/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE. It covers core business processes such as finance, procurement, sales,
and materials management, including inventory and warehouse operations.

This repository encompasses all Ballerina packages pertaining to the SAP S/4HANA Inventory module. Notably:

1. [SAP S/4HANA Material Document](ballerina/api_material_document_srv) provides a way to interact with the
   [Material Document - Read, Create API](https://api.sap.com/api/API_MATERIAL_DOCUMENT_SRV/overview).
   The service allows to retrieve and create material documents, for example, to post a goods receipt for a purchase
   order or to document the transfer of materials between two storage locations, and to cancel existing material
   documents or single items.

2. [SAP S/4HANA Material Stock](ballerina/api_material_stock_srv) provides a way to interact with the
   [Material Stock - Read API](https://api.sap.com/api/API_MATERIAL_STOCK_SRV/overview).
   The service allows to retrieve material stock information, for example, for consumption by external warehouse
   applications.

3. [SAP S/4HANA Physical Inventory Document](ballerina/api_physical_inventory_doc_srv) provides a way to interact
   with the [Physical Inventory Documents - Read, Create API](https://api.sap.com/api/API_PHYSICAL_INVENTORY_DOC_SRV/overview).
   The service allows to read and create physical inventory documents.

4. [SAP S/4HANA Reservation Document](ballerina/api_reservation_document_srv) provides a way to interact with the
   [Reservation Document API](https://api.sap.com/api/API_RESERVATION_DOCUMENT_SRV/overview).
   The service allows to retrieve, create and delete reservation documents.

5. [SAP S/4HANA Reservation Document (A2X)](ballerina/ce_apireservationdocument_0001) provides a way to interact
   with the [Reservation Document (A2X) API](https://api.sap.com/api/CE_APIRESERVATIONDOCUMENT_0001/overview).
   The service allows to create, update and delete reservation documents for materials, assign them to cost centers,
   sales orders or assets, and handle transfer postings between plants.

## Issues and projects

The **Issues** and **Projects** tabs are disabled for this repository as this is part of the Ballerina library. To
report bugs, request new features, start new discussions, view project boards, etc., visit the Ballerina
library [parent repository](https://github.com/ballerina-platform/ballerina-library).

This repository only contains the source code for the package.

## Build from the source

### Prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following
   sources:

   * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
   * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was
   installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

### Build options

Execute the commands below to build from the source.

1. To build all packages:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests in all packages:

   ```bash
   ./gradlew clean test
   ```

3. To build without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To build only one specific package:

   ```bash
   ./gradlew clean :inventory-ballerina:<module_name>:build
   ```

   | Module Name                    | Connector                                            |
   |--------------------------------|------------------------------------------------------|
   | api_material_document_srv      | ballerinax/sap.s4hana.api_material_document_srv      |
   | api_material_stock_srv         | ballerinax/sap.s4hana.api_material_stock_srv         |
   | api_physical_inventory_doc_srv | ballerinax/sap.s4hana.api_physical_inventory_doc_srv |
   | api_reservation_document_srv   | ballerinax/sap.s4hana.api_reservation_document_srv   |
   | ce_apireservationdocument_0001 | ballerinax/sap.s4hana.ce_apireservationdocument_0001 |

5. To run tests against a live server, add a `tests/Config.toml` file to the package with the live server details
   and run the tests (`Config.toml` files are ignored by Git):

   ```toml
   isTestOnLiveServer = true
   hostname = "<unique id>-api.s4hana.cloud.sap"
   username = "<communication user>"
   password = "<password>"
   ```

   **Note**: Tests are run against the mock server by default.

6. To debug packages with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

7. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

8. Publish the generated artifacts to the local Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToLocalCentral=true
   ```

9. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`sap` package](https://lib.ballerina.io/ballerinax/sap/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
