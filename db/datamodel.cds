namespace dbmedia;

using {
    cuid,
    managed
} from '@sap/cds/common';

using {common.db as common} from './common';

context transcation {

    entity supplier_request : cuid, managed {

        DigressionVendorCodeVal : Date                     @mandatory; //"Type of vendor code creation request" = "Digression vendor code"
        IsRelPartyVCode         : Boolean                  @mandatory; //Mandatory, visible when "Supplier Type" = "Local GST & Non-GST"
        SpendType               : common.SpendTypeT        @mandatory; // Mandatory, visible when "Supplier Type" = "Local GST & Non-GST"
        NatureOfActivity        : common.NatureOfActivityT @mandatory;
        Sector                  : array of common.SectorT  @mandatory; //more than one value
        FunAndSubfun            : array of String(100) not null; // we will modify this later on
        PANCardNo               : common.PanCardT not null;
        GSTIN                   : common.GstInT not null; //gst no.
        Attachments             : Association to many attachments
                                      on Attachments.Req_Supplier = $self;
        SFullName               : String(100) not null; // Supplier Full Legal Name
        STradeNameGST           : String(100); // Supplier Trade Name (GST)
        SAddress                : String(255); // Supplier Address
        SAddressGST             : String(255); // Supplier Address (GST)

        PriContactFName         : String(50); // Primary Contact First Name
        PriContactLName         : String(50); // Primary Contact Last Name
        PriContactEmail         : String(64); // It needs validation
        PriContactMNumber       : String(15); // Needs validation


    };

    entity attachments {
        Req_Supplier        : Association to supplier_request;
        OnBoarding_Supplier : Association to supplier_on_boarding;
        Doc_TypeID          : String;
        Attachment_ID       : Int16;
        image               : LargeBinary @Core.MediaType: imageType;
        imageType           : String      @Core.IsMediaType;


    };

    entity supplier_on_boarding : cuid, managed {

        GSTINType                  : common.GSTINTypeT                @mandatory; // GSTIN Type
        Attachments                : Association to many attachments
                                         on Attachments.OnBoarding_Supplier = $self;

        EInvoiceApplicability      : Boolean                          @mandatory; // E-Invoice Applicability
        GSTRFiler                  : common.GSTRFilerT                @mandatory; // GSTR-3B / GSTR-1 Filer
        SOrgType                   : common.SupplierOrganizationTypeT @mandatory; // Supplier Organization Type

        CINNumber                  : common.CINNumberT; // CIN No. (Corporate or Company Identification No.)
        RegTaxID                   : String(100)                      @mandatory; // Registration / Tax ID

        TANNumber                  : String(100)                      @mandatory; // TAN Number
        EPFONumber                 : String(20)                       @mandatory; // EPFO Number

        DUNSNumber                 : common.DUNSNumberT; // DUNS Number
        LEINumber                  : String(20); // LEI Number

        MainTelNumber              : String(20); // Main Telephone Number
        UDYAMNumber                : String(20);
        @mandatory // UDYAM Number (If MSME is Yes)
        IndustryType               : common.IndustryTypeT;
        @mandatory // Type of Industry
        MSMEType                   : common.MSMETypeT;
        @mandatory // MSME Certificate
        CountryCode                : String(2);
        @mandator // ISO/TS 9001 Certificate
        ISOTS9001CertNo            : String(100)                      @mandatory; // ISO/TS 9001 Certificate Number

        ISOTS9001ExpDate           : DateTime                         @mandatory; // ISO/TS 9001 Certificate Expiry Date

        @mandatory ISO16949CertNo  : String(64);
        @mandatory ISO16949ExpDate : DateTime;
        @mandatory // ISO 14001 Certificate
        ISO14001CertNo             : String(100);
        @mandatory // ISO 14001 Certificate Number
        ISO14001ExpDate            : DateTime;
        @mandatory // ISO 45001 Certificate
        ISO45001CertNo             : String(100);
        @mandatory // ISO 45001 Certificate Number
        ISO45001ExpDate            : DateTime;
        @mandatory // Factory License
        FactoryLicenseNo           : String(100);
        @mandatory // Factory License Number
        FactoryLicenseExpDate      : DateTime;
        @mandatory // Factory License Expiry Date

        ConsentToOperateCert       : String(255);
        @mandatory // Consent to Operate Certificate
        ConsentToOperateCertNo     : String(100);
        @mandatory // Consent to Operate Certificate Number
        ConsentToOperateExpDate    : DateTime;
        @mandatory // Fire NOC Certificate
        FireNOCCertNo              : String(100);
        @mandatory // Fire NOC Certificate Number
        FireNOCCertExpDate         : Date;
        @mandatory // Fire NOC Certificate Expiry Date


        WageAgreementCert          : String(255);
        @mandatory // Wage Agreement Certificate
        WageAgreementCertNo        : String(100);
        @mandatory // Wage Agreement Certificate Number
        WageAgreementExpDate       : Date;
        @mandatory // Wage Agreement Certificate Expiry Date

        ///end of certificates

        PaymentTerms               : String(255);
        @mandatory // Payment Terms
        IncotermsCode              : common.IncotermsCodeT; // Incoterms Code
        IncotermsLocation          : String(255)                      @mandatory; // Incoterms Location explained 2
        SupplierFullLegalName      : String(100)                      @mandatory;
        BankCountry                : String(2);
        @mandatory // Bank Country
        BankName                   : String(255);
        @mandatory // Bank Name
        BankKey                    : String(11);
        @mandatory // Bank Key (IFSC Code)
        IBANCode                   : String(34); // IBAN Code / SWIFT Code --- non india
        BankStreetAdd              : String(255);
        @mandatory // Bank Street Address
        BankAccountNo              : String(34);
        @mandatory // Bank Account Number
        ReConfirmBankAccNo         : String(34);
        @mandatory // Re-confirm Bank Account Number
        BankAccType                : common.BankAccountTypeT;
        @mandatory // Bank Account Type
        PostalCode                 : String(10);
        @mandatory // Postal Code
        City                       : String(100);
        @mandatory // City / Village
        BranchName                 : String(100);
        @mandatory // Branch Name
        State                      : common.StateChoiceT;
        @mandatory // State
        RegionCode                 : String(3); // Region Code for Foreign Account

    }


}
