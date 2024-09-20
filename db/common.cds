namespace common.db;
using {cuid} from '@sap/cds/common';
//master tables start
context master {
//supplier req departmetns 
entity departments:cuid {
    DepartmentName : String(5); // Name of the department (e.g., SSU, SIMS, etc.)
    functions : Association to many dept_functions on functions.Department = $self;
}
//supplier req functions

entity dept_functions :cuid{
    FunctionName : String(100); // Name of the function (e.g., 'A&T Prop', 'Casting', etc.)
    Department : Association to departments; // The backlink
}

}
//master tables end



type SpendTypeT : String(3) enum {
    Indirect = 'IND';
    Direct = 'DIR';
    Capital = 'CAP';
    Tooling = 'TOO';
    ValueFit = 'VF';
    Proto = 'PRO';
    Accessories = 'ACC';
}


type NatureOfActivityT : String(3) enum {
    Material = 'MAT';
    Services = 'SER';
}

type SectorT : String(3) enum {
    AutomotiveDivision = 'AD';      // Automotive Division
    AutoFarmSector = 'AFS';         // Auto & Farm Sector
    ConstructionEquipment = 'CE';   // Construction Equipment
    ClassicLegends = 'CLPL';        // Classic Legends Pvt. Ltd.
    FarmDivision = 'FD';            // Farm Division
    ElectricMobility = 'MEML';      // Mahindra Electric Mobility Limited
    HeavyEngines = 'MHEPL';         // Mahindra Heavy Engines Pvt Ltd
    TruckBusDivision = 'MTBD';      // Mahindra Truck & Bus Division
    TwoWheeler = 'MTWL';           // Mahindra Two Wheeler Ltd
    Powerol = 'POWEROL';           // Mahindra Powerol
    SwarajDivision = 'SD';          // Swaraj Division
    HeadOffice = 'HO';             // Mahindra Head Office
    LastMileMobility = 'MLMML';    // Mahindra Last Mile Mobility Ltd
}

type PanCardT:String(11) @assert.format : '[A-Z]{5}[0-9]{4}[A-Z]{1}';
type GstInT : String(15) @assert.format : '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
