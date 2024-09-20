sap.ui.define(["sap/ui/core/mvc/Controller","sap/m/MessageToast"],function(e,t){"use strict";return e.extend("com.sumit.mediauploader.controller.mediaui",{onInit:function(){},onAfterItemAdded:function(e){var t=e.getParameter("item");console.log("onAfterItemAdded Entity reached!!11111"+t);this._createEntity(t).then(e=>{this._uploadContent(t,e)}).catch(e=>{console.log(e)})},onUploadCompleted:function(e){console.log("onUploadCompleted Entity reached!!");var t=this.byId("uploadSet");t.removeAllIncompleteItems();t.getBinding("items").refresh()},onOpenPressed:function(e){console.log("onPressed Entity reached!!")},_createEntity:function(e){console.log("Create Entity reached!!");var t={mediaType:e.getMediaType(),fileName:e.getFileName(),size:e.getFileObject().size};console.log(t);var o={url:"/odata/v4/attachments/FilesSrv",method:"POST",headers:{"Content-type":"application/json"},data:JSON.stringify(t)};return new Promise((e,t)=>{$.ajax(o).done((t,o,n)=>{console.log("DONEEEEEE");console.log(t.ID);e(t.ID)}).fail(e=>{console.log("NOT DONE");t(e)})})},_uploadContent:function(e,t){console.log("UploadContent Entity reached!!");var o=`/odata/v4/attachments/FilesSrv(${t})/content`;e.setUploadUrl(o);var n=this.byId("uploadSet");n.setHttpRequestMethod("PUT");n.uploadItem(e)},onDownloadSelectedButton:function(){console.log("on Download selected!!!");var e=this.byId("uploadSet");console.log(e);e.getItems().forEach(function(e){if(e.getListItem().getSelected()){e.download(true)}})},onVersionUpload:function(e){var t=this.byId("uploadSet");this.oItemToUpdate=t.getSelectedItem()[0];t.openFileDialog(this.oItemToUpdate)}})});
//# sourceMappingURL=mediaui.controller.js.map