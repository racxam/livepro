namespace dbmedia;

using {
    cuid,
    managed
} from '@sap/cds/common';

using {common.db as common} from './common';

entity Files : cuid, managed {
    @Core.MediaType  : mediaType
    content   : LargeBinary;

    @Core.IsMediaType: true
    mediaType : String;
    fileName  : String;
    size      : Integer;
    url       : String;

};



context transcation {

    entity supplier_request : cuid, managed {

        ValidiOfDigressionVendorCodeUpto     : Date                     @mandatory; //"Type of vendor code creation request" = "Digression vendor code"
        IsRelatedPartyVendorCode             : Boolean                  @mandatory; //Mandatory, visible when "Supplier Type" = "Local GST & Non-GST"
        SupplierSpendType                    : common.SpendTypeT        @mandatory; // Mandatory, visible when "Supplier Type" = "Local GST & Non-GST"
        NatureOfActivity                     : common.NatureOfActivityT @mandatory;
        Sector                               : array of common.SectorT @mandatory; //more than one value
        FunctionAndSubfunction               : array of String(100) not null; // we will modify this later on
        PANCardNo                            : common.PanCardT not null;
        PANCardAttachment                    : Binary not null; //attachment
        GSTIN                                : common.GstInT not null; //gst no.
        GSTRegistrationCertificateAttachment : Binary; // attachment...


        SupplierFullLegalName                : String(100) not null; // Supplier Full Legal Name
        SupplierTradeNameGST                 : String(100); // Supplier Trade Name (GST)
        SupplierAddress                      : String(255); // Supplier Address
        SupplierAddressGST                   : String(255); // Supplier Address (GST)

        PrimaryContactFirstName              : String(50); // Primary Contact First Name
        PrimaryContactLastName               : String(50); // Primary Contact Last Name
        PrimaryContactEmail                  : String(64); // It needs validation
        PrimaryContactMobileNumber           : String(15); // Needs validation


    };

    entity SupplierOnBoarding : cuid, managed {
        SupplierCOCDeclaration      : Binary                           @mandatory;
        GSTINType                   : common.GSTINTypeT                @mandatory; // GSTIN Type
        VendorEvaluation            : Binary; // Vendor Evaluation
        EInvoiceApplicability       : Boolean                          @mandatory; // E-Invoice Applicability
        GSTRFiler                   : common.GSTRFilerT                @mandatory; // GSTR-3B / GSTR-1 Filer
        SupplierOrganizationType    : common.SupplierOrganizationTypeT @mandatory; // Supplier Organization Type
        CINAttachment               : Binary                           @mandatory; // CIN Attachment (Certificate)
        CINNumber                   : common.CINNumberT; // CIN No. (Corporate or Company Identification No.)
        RegistrationTaxID           : String(100)                      @mandatory; // Registration / Tax ID
        RegistrationTaxIDAttachment : Binary                           @mandatory; // Registration / Tax ID Attachment
        TANNumber                   : String(100)                      @mandatory; // TAN Number
        EPFONumber                  : String(20)                       @mandatory; // EPFO Number
        EPFOCertificate             : Binary                           @mandatory; // EPFO Certificate
        DUNSNumber                  : common.DUNSNumberT; // DUNS Number
        LEINumber                   : String(20); // LEI Number
        LEICertificate              : Binary; // LEI Certificate
        MainTelephoneNumber         : String(20); // Main Telephone Number
        UDYAMNumber                 : String(20); // UDYAM Number (If MSME is Yes)
        IndustryType                : common.IndustryTypeT; // Type of Industry
        MSMEType                    : common.MSMETypeT; // MSME Type
        MSMECertificate             : Binary; // MSME Certificate
        CountryCode                 : String(2); // Country Code (IN for India)
        DSAAgreement                : Binary; // DSA Agreement
        NDAAgreement                : Binary; // Non Disclosure Agreement (NDA)

        //start of certificates
        ISOTS9001CertAttachment     : Binary; // ISO/TS 9001 Certificate
        ISOTS9001CertNumber         : String(100)                      @mandatory; // ISO/TS 9001 Certificate Number

        ISOTS9001ExpiryDate         : DateTime                         @mandatory; // ISO/TS 9001 Certificate Expiry Date
        ISO16949CertAttachment      : Binary;
        ISO16949CertNumber          : String(64);
        ISO16949ExpiryDate          : DateTime;
        ISO14001CertAttachment      : Binary; // ISO 14001 Certificate
        ISO14001CertNumber          : String(100); // ISO 14001 Certificate Number
        ISO14001ExpiryDate          : DateTime; // ISO 14001 Certificate Expiry Date

        ISO45001CertAttachment      : Binary; // ISO 45001 Certificate
        ISO45001CertNumber          : String(100); // ISO 45001 Certificate Number
        ISO45001ExpiryDate          : DateTime; // ISO 45001 Certificate Expiry Date

        FactoryLicenseAttachment    : Binary; // Factory License
        FactoryLicenseNumber        : String(100); // Factory License Number
        FactoryLicenseExpiryDate    : DateTime; // Factory License Expiry Date

        ConsentToOperateCert        : String(255); // Consent to Operate Certificate
        ConsentToOperateCertNumber  : String(100); // Consent to Operate Certificate Number
        ConsentToOperateExpiryDate  : DateTime; // Consent to Operate Expiry Date

        FireNOCCertAttachment       : Binary; // Fire NOC Certificate
        FireNOCCertNumber           : String(100); // Fire NOC Certificate Number
        FireNOCCertExpiryDate       : Date; // Fire NOC Certificate Expiry Date


        WageAgreementCert           : String(255); // Wage Agreement Certificate
        WageAgreementCertNumber     : String(100); // Wage Agreement Certificate Number
        WageAgreementExpiryDate     : Date; // Wage Agreement Certificate Expiry Date

        ///end of certificates

        PaymentTerms                : String(255); // Payment Terms
        IncotermsCode               : common.IncotermsCodeT; // Incoterms Code
        IncotermsLocation           : String(255) @mandatory; // Incoterms Location explained 2
    SupplierFullLegalName :String(100) @mandatory;
        BankCountry                 : String(2); // Bank Country
        BankName                    : String(255); // Bank Name
        BankKey                     : String(11); // Bank Key (IFSC Code)
        IBANCode                    : String(34); // IBAN Code / SWIFT Code --- non india
        BankStreetAddress           : String(255); // Bank Street Address
        BankAccountNumber           : String(34); // Bank Account Number
        ReConfirmBankAccountNumber  : String(34); // Re-confirm Bank Account Number
        BankAccountType             : common.BankAccountTypeT; // Bank Account Type
        PostalCode                  : String(10); // Postal Code
        City                        : String(100); // City / Village
        BranchName                  : String(100); // Branch Name
        State                       : common.StateChoiceT; // State
        RegionCode                  : String(3);  // Region Code for Foreign Account
        //attachments now
        CancelledChequeAttachment   : Binary; // Copy of Cancelled Cheque Attachment
        CompanyRegistrationCert     : Binary; // Company Registration Certificate
        ExportLicense               : Binary; // Export License
        MOA                         : Binary; // Memorandum of Association (MOA)
        ArticleOfAssociation        : Binary; // Article of Association
        InternationalSanctionDoc    : Binary; // International Sanction Document (PDF)
        ITRAttachment               : Binary; // ITR form for 02 years
    }

    // entity PaymentTerms {
    //     key Code              : String(10); // Payment Term Code
    //         Description       : String(255); // Payment Term Description
    //         ValidityStartDate : Date; // Validity Start Date
    //         ValidityEndDate   : Date; // Validity End Date
    //         TermsConditions   : String(500); // Terms and Conditions
    // }

}
