namespace dbmedia;
using { cuid,managed } from '@sap/cds/common';

entity Files : cuid,managed {
    @Core.MediaType: mediaType
    content: LargeBinary;
    @Core.IsMediaType: true
    mediaType: String;
    fileName: String;
    size: Integer;
    url: String;

}; 
entity employee : cuid {

    EMP_NAME:String(128);
    EMP_EMAIL:String(128);
    LANGUAGE:String(2);
    SALARY:Decimal(15,2);
    
};