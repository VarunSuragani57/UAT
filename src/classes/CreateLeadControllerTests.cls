@istest
public class CreateLeadControllerTests{
 
   static testMethod void  testleadCreationLogic(){
   
   String JsonMsg='{"Title": "Mr","firstName": "ram","lastName": "jagana","companyName": "Carhartt","zipcode": "123456","email": "test@carhartt.com","Phone": "8105690988", "Industry": "Other","companySize": "BELOW_100", "Status": "L1-Inquiry"}';
   
   Test.startTest();
   
   
   
   RestRequest req = new RestRequest(); 
   RestResponse res = new RestResponse();
         
   req.requestURI = 'https://uat1-carharttars.cs20.force.com/CarharrtLeadGenaration/services/apexrest/CreateLead/';  //Request URL
   req.httpMethod = 'POST';//HTTP Request Type
   req.requestBody = Blob.valueof(JsonMsg);
   req.addHeader('Content-Type', 'application/json');
   RestContext.request = req;
   RestContext.response= res;
   CreateLeadController.responseWrapper  results = CreateLeadController.leadCreationLogic();
   Test.stopTest();
   Lead objLead = [Select Id from Lead LIMIT 1];
   system.assertNotEquals(Null,objLead.Id,'Lead Does Not Exists');
   }
 }