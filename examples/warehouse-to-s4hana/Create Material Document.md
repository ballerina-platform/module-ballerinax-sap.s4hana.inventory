# Create material document by extracting information from invoices using Eden AI

This example demonstrates how to utilize the `sap.s4hana.api_material_document_srv:Client` in Ballerina for interactions with the S/4HANA API. It showcases the integration of the Eden AI OCR service to extract data from invoice images uploaded to the system, and subsequently create material documents in the S/4HANA system.

## Prerequisites
### 1. Setup the S/4HANA API
Refer to the Setup Guide for necessary credentials (hostname, username, password).

### 2. Configuration
Configure S/4HANA API credentials in Config.toml in the example directory:

[sapAuthConfig]
username = "<Username>"
password = "<Password>"
hostname = "<Hostname>"

[wso2.material_management]
ocrToken = "<ocrToken>"
invoiceUrl = "<invoiceUrl>"

## Run the Example

Execute the following command to run the example:

```bash
bal run
```
