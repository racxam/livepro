using {dbmedia as db} from '../db/datamodel';
using {common.db as common} from '../db/common';

service Attachments {



    entity supplierReqSrv        as projection on db.transcation.supplier_request;
    entity supplierOnBoardingSrv as projection on db.transcation.supplier_on_boarding;
    entity departmentsSrv        as projection on common.master.departments;
    entity SupplierSpendTypeSrv  as projection on common.master.SupplierSpendType;
    entity NatureOfActivitySrv   as projection on common.master.NatureOfActivity;
    entity SectorSrv            as projection on common.master.Sector;


}
