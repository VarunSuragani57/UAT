({
	updateFileName : function(component, event, helper) {
        console.log('test Att=============');
        var input_files=component.get("v.inputFiles");
        var files=event.getSource().get("v.files");
		for(var i=0;i<files.length; i++ ){
            var file = files[i];
            console.log('file name : '+files[i].name);
			if(files[i].type=="image/png" || files[i].type=="image/jpeg"){
				var attachment={};
				var reader = new FileReader();
				reader.onload = function(event) {
					var file_info=reader.result;
					var file_data=encodeURIComponent(file_info.substring(file_info.indexOf('base64')+7));
					attachment.name=file.name;
					attachment.contentType=file.type;
					attachment.body =file_data;
					attachment.size=file.size;
					input_files.push(attachment);							
                    console.log('file_data : '+file_data);
                    
                    component.set("v.inputFiles",input_files);
		
                    var index = component.get("v.rowIndex");
                    var compEvent = component.getEvent("bindAttachment");
                    compEvent.setParams({"message" : input_files ,
                                         "index": index});
                    compEvent.fire();
				}
				reader.readAsDataURL(file);
			}
			else{
				alert("You can upload only JPEG/PNG");
			}
		}
		
	},
    handleApplicationEvent : function(component,event,helper){
        console.log("application event captured");
        //alert(event.getParam("ParentId"));
		component.set("v.ParentId",event.getParam("ParentId"));
         console.log(component.get("v.inputFiles"));
          helper.uploadToServer(component);
        
    }
})