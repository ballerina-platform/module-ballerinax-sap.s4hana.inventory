# Examples

Discover the capabilities of the S/4 HANA Inventory connectors with a collection
of [examples](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples). These
examples showcase the connectors' ability to facilitate seamless integration with the S/4HANA system across diverse
scenarios, including the digitization of paper delivery notes and enhancing point-of-sale (POS) systems for direct S/4
HANA communication.

1. [POS Integration with S/4 HANA](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.qm/tree/main/examples/pos-to-s4hana) -
   Dive into how the `sap.s4hana.api_material_stock_srv:Client` and `sap.s4hana.ce_apireservationdocument_0001:Client`
   can be leveraged in Ballerina for robust integration with S/4HANA APIs. This example focuses on the automatic
   creation of reservation documents based on real-time stock availability, demonstrating an efficient inventory
   management process.

2. [Warehouse Automation through S/4 HANA Integration](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.qm/tree/main/examples/warehouse-to-s4hana) -
   Utilize the `sap.s4hana.api_material_document_srv:Client` for seamless API interactions with the S/4HANA system. This
   example highlights the use of Eden AI OCR technology for the automatic digitization of paper delivery notes. The
   processed data facilitates the creation of material documents in S/4HANA, showcasing an innovative approach to
   warehouse management and operational documentation.

## Prerequisites

Each example includes detailed steps.

## Running an Example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the Examples with the Local Module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the
module is manually written to the central repository as a workaround. Consequently, the bash script may modify your
local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```