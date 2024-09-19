module.exports= async function(){
    this.before('CREATE','FilesSrv',async (req,res)=>{

        console.log("Control Reached!!");
        console.log(JSON.stringify(req.data));
        req.data.url=`/odata/v4/attachments/FilesSrv(${req.data.ID})/content`
    })

}