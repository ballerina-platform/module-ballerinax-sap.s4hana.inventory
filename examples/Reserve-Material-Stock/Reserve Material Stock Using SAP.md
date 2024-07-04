# Reserve material stock for items with low inventory levels
This example illustrates how to leverage the `sap.s4hana.ce_apireservationdocument_0001:Client` and `sap.s4hana.api_material_stock_srv:Client` in Ballerina for S/4HANA API interactions. It demonstrates how to reserve material stocks when the inventory levels are low.

## Prerequisites
### 1. Setup the S/4HANA API
Refer to the Setup Guide for necessary credentials (hostname, username, password).

### 2. Configuration
Configure S/4HANA API credentials in Config.toml in the example directory:

[s4hanaClientConfig]
hostname = "<Hostname>"
username = "<Username>"
password = "<Password>"


## Run the Example

Execute the following command to run the example:

1. Run the Ballerina service that listens on port 9090.
   `bal run <service_file.bal>`

2. Use curl to send a GET request with query parameters to the service.
   `curl "http://localhost:9090/material/stock?material1=100&material2=200"`
