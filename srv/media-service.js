module.exports = async function () {
    this.before('CREATE', 'FilesSrv', async (req) => {
        console.log("Control Reached!!");
        console.log("File Details: ", JSON.stringify(req.data));

        if (req.data.content && req.data.content.length > 0) {
            console.log("Uploading file of size:", req.data.content.length);
        }

        req.data.url = `/odata/v4/attachments/FilesSrv(${req.data.ID})/content`;
    });

    this.after('CREATE', 'FilesSrv', (req) => {
        console.log("File successfully uploaded!");
    });
};
