@isTest
public class FileUploadControllerTest{

    @isTest static void testSaveChunk() {
        //Id parentId, String fileName, String base64Data, String contentType, String fileId
        
        String contentType = 'Pdf';
        String fileName = 'Test';
        String fileId= '';
        String base64Data = 'Test';
        Ideas_That_Work__c objIdea = new Ideas_That_Work__c();
        Insert objIdea;
        
        Blob b = Blob.valueOf('Test Data');
        
        Attachment attachment = new Attachment();
        attachment.ParentId = objIdea.Id;
        attachment.Name = 'Test Attachment for Parent';
        attachment.Body = b;
        
        insert(attachment);
        
        FileUploadController.saveChunk(objIdea.Id, fileName, base64Data , contentType, fileId);
            
    }
    
    @isTest static void testSaveTheFile() {
        String contentType = 'Pdf';
        String fileName = 'Test';
        String fileId= '';
        String base64Data = 'Test';
        Ideas_That_Work__c objIdea = new Ideas_That_Work__c();
        Insert objIdea;
        
        Blob b = Blob.valueOf('Test Data');
        
        Attachment attachment = new Attachment();
        attachment.ParentId = objIdea.Id;
        attachment.Name = 'Test Attachment for Parent';
        attachment.Body = b;
        
        insert(attachment);
        
        FileUploadController.saveChunk(objIdea.Id, fileName, base64Data , contentType, attachment.Id);
    
    }
}