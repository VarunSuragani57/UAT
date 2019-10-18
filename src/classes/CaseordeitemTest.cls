@isTest
public class CaseordeitemTest{
  
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
        objCase.Freight_Refund__c  = true;
        objCase.Freight_Amount__c  = 10;
        objCase.Total_Tax_Refund__c  = 50;
        objCase.Discount_if_applicable_Dollar__c  = 5;
        
        objCase.Total_Merchandise__c  = 10;
        
        insert  objCase;
        
        Order_Item__c  or1 = new Order_Item__c();
        or1.Case__c = objCase.id;
        or1.Product_Cost__c= 10;
       // or1.Tax__c = 2;
        insert or1;
        
        update or1;
         objCase.Discount_if_applicable_Dollar__c  = null;
        objCase.Discount_if_applicable__c  = 1;
        update objCase;
                                   
        
      
    }
}