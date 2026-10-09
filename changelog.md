# Changelog

This file contains all the notable changes done to the Ballerina `sap.s4hana.inventory` related packages through the
releases.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## sap.s4hana.api_material_document_srv

## [Unreleased]

### Added

- Initial client implementation

### Changed

- Updated the `ballerinax/sap` dependency to 1.4.0
- Updated the Ballerina distribution to 2201.13.0 (Swan Lake Update 13)
- Modernized `ConnectionConfig` to match the `ballerinax/sap` base connector: `http1Settings` is now `http:ClientHttp1Settings`, added `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`, and `http2Settings`, `cache` and `responseLimits` default to empty records; the local `ClientHttp1Settings` and `ProxyConfig` records are removed (use `proxy` on the connection config)

### Fixed

- Fixed the test suite running against the mock server unless `IS_TEST_ON_S4HANA_SERVER` was set to `false`; it now runs against a live server only when the variable is `true`

## sap.s4hana.api_material_stock_srv

## [Unreleased]

### Added

- Initial client implementation

### Changed

- Updated the `ballerinax/sap` dependency to 1.4.0
- Updated the Ballerina distribution to 2201.13.0 (Swan Lake Update 13)
- Modernized `ConnectionConfig` to match the `ballerinax/sap` base connector: `http1Settings` is now `http:ClientHttp1Settings`, added `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`, and `http2Settings`, `cache` and `responseLimits` default to empty records; the local `ClientHttp1Settings` and `ProxyConfig` records are removed (use `proxy` on the connection config)

### Fixed

- Fixed the test suite running against the mock server unless `IS_TEST_ON_S4HANA_SERVER` was set to `false`; it now runs against a live server only when the variable is `true`

## sap.s4hana.api_physical_inventory_doc_srv

## [Unreleased]

### Added

- Initial client implementation

### Changed

- Updated the `ballerinax/sap` dependency to 1.4.0
- Updated the Ballerina distribution to 2201.13.0 (Swan Lake Update 13)
- Modernized `ConnectionConfig` to match the `ballerinax/sap` base connector: `http1Settings` is now `http:ClientHttp1Settings`, added `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`, and `http2Settings`, `cache` and `responseLimits` default to empty records; the local `ClientHttp1Settings` and `ProxyConfig` records are removed (use `proxy` on the connection config)

### Fixed

- Fixed the test suite running against the mock server unless `IS_TEST_ON_S4HANA_SERVER` was set to `false`; it now runs against a live server only when the variable is `true`
- Renamed the generated types `Modified\ A_PhysInventoryDocItemType` and `Modified\ A_SerialNumberPhysInventoryDocType` to `ModifiedA_PhysInventoryDocItemType` and `ModifiedA_SerialNumberPhysInventoryDocType`

## sap.s4hana.api_reservation_document_srv

## [Unreleased]

### Added

- Initial client implementation

### Changed

- Updated the `ballerinax/sap` dependency to 1.4.0
- Updated the Ballerina distribution to 2201.13.0 (Swan Lake Update 13)
- Modernized `ConnectionConfig` to match the `ballerinax/sap` base connector: `http1Settings` is now `http:ClientHttp1Settings`, added `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`, and `http2Settings`, `cache` and `responseLimits` default to empty records; the local `ClientHttp1Settings` and `ProxyConfig` records are removed (use `proxy` on the connection config)

### Fixed

- Fixed the test suite running against the mock server unless `IS_TEST_ON_S4HANA_SERVER` was set to `false`; it now runs against a live server only when the variable is `true`

## sap.s4hana.ce_apireservationdocument_0001

## [Unreleased]

### Added

- Initial client implementation

### Changed

- Updated the `ballerinax/sap` dependency to 1.4.0
- Updated the Ballerina distribution to 2201.13.0 (Swan Lake Update 13)
- Modernized `ConnectionConfig` to match the `ballerinax/sap` base connector: `http1Settings` is now `http:ClientHttp1Settings`, added `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`, and `http2Settings`, `cache` and `responseLimits` default to empty records; the local `ClientHttp1Settings` and `ProxyConfig` records are removed (use `proxy` on the connection config)

### Fixed

- Fixed the test suite running against the mock server unless `IS_TEST_ON_S4HANA_SERVER` was set to `false`; it now runs against a live server only when the variable is `true`
