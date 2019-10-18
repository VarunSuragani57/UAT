@isTest
private class MarketingCloudControllerTests{
    @isTest static void testCalloutWithStaticResources() {
    
       MockHttpResponseGenerator.jsonResponse = '{"accessToken": "1XlFsRKjGCXqK1rZmHftV68Y","expiresIn": 3479}';
       Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
       //As Per Best Practice it is important to instantiate the Rest Context 
       StaticResource  objStaticResource =  [Select body, name from StaticResource where Name = 'MarketingCloudJson']; 
       Test.startTest();
       RestRequest req = new RestRequest(); 
       RestResponse res = new RestResponse();
             
       req.requestURI = 'https://uat1-carharttars.cs20.force.com/Ideasthatwork/services/apexrest/marketingCloud/';  //Request URL
       req.httpMethod = 'POST';//HTTP Request Type
       req.requestBody = objStaticResource.body ;
       RestContext.request = req;
       RestContext.response= res;
       
       MarketingCloudController.responseWrapper resp = new  MarketingCloudController.responseWrapper (); 
       resp = MarketingCloudController.MarketingCloudInput(); //Call the Method of the Class with Proper Constructor 
       
      Test.stopTest(); 
        
}
}