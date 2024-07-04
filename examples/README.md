# Examples

The S/4 HANA Inventory connectors provide practical examples illustrating usage in various
scenarios. Explore
these [examples](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples), covering
use cases like accessing S/4HANA Reservation Document (A2X), Material Stock API, and Material Document API.

1. [Reserve Material Stock](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.qm/tree/main/examples/Reserve-Material-Stock) -
   Demonstrates leveraging the `sap.s4hana.api_material_stock_srv:Client` and `sap.s4hana.ce_apireservationdocument_0001:Client` in Ballerina for S/4HANA API interactions. It specifically showcases how to check material stock levels and create reservation documents based on stock availability in the S/4HANA system.

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