@isTest
public class ContactIdeaControllerTest{

    @isTest static void testGetStatements() {
       
            ContactIdeaController.getStatements();
    }
    
    @isTest static void testCreateIdea() {
        Ideas_That_Work__c objIdea = new Ideas_That_Work__c();
        Insert objIdea;
        String IdeaVal = '{"IsDeleted":false,"TermCondition__c":true,"OwnerId":"0050h000003nIqRAAU","Are_there_other_brands_currently_20__c":"Please Select","Information_regarding_copyrights_22__c":"Please Select","Do_you_have_any_information_regarding_co__c":"Please Select","Carhartt_currently_offering_your_idea__c":"Please Select","Idea_Category__c":"Please Select","Email__c":"asasa@gmail.com"}';
        ContactIdeaController.createIdea(IdeaVal,'','Insert');

        String IdeaVal1 = '{"IsDeleted":false,"TermCondition__c":true,"OwnerId":"0050h000003nIqRAAU","Are_there_other_brands_currently_20__c":"Please Select","Information_regarding_copyrights_22__c":"Please Select","Do_you_have_any_information_regarding_co__c":"Please Select","Carhartt_currently_offering_your_idea__c":"Please Select","Idea_Category__c":"Please Select","Email__c":"asasa@gmail.com"}';
        ContactIdeaController.createIdea(IdeaVal,objIdea.Id,'Update');
    }
    
    
}