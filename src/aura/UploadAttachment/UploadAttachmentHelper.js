({	
    Total_FilesToUpload : 0,
    Total_FilesUploaded :0,
    MAX_FILE_SIZE: 4500000,
    CHUNK_SIZE: 850000,
    uploadToServer : function(cmp) {
    	var files=cmp.get("v.inputFiles");
        //alert('-='+JSON.stringify(files));
    	this.Total_FilesToUpload= files.length;
        //alert();
    	if(this.Total_FilesToUpload >=1){//if more then one file
    		var file = files[this.Total_FilesUploaded];//process first file
    
    		//console.log('processing file -=',file));
    		var fileBody=file.body;
    		if (file.size > this.MAX_FILE_SIZE) {
    			//alert('File size cannot exceed ' + this.MAX_FILE_SIZE + ' bytes.\n' + 'Selected file size: ' + file.size);
    			return;
			}else{
                //alert('File Uploaded'+fileBody.toString());
 				this.upload(cmp,file,fileBody);
 			}
 			
        }
        
	},
    upload: function(component, file, fileContents) {
        var fromPos = 0;
        console.log('uploadupload-='+fileContents);
        var toPos = Math.min(fileContents.length, fromPos + this.CHUNK_SIZE);
         
        // start with the initial chunk
        this.uploadChunk(component, file, fileContents, fromPos, toPos, '');   
    },
     uploadChunk : function(component, file, fileContents, fromPos, toPos, attachId) {
         //debugger;
         	console.log('test Att=============1'+component.get("v.ParentId"));
            var action = component.get("c.saveTheChunk"); 
            var chunk = fileContents.substring(fromPos, toPos);
            action.setParams({
                parentId: component.get("v.ParentId"),
                fileName: file.name,
                base64Data: chunk, 
                contentType: file.contentType,
                fileId: attachId
            });
            
            var self = this;
            action.setCallback(this, function(a) {
                var state=a.getState();
                console.log('server call state ',state);
                if(state == 'SUCCESS'){
                console.log(file.Name+' processed by server');
                console.log(' chunk length ',chunk.length);
            	//console.log(' chunk ',chunk);
                attachId = a.getReturnValue();
                console.log('new file created in server id ',attachId);
                fromPos = toPos;
                toPos = Math.min(fileContents.length, fromPos + self.CHUNK_SIZE);    
                if (fromPos < toPos) {
                    self.uploadChunk(component, file, fileContents, fromPos, toPos, attachId);  
                }else{
                    //uploading chunks is done
                    //take next file
                    self.Total_FilesUploaded +=1;
                    if(self.Total_FilesToUpload > self.Total_FilesUploaded){
                        self.uploadToServer(component);
                    }
                }
                }
               
            });
            
           
                $A.enqueueAction(action); 
           
        }   

})