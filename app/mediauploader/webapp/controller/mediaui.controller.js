sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageToast"
],
function (Controller,MessageToast) {
    "use strict";

    return Controller.extend("com.sumit.mediauploader.controller.mediaui", {
        onInit: function () {

        },
        onAfterItemAdded: function (oEvent) {
            var item = oEvent.getParameter("item")
            console.log("onAfterItemAdded Entity reached!!11111"+item);
            this._createEntity(item)
            .then((id) => {
                this._uploadContent(item, id);
            })
            .catch((err) => {
                console.log(err); 
            })
        },

        onUploadCompleted: function (oEvent) {
            console.log("onUploadCompleted Entity reached!!");
            var oUploadSet = this.byId("uploadSet");
            oUploadSet.removeAllIncompleteItems();
            oUploadSet.getBinding("items").refresh();
        },

        onOpenPressed: function (oEvent) {	
            // _createEntity();
            // _uploadContent();	
            console.log("onPressed Entity reached!!");

        },

        _createEntity: function (item) {
            console.log("Create Entity reached!!");
                var data = {
                    mediaType: item.getMediaType(),
                    fileName: item.getFileName(),
                    size: item.getFileObject().size
                };
                console.log(data);

                var settings = {
                    url: "/odata/v4/attachments/FilesSrv",
                    method: "POST",
                    headers: {
                        "Content-type": "application/json"
                    },
                    data: JSON.stringify(data)
                }

            return new Promise((resolve, reject) => {
                $.ajax(settings)
                    .done((results, textStatus, request) => {
                        console.log("DONEEEEEE");
                        console.log(results.ID);
                        resolve(results.ID);
                    })
                    .fail((err) => {
                        console.log("NOT DONE");
                        reject(err);
                    })
            })				
        },

        _uploadContent: function (item, id) {
            console.log("UploadContent Entity reached!!");
            var url = `/odata/v4/attachments/FilesSrv(${id})/content`
            item.setUploadUrl(url);	
            var oUploadSet = this.byId("uploadSet");
            oUploadSet.setHttpRequestMethod("PUT")
            oUploadSet.uploadItem(item);
        }			




    });
});
