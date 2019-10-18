@isTest
private class sendRequestToMarketingCloudTests{
  /**  @isTest static void testCalloutWithStaticResources() {
       
       Customer_E_Receipts__c CE = New Customer_E_Receipts__c();
       CE.DeviceId__c = 'VarunDevice';
       CE.SalespersonId__c= 'Text';
       CE.Salesperson_Name__c = 'Varun';
       Insert CE;
       
       TransactionItem__c TI = New TransactionItem__c();
      // TI.Barcode__c= 'Code';
      // TI.E_Receipts_Number__c = CE.Id;
    //  TI.Description__c= 'large';
     //  TI.ProductType__c= 'Shirt3';
     //  TI.Sku__c = 'Shirt';
    //   TI.Promotions_Name__c = 'Shirt2';
     //  TI.TaxRate_Percentage__c = 'Shirt4';
      // Insert TI;
       
       
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
        
} **/
}