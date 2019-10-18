@isTest
public class AttachmentTriggerHandlerTests{

    @isTest static void testafterInsert() {
        Ideas_That_Work__c objIdea = new Ideas_That_Work__c();
        Insert objIdea;
        Blob b = Blob.valueOf('Test Data');
        
        Attachment attachment = new Attachment();
        attachment.ParentId = objIdea.Id;
        attachment.Name = 'Test Attachment for Parent';
        attachment.Body = b;
        
        insert(attachment);
        delete(attachment);
    }
}