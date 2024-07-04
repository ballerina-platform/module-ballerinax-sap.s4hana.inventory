// Define a type for the metadata
type Metadata record {
    string id;
    string uri;
    string dataType;
};

// Define a type for the inventory item
type InventoryItem record {
    string Material;
    string MaterialBaseUnit;
    string MatlWrhsStkQtyInMatlBaseUnit;
    Metadata __metadata;
};

// Define a type for the response
type SAPResponse record {
    record {
        InventoryItem[] results;
    } d;
};
