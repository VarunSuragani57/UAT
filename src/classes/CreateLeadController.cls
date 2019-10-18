@RestResource(urlMapping='/CreateLeadController/*') //endpoint definition > {Salesforce Base URL}/services/apexrest/CreateLeadController/
global class CreateLeadController {
    
    
    @HttpPost //HttpPost annotation exposes the method as a REST resource and called when an HTTP POST request is sent
    global static responseWrapper leadCreationLogic() {
        
        RestRequest req = RestContext.request; //the RestRequest for the Apex REST method
        responseWrapper responseJSON = new responseWrapper(); //responseWrapper object for API response
        
        Map<String, Object> body = new Map<String, Object>();
        String jsonBody = req.requestBody.toString(); //the body of the request

        if (!String.isBlank(jsonBody)) { //if the request body is NOT white space, empty ('') or null
            body = (Map<String, Object>)JSON.deserializeUntyped(jsonBody);
        }
        if(body != null){
            Lead objLead = new Lead();
            objLead.RecordtypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Industrial Leads').getRecordTypeId();
            Map<String, Schema.SObjectField> M = Schema.SObjectType.Account.fields.getMap();

            for(String objString : body.Keyset()){
                          
                
                if(objString == 'Title'){
                    String Title = (String) body.get(objString);
                    objLead.Title = Title ;
                }
                if(objString == 'firstName'){
                    String firstName = (String) body.get(objString);
                    objLead.firstName  = firstName ;
                }
                if(objString == 'lastName'){
                    String lastName= (String) body.get(objString);
                    objLead.lastName = lastName;
                }
                if(objString == 'companyName'){
                    String companyName = (String) body.get(objString);
                    objLead.company  = companyName ;
                }
                if(objString == 'zipcode'){
                    String PostalCode  = (String) body.get(objString);
                    objLead.PostalCode  = PostalCode ;
                }
                if(objString == 'Country'){
                    String Country = (String) body.get(objString);
                    objLead.Country = Country ;
                }
                if(objString == 'City'){
                    String City = (String) body.get(objString);
                    objLead.City = City;
                }
                if(objString == 'State'){
                    String State = (String) body.get(objString);
                    objLead.State = State;
                }
                if(objString == 'email'){
                    String email = (String) body.get(objString);
                    objLead.email = email;
                }
                if(objString == 'Industry'){
                    String Industry = (String) body.get(objString);
                    objLead.Industry = Industry;
                }
                if(objString == 'email'){
                    String email = (String) body.get(objString);
                    objLead.email = email;
                }
                if(objString == 'companySize'){
                    String companySize = (String) body.get(objString);
                    objLead.Company_Size__c = companySize;
                }
                if(objString == 'Status'){
                    String Status = (String) body.get(objString);
                    objLead.Status = Status;
                }
                if(objString == 'Phone'){
                    String phone = (String) body.get(objString);
                    objLead.Phone = phone;
                }
                
            }
            try{
                Insert objLead;
            }catch(Exception ex){
                responseJSON.status = ex.getMessage();
            }
            
            if(objLead.Id != null){
                responseJSON.LeadId= objLead.Id;
                responseJSON.status = 'Success';
                responseJSON.message = 'Lead is Created Successfully.';
            }else{
                responseJSON.LeadId= 'No Data Found';
                //responseJSON.status = 'Error';
                responseJSON.message = 'Some Issue with the Lead generation.';
            }
        }
        return responseJSON;
        
    }
   
    //wrapper class for the response to an API request
    global class responseWrapper {
        
        global String status {get;set;} //status string
        global String LeadId{get;set;} //18 character Contact record Id
        global String message {get;set;} //message string
        
        //constructor
        global responseWrapper() {
            //default all values
            this.status = 'success';
            this.LeadId = '';
            this.message = '';
        }
    }
}