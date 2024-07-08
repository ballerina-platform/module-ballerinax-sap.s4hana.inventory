# Warehouse Automation through S/4 HANA Integration

Utilize the `sap.s4hana.api_material_document_srv:Client` for seamless API interactions with the S/4HANA system. This
example highlights the use of Eden AI OCR technology for the automatic digitization of paper delivery notes. The
processed data facilitates the creation of material documents in S/4HANA, showcasing an innovative approach to warehouse
management and operational documentation.

## Prerequisites

### 1. Setup the S/4HANA API

Refer to the Setup Guide for necessary credentials (hostname, username, password).

### 2. Setup an Eden AI account

Create an Eden AI account. Generate an API token and save it for later use, as specified in the Configuration section.

### 3. Configuration

Configure S/4HANA API credentials in Config.toml in the example directory:

```
ocrToken = "<ocrToken>"
invoiceUrl = "<invoiceUrl>" # Optional. URL the invoice to be processed is exposed

[s4hanaClientConfig]
username = "<Username>"
password = "<Password>"
hostname = "<Hostname>"
```

## Run the Example

Execute the following command to run the example:

```bash
bal run
```
