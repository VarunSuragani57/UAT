@isTest
public class CaseTriggerHelperTests{
  
    @isTest
    public static void testCaseTrigger(){
    
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Brand Management').getRecordTypeId();
        
        Account objAccount = new Account();
        objAccount.Name = 'Test Acc';
        insert objAccount;
        
        Contact con = new Contact();
        con.LastName = 'Test';
        con.AccountId = objAccount.id;
        con.Email = 'Test@gmail.com';
        Insert con;
        
        List<Case> listCases = new List<Case>();
        Case objCase = new Case();
        objCase.Subject = 'Test';
        objCase.recordTypeId = devRecordTypeId ;
        objCase.Status = 'New';
        objCase.Type = 'Sales';
        objCase.ContactId = con.Id;
        objCase.Internal_Contact1__c = UserInfo.getUserId();
        objCase.Internal_Contact2__c = UserInfo.getUserId();
        objCase.Internal_Contact3__c = UserInfo.getUserId();
        objCase.Internal_Contact4__c = UserInfo.getUserId();
        objCase.Service_Group__c = 'Canada';
        listCases.add(objCase);
        Case objCase1 = new Case(Subject = 'Test',recordTypeId = devRecordTypeId,Status = 'Open',ContactId = con.Id,Internal_Contact1__c = UserInfo.getUserId(),
                                Internal_Contact2__c = UserInfo.getUserId(),Internal_Contact3__c = UserInfo.getUserId(),Internal_Contact4__c = UserInfo.getUserId(),
                                Type = 'Sales',Service_Group__c = 'Canada');
        
        listCases.add(objCase1);
        
        Case objCase2 = new Case(Subject = 'Test',recordTypeId = devRecordTypeId,Status = 'Open',ContactId = con.Id,Internal_Contact1__c = UserInfo.getUserId(),
                                Internal_Contact2__c = UserInfo.getUserId(),Internal_Contact3__c = UserInfo.getUserId(),Internal_Contact4__c = UserInfo.getUserId(),
                                Type = 'Sales',Service_Group__c = 'Canada');
       
        listCases.add(objCase2);
        Insert  listCases;
        List<case> listCasesUpdate = new List<Case>();
        List<case> listCasesNew = [Select Id,Status,Subject,Case_Reject_Reason__c,RecordTypeId,Internal_Contact1__r.Email,contactId,
                                    Internal_Contact2__r.Email,Internal_Contact3__r.Email,Case.Type,Account.Owner.Email,AccountId,Internal_Contact4__r.Email,
                                    Internal_Contact5__r.Email from Case]; 
        Attachment attachm = new Attachment();
        attachm.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attachm.body=bodyBlob;
        attachm.parentId=listCasesNew[0].id;
        insert attachm;
        
                                    
        for(Integer i=0 ; i<listCasesNew.size();i++ ){
            if(i == 0)
            listCasesNew[i].Status ='Closed';
            if(i == 1)
            listCasesNew[i].Status ='Brand Integrity Reviewed';
            if(i == 2){
            listCasesNew[i].Status ='Review Reject';
            listCasesNew[i].Case_Reject_Reason__c='This is Rejected';
            }
            listCasesUpdate.add(listCasesNew[i]);
        } 
        Attachment attach=new Attachment();     
                                   
        Test.startTest();
           Update listCasesUpdate;
        Test.stopTest();
      
    }
}