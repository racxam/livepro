using {dbmedia as db} from '../db/datamodel';

service Attachments{
    
    entity FilesSrv as projection on db.Files;
    entity employeeSrv as projection on db.employee;
    
}