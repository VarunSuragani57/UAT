@RestResource(urlMapping='/marketingCloud2/*') //endpoint definition > {Salesforce Base URL}/services/apexrest/CreateLeadController/
GLobal class CustomerEReceiptsController_Carhartt {
    
 /**   @HttpPost //HttpPost annotation exposes the method as a REST resource and called when an HTTP POST request is sent
    Global static responseWrapper GetDataFromOVC() {
        
        RestRequest req = RestContext.request; //the RestRequest for the Apex REST method
        responseWrapper responseJSON = new responseWrapper(); //responseWrapper object for API response
        
        Map<String, Object> body = new Map<String, Object>();
        String jsonBody = req.requestBody.toString(); //the body of the request
        
        if (!String.isBlank(jsonBody)) { //if the request body is NOT white space, empty ('') or null
            body = (Map<String, Object>)JSON.deserializeUntyped(jsonBody);
        }
        if(body != null){
            List<Customer_E_Receipts__c> listCustomerEReceipt = new List<Customer_E_Receipts__c>(); 
            Customer_E_Receipts__c objCustomerEReceipt = new Customer_E_Receipts__c(); 
            List<TransactionItem__c> listTranItems = new List<TransactionItem__c>();
            //for(String objString : body.Keyset()){
            String deviceId;
            String tillId ;
            String  storeId;
            
            if(body.get('deviceId') != null){
                deviceId = (String) body.get('deviceId');
                objCustomerEReceipt.Promotion_Name__c =  deviceId ;
            }
            if(body.get('tillId') != null){
                tillId = (String) body.get('tillId');
                objCustomerEReceipt.Till_Id__c=  tillId ;
            }
            if(body.get('storeId') != null){
                storeId = (String) body.get('storeId');
                objCustomerEReceipt.storeId__c = storeId ;
            }
            if(body.get('storeName') != null){
                objCustomerEReceipt.Store_Name__c = (String) body.get('storeName');
            }
            if(body.get('storeTimeZone') != null){
                objCustomerEReceipt.Store_TimeZone__c = (String) body.get('storeTimeZone');
            }
            System.debug('=================='+body);
            
            List<Object> lst_tranItems = (List<Object>) body.get('tranItems');
            Integer i = 0;
            for(Object obj : lst_tranItems )
            {
                i = i+1;
                TransactionItem__c objTransactionItem = new TransactionItem__c();
                Map<String,Object> mp_StrObj = (Map<string,Object>)obj;
                if(mp_StrObj.containsKey('product')){
                    
                    Map<String,Object> mp_ProductInnerObj = (Map<string,Object>)mp_StrObj.get('product');
                    
                    //objTransactionItem.Name__c = 'a0am0000003s76A';
                    if(String.valueof(mp_ProductInnerObj.get('sku')) != null)
                        objTransactionItem.Sku__c = String.valueof(mp_ProductInnerObj.get('sku'));
                    listTranItems.add(objTransactionItem);
                    // if(String.valueof(mp_ProductInnerObj.get('sku')) != null)
                    //  objTransactionItem.Sku__c = String.valueof(mp_ProductInnerObj.get('sku'));
                    // listTranItems.add(objTransactionItem);
                    //   if(String.valueof(mp_ProductInnerObj.get('sku')) != null)
                    //  objTransactionItem.Sku__c = String.valueof(mp_ProductInnerObj.get('sku'));
                    //  listTranItems.add(objTransactionItem);
                    //   if(String.valueof(mp_ProductInnerObj.get('sku')) != null)
                    //  objTransactionItem.Sku__c = String.valueof(mp_ProductInnerObj.get('sku'));
                    //  listTranItems.add(objTransactionItem);
                    
                }
                //system.debug(mp_StrObj.get('promotion'));
            }
            jsonBody = 'Inside'+String.valueOf(i);
            //}
            listCustomerEReceipt.add(objCustomerEReceipt); 
            //try{
            
            if(!listCustomerEReceipt.isEmpty())
                Insert listCustomerEReceipt;
            if(!listTranItems.isEmpty())
                Insert listTranItems;
            //}catch(Exception ex){
            //    responseJSON.status = ex.getMessage();
            //}
            
            if(body != null){
                
                responseJSON.status = 'Success';
                responseJSON.message = jsonBody;
            }else{
                //responseJSON.status = 'Error';
                responseJSON.message = 'Something Wrong, Please Contact System Administrator for more information.';
            }
        }
        return responseJSON;
        
    }
    
    //wrapper class for the response to an API request
    global class responseWrapper {
        
        global String status {get;set;} //status string
        global String message {get;set;} //message string
        
        //constructor
        global responseWrapper() {
            //default all values
            this.status = 'success';
            this.message = '';
        }
    } **/
}