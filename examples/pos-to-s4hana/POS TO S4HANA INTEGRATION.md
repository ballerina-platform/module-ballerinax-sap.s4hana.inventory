# POS Integration with S/4 HANA

Dive into how the `sap.s4hana.api_material_stock_srv:Client` and `sap.s4hana.ce_apireservationdocument_0001:Client` can
be leveraged in Ballerina for robust integration with S/4HANA APIs. This example focuses on the automatic creation of
reservation documents based on real-time stock availability, demonstrating an efficient inventory management process.

## Prerequisites

### 1. Setup the S/4HANA API

Refer to the Setup Guide for necessary credentials (hostname, username, password).

### 2. Configuration

Configure S/4HANA API credentials in Config.toml in the example directory:

```toml
[s4hanaClientConfig]
hostname = "<Hostname>"
username = "<Username>"
password = "<Password>"
```

## Run the Example

Execute the following command to run the example:

1. Run the Ballerina service that listens on port 9090.
   ```
   bal run
   ```

2. Use curl to send a POST request with query parameters to the service.
   ```bash
   curl "http://localhost:9090/material/stock?material1=100&material2=200"
   ```
