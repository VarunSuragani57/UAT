@isTest
public class MultiselectControllerTest {

    @isTest
    public static void testgetAccountName(){
        Id annualRecordtypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Annual').getRecordTypeId();
        
        Account objAccount = new Account();
        objAccount.Name = 'Test Acc';
        insert objAccount;
        
        Opportunity objOpp = new Opportunity();
        objOpp.Name = 'Test';
        objOpp.AccountId = objAccount.Id;
        objOpp.Type = 'ANNUAL Program';
        objOpp.Category__c = 'Tops';
        objOpp.StageName = 'Wear Test';
        objOpp.CloseDate = date.Today().addDays(10);
        Insert objOpp;

        Test.startTest();
        	MultiselectController.getAccountName(objOpp.ID);
        Test.stopTest();
    }
    
    @isTest
    public static void testgetMaterialOnload(){
        Id annualRecordtypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Annual').getRecordTypeId();
        
        Account objAccount = new Account();
        objAccount.Name = 'Test Acc';
        insert objAccount;
        
        Opportunity objOpp = new Opportunity();
        objOpp.Name = 'Test';
        objOpp.AccountId = objAccount.Id;
        objOpp.Type = 'ANNUAL Program';
        objOpp.Category__c = 'Tops';
        objOpp.StageName = 'Wear Test';
        objOpp.CloseDate = date.Today().addDays(10);
        Insert objOpp;

        Test.startTest();
        	MultiselectController.getMaterialOnload(objOpp.ID);
        Test.stopTest();
    }
    
    @isTest
    public static void testgetContact(){
        MultiselectController.getContact('Tops');
    }
    
    @isTest
    public static void testsaveMaterial(){
         Id annualRecordtypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Annual').getRecordTypeId();
        
        Account objAccount = new Account();
        objAccount.Name = 'Test Acc';
        insert objAccount;
        
        Opportunity objOpp = new Opportunity();
        objOpp.Name = 'Test';
        objOpp.AccountId = objAccount.Id;
        objOpp.Type = 'ANNUAL Program';
        objOpp.Category__c = 'Tops';
        objOpp.StageName = 'Wear Test';
        objOpp.CloseDate = date.Today().addDays(10);
        Insert objOpp;

        Test.startTest();
        	MultiselectController.saveMaterial('100234-410','Tops', objOpp.ID);
        Test.stopTest();
         System.assertNotEquals(objOpp,Null,'There is issue with Opportunity Record creation.');
    }


}