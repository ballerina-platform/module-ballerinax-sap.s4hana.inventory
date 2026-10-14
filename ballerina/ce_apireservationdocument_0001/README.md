## Overview

[SAP S/4HANA](https://www.sap.com/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE. It covers core business processes such as finance, procurement, sales,
and materials management, including inventory and warehouse operations.

WSO2 SAP S/4HANA Reservation Document (A2X) provides a way to interact with the [Reservation Document (A2X) API](https://api.sap.com/api/CE_APIRESERVATIONDOCUMENT_0001/overview). The service allows to create, update and delete reservation documents for materials, assign them to cost centers, sales orders or assets, and handle transfer postings between plants.

### Key Features

- Create reservation documents through the OData V4 Reservation Document (A2X) API
- Assign reservations to cost centers, sales orders or assets
- Read, update and delete reservation documents and their items

## Setup guide

This connector uses **Basic Authentication** with an SAP S/4HANA Cloud communication user. Each S/4HANA API is
exposed through a communication scenario, so the user must be assigned to a communication arrangement for the
**Reservation Integration (`SAP_COM_0112`)** scenario before the connector can call it.

All the apps used below are in the **Communication Management** group of the SAP Fiori launchpad.

![Communication Management apps](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-1-display-scenarios.png)

### Step 1: Create a communication user

1. Sign in to your SAP S/4HANA Cloud system as an administrator.
2. Open the **Maintain Communication Users** app and choose **New**.
3. Enter a user name and a description, set a password, and choose **Create**.

Note the user name and password. These are the credentials the connector uses.

### Step 2: Create a communication system

1. Open the **Communication Systems** app and choose **New**.
2. Enter a system ID and a system name, and choose **Create**.

   ![Create a communication system](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/main/docs/setup/s4-1-communication-system.png)

3. Under **General** > **Technical Data**, enter a host name and a **Logical System** (an uppercase ID of up to
   10 characters, for example, `INTEGRATOR`). Some scenarios refuse to activate when the logical system is empty.
4. Under **Users for Inbound Communication**, add the communication user from Step 1 with the
   **User Name and Password** authentication method.

   ![Add the communication user for inbound communication](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/main/docs/setup/s4-2-communication-system-users.png)

5. Choose **Save**.

### Step 3: Create a communication arrangement

1. Open the **Communication Arrangements** app and choose **New**.
2. In the **Scenario** value help, search for **Reservation Integration** and select **`SAP_COM_0112`**.
   This is the scenario that exposes `CE_APIRESERVATIONDOCUMENT_0001`, the service this connector calls.

   > **Note:** The screenshots in this step show an arrangement for the Material Document Integration
   > (`SAP_COM_0108`) scenario as an example. The scenario this connector needs is
   > **Reservation Integration (`SAP_COM_0112`)**.

   ![Search for the communication scenario](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/main/docs/setup/s4-3-search-scenario.png)

3. Enter a unique name for the arrangement and choose **Create**.

   ![Name the communication arrangement](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/main/docs/setup/s4-4-new-arrangement.png)

4. Select the communication system from Step 2. The communication user from Step 1 is filled in as the inbound user.
   If the scenario lists outbound services that the integration does not need, clear their **Active** check boxes so
   that no outbound user is required.

   ![Communication arrangement details](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/main/docs/setup/s4-5-arrangement-details.png)

5. Choose **Save**.

### Step 4: Note the hostname

Open the saved arrangement. The **API-URL** next to **Own SAP Cloud System** shows the hostname
(`<unique id>-api.s4hana.cloud.sap`).

![View Hostname](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-6-view-hostname.png)

You now have everything the connector needs:

- **hostname** - the API hostname, for example, `my123456-api.s4hana.cloud.sap`
- **username** - the communication user name
- **password** - the communication user password

## Quickstart

To use the `sap.s4hana.ce_apireservationdocument_0001` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `sap.s4hana.ce_apireservationdocument_0001` module.

```ballerina
import ballerinax/sap.s4hana.ce_apireservationdocument_0001 as ceRsvDoc;
```

### Step 2: Instantiate a new connector

Use the hostname and credentials to initiate a client.

```ballerina
configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

ceRsvDoc:Client ceReservationDocumentClient = check new (
    {
      auth: {
        username,
        password
      }
    },
    hostname
);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

```ballerina
ceRsvDoc:CollectionOfA_ReservationDocumentItem_2 listReservationDocItems = check ceReservationDocumentClient->listReservationDocumentItems();
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The SAP S/4HANA Inventory Ballerina connectors provide practical examples illustrating usage in various scenarios.
Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples),
covering use cases like point-of-sale stock reservations and warehouse document automation.

1. [POS Integration with S/4HANA](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples/pos-to-s4hana) -
   Check real-time material stock and create reservation documents in S/4HANA from point-of-sale orders.

2. [Warehouse Automation through S/4HANA Integration](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.inventory/tree/main/examples/warehouse-to-s4hana) -
   Digitize paper delivery notes with OCR and create material documents in S/4HANA from the extracted data.
