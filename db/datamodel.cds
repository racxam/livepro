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

entity employee : cuid {

    EMP_NAME  : String(128);
    EMP_EMAIL : String(128);
    LANGUAGE  : String(2);
    SALARY    : Decimal(15, 2);

};

context transcation {

    entity supplier_request : cuid, managed {

        ValidiOfDigressionVendorCodeUpto     : Date                     @mandatory; //"Type of vendor code creation request" = "Digression vendor code"
        IsRelatedPartyVendorCode             : Boolean                  @mandatory; //Mandatory, visible when "Supplier Type" = "Local GST & Non-GST"
        SupplierSpendType                    : common.SpendTypeT        @mandatory; // Mandatory, visible when "Supplier Type" = "Local GST & Non-GST"
        NatureOfActivity                     : common.NatureOfActivityT @mandatory;
        Sector                               : array of {
            SectorT                                                     @mandatory
        }; //more than one value
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

    entity SupplierOnBoarding :cuid,managed {
            
            GSTINType                   : String(255); // GSTIN Type
            VendorEvaluation            : Boolean; // Vendor Evaluation
            EInvoiceApplicability       : Boolean; // E-Invoice Applicability
            GSTRFiler                   : String(255); // GSTR-3B / GSTR-1 Filer
            SupplierOrganizationType    : String(255); // Supplier Organization Type
            CINNumber                   : String(100); // CIN No. (Corporate or Company Identification No.)
            CINAttachment               : String(255); // CIN Attachment (Certificate)
            RegistrationTaxID           : String(100); // Registration / Tax ID
            RegistrationTaxIDAttachment : String(255); // Registration / Tax ID Attachment
            TANNumber                   : String(100); // TAN Number
            EPFONumber                  : String(20); // EPFO Number
            EPFOCertificate             : String(255); // EPFO Certificate
            DUNSNumber                  : String(9); // DUNS Number
            LEINumber                   : String(20); // LEI Number
            LEICertificate              : String(255); // LEI Certificate
            MainTelephoneNumber         : String(20); // Main Telephone Number
            UDYAMNumber                 : String(20); // UDYAM Number (If MSME is Yes)
            IndustryType                : String(255); // Type of Industry
            MSMEType                    : String(50); // MSME Type
            MSMECertificate             : String(255); // MSME Certificate
            CountryCode                 : String(2); // Country Code (IN for India)
            DSAAgreement                : String(255); // DSA Agreement
            NDAAgreement                : String(255); // Non Disclosure Agreement (NDA)
            ISOTS9001Cert               : String(255); // ISO/TS 9001 Certificate
            ISOTS9001CertNumber         : String(100); // ISO/TS 9001 Certificate Number
            ISOTS9001ExpiryDate         : Date; // ISO/TS 9001 Certificate Expiry Date
            ISO14001Cert                : String(255); // ISO 14001 Certificate
            ISO14001CertNumber          : String(100); // ISO 14001 Certificate Number
            ISO14001ExpiryDate          : Date; // ISO 14001 Certificate Expiry Date
            FactoryLicense              : String(255); // Factory License
            FactoryLicenseNumber        : String(100); // Factory License Number
            FactoryLicenseExpiryDate    : Date; // Factory License Expiry Date
            ConsentToOperateCert        : String(255); // Consent to Operate Certificate
            ConsentToOperateCertNumber  : String(100); // Consent to Operate Certificate Number
            ConsentToOperateExpiryDate  : Date; // Consent to Operate Expiry Date
            FireNOCCert                 : String(255); // Fire NOC Certificate
            FireNOCCertNumber           : String(100); // Fire NOC Certificate Number
            FireNOCCertExpiryDate       : Date; // Fire NOC Certificate Expiry Date
            WageAgreementCert           : String(255); // Wage Agreement Certificate
            WageAgreementCertNumber     : String(100); // Wage Agreement Certificate Number
            WageAgreementExpiryDate     : Date; // Wage Agreement Certificate Expiry Date
            PaymentTerms                : String(255); // Payment Terms
            IncotermsCode               : String(20); // Incoterms Code
            IncotermsLocation           : String(255); // Incoterms Location
            BankCountry                 : String(2); // Bank Country
            BankName                    : String(255); // Bank Name
            BankKey                     : String(11); // Bank Key (IFSC Code)
            IBANCode                    : String(34); // IBAN Code / SWIFT Code
            BankStreetAddress           : String(255); // Bank Street Address
            BankAccountNumber           : String(34); // Bank Account Number
            ReConfirmBankAccountNumber  : String(34); // Re-confirm Bank Account Number
            BankAccountType             : String(20); // Bank Account Type
            PostalCode                  : String(10); // Postal Code
            City                        : String(100); // City / Village
            BranchName                  : String(100); // Branch Name
            State                       : String(100); // State
            RegionCode                  : String(3); // Region Code for Foreign Account
            CancelledChequeAttachment   : String(255); // Copy of Cancelled Cheque Attachment
            CompanyRegistrationCert     : String(255); // Company Registration Certificate
            ExportLicense               : String(255); // Export License
            MOA                         : String(255); // Memorandum of Association (MOA)
            ArticleOfAssociation        : String(255); // Article of Association
            InternationalSanctionDoc    : String(255); // International Sanction Document (PDF)
            ITRAttachment               : String(255); // ITR form for 02 years
    }

    entity PaymentTerms {
        key Code              : String(10); // Payment Term Code
            Description       : String(255); // Payment Term Description
            ValidityStartDate : Date; // Validity Start Date
            ValidityEndDate   : Date; // Validity End Date
            TermsConditions   : String(500); // Terms and Conditions
    }

}
