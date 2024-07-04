type SAPAuthConfig record {|
    string username;
    string password;
    string hostname;
|};

type ExtractedInvoice record {
    record {
        PaperInvoice[] extracted_data;
    } eden\-ai;
};

type PaperInvoice record {
    string invoice_number;
    record { string customer_name;} customer_information;
    record { string merchant_name;} merchant_information;
    InvoiceItem[] item_lines;
};

type InvoiceItem record {
    string description;
    int quantity;
};

type SAPMaterialDocument record {
    string MaterialDocumentYear;
    string MaterialDocument;
    OrderItem[] OrderItem;
};

type OrderItem record {
    string Description;
    int OrderQuantity;
};

