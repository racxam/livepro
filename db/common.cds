namespace common.db;

using {cuid} from '@sap/cds/common';

//master tables start
@cds.autoexpose @readonly
context master {
    //supplier req departmetns
    entity departments : cuid {
        DepartmentName : String(5); // Name of the department (e.g., SSU, SIMS, etc.)
        functions      : Association to many dept_functions
                             on functions.Department = $self;
    }
    //supplier req functions

    entity dept_functions : cuid {
        FunctionName : String(100); // Name of the function (e.g., 'A&T Prop', 'Casting', etc.)
        Department   : Association to departments; // The backlink
    }

}
//master tables end


type SpendTypeT                : String(3) enum {
    Indirect                  = 'IND';
    Direct                    = 'DIR';
    Capital                   = 'CAP';
    Tooling                   = 'TOO';
    ValueFit                  = 'VF';
    Proto                     = 'PRO';
    Accessories               = 'ACC';
}


type NatureOfActivityT         : String(3) enum {
    Material                  = 'MAT';
    Services                  = 'SER';
}

type SectorT                   : String(3) enum {
    AutomotiveDivision        = 'AD'; // Automotive Division
    AutoFarmSector            = 'AFS'; // Auto & Farm Sector
    ConstructionEquipment     = 'CE'; // Construction Equipment
    ClassicLegends            = 'CLPL'; // Classic Legends Pvt. Ltd.
    FarmDivision              = 'FD'; // Farm Division
    ElectricMobility          = 'MEML'; // Mahindra Electric Mobility Limited
    HeavyEngines              = 'MHEPL'; // Mahindra Heavy Engines Pvt Ltd
    TruckBusDivision          = 'MTBD'; // Mahindra Truck & Bus Division
    TwoWheeler                = 'MTWL'; // Mahindra Two Wheeler Ltd
    Powerol                   = 'POWEROL'; // Mahindra Powerol
    SwarajDivision            = 'SD'; // Swaraj Division
    HeadOffice                = 'HO'; // Mahindra Head Office
    LastMileMobility          = 'MLMML'; // Mahindra Last Mile Mobility Ltd
}

type PanCardT                  : String(11) @assert.format: '[A-Z]{5}[0-9]{4}[A-Z]{1}';
type GstInT                    : String(15) @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';


//supplier on boarding
type GSTINTypeT                : String enum {
    Registered;
    CompositionScheme;
    SpecialEconomicZone;
    SEZDeveloper;
    SEZUnit;
    PSUGovernmentRegistration = 'PSU or GovernmentRegistration';
}

type GSTRFilerT                : String enum {
    Monthly;
    Quarterly;
}

type SupplierOrganizationTypeT : String enum {
    Individual                = 'Individual';
    Company                   = 'Company';
    PartnershipFirms          = 'Partnership Firms';
    HUF                       = 'HUF';
    Trust                     = 'Trust';
    LLP                       = 'LLP';
    LocalAuthority            = 'Local Authority';
    Government                = 'Government';
    BodyOfIndividuals         = 'Body of individuals';
}

type CINNumberT                : String(12) @assert.format: '^[a-zA-Z0-9]{12}$';
type DUNSNumberT               : String(9) @assert.format: '^[a-zA-Z0-9]{9}$';

type IndustryTypeT             : String enum {
    Manufacturing;
    Service;
}
type MSMETypeT: String(5) enum{
    Medium;
    Micro;
    Small;
}
type IncotermsCodeT: String enum{
    ExWorksFreightToPay = 'Ex-Works Freight to pay';
    FreeOnRoadToTransporterGodownYearEndFreightPay = 'Free On Road to transporter godown year end Freight Pay';
    FreeDeliveryToStoresFreightPaid = 'Free delivery to stores - Freight paid';
    AirShipment = 'Air Shipment';
    CostAndFreight = 'Cost and Freight';
    CostAndInsurance = 'Cost and Insurance';
    CostInsuranceAndFreight = 'Cost, Insurance and Freight';
    CarriagePaidTo = 'Carriage Paid To';
    DeliveredAtFrontier = 'Delivered At Frontier';
    DeliveredDutyPaid = 'Delivered Duty Paid';
    DoorDelivery = 'Door Delivery';
    DeliveredDutyUnpaid = 'Delivered Duty Unpaid';
    ExWorks = 'Ex Works';
    FreeAlongsideShip = 'Free Alongside Ship';
    FreeCarrier = 'Free Carrier';
    FreeDelivery = 'Free Delivery';
    FreeHouse = 'Free House';
    FreeOnBoard = 'Free On Board';
    FreeOnRoad = 'Free On Road';
    GodownDelivery = 'Godown Delivery';
    FreeOnBoardFreight = 'Free On Board - Freight';
    CostAndFreight2 = 'Cost and Freight';
    CarriageAndInsurancePaid = 'Carriage and Insurance Paid';
    CostAndFreight3 = 'Cost and Freight';
    DeliveredAtPlace = 'Delivered At Place';
    DeliveredAtTerminal = 'Delivered At Terminal';
    DeliveredExQuayDuty = 'Delivered Ex Quay (Duty';
    DeliveredExShip = 'Delivered Ex Ship';
    ExOurWorks = 'Ex Our Works';
    ExYourWorks = 'Ex Your Works';
    ExOurWorks2 = 'Ex Our Works';
};


type BankAccountTypeT :String enum{
     Savings_Account;
     Current_Account;
}

type StateChoiceT:String enum{
    Maharashtra = 'Maharashtra';
    TamilNadu = 'Tamil Nadu';
    MadhyaPradesh = 'Madhya Pradesh';
    AndhraPradesh = 'Andhra Pradesh';
    WestBengal = 'West Bengal';
    UttarPradesh = 'Uttar Pradesh';
    ArunachalPradesh = 'Arunachal Pradesh';
    Assam = 'Assam';
    Bihar = 'Bihar';
    Goa = 'Goa';
    Gujarat = 'Gujarat';
    Haryana = 'Haryana';
    HimachalPradesh = 'Himachal Pradesh';
    JammuAndKashmir = 'Jammu & Kashmir';
    Karnataka = 'Karnataka';
    Kerala = 'Kerala';
    Manipur = 'Manipur';
    Meghalaya = 'Meghalaya';
    Mizoram = 'Mizoram';
    Nagaland = 'Nagaland';
    Orissa = 'Orissa';
    Punjab = 'Punjab';
    Rajasthan = 'Rajasthan';
    Sikkim = 'Sikkim';
    Tripura = 'Tripura';
    AndamanAndNicobar = 'Andaman & Nicobar';
    Chandigarh = 'Chandigarh';
    DadraAndNagarHaveli = 'Dadra and Nagar Haveli';
    DamanAndDiu = 'Daman & Diu';
    Delhi = 'Delhi';
    Lakshadweep = 'Lakshadweep';
    Pondicherry = 'Pondicherry';
    Chhattisgarh = 'Chhattisgarh';
    Jharkhand = 'Jharkhand';
    Telangana = 'Telangana';
    Uttaranchal = 'Uttaranchal';
    Ladakh = 'Ladakh';

}