@isTest
public class OpportunityTriggerHandlerTests{


    @isTest
    public static void testbeforeInsertUpdate(){
    
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
        
        Test.startTest();
            Insert objOpp;
        Test.stopTest();
        
        System.assertNotEquals(objOpp,Null,'There is issue with Opportunity Record creation.');
        
        
        
        
    }
}