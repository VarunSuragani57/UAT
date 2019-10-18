@isTest
public class IdeasThatWorkPageControllerTest{

    @isTest static void testIdeasThatWorkPageController() {
        Ideas_That_Work__c objIdea = new Ideas_That_Work__c();
        Insert objIdea;
        apexpages.currentpage().getparameters().put('id',objIdea.Id);
        IdeasThatWorkPageController objIdeasThatWorkPageController  = new IdeasThatWorkPageController();
    }
    
    
}