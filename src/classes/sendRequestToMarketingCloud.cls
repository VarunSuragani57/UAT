public class sendRequestToMarketingCloud {

 
    static final Map<String,String> mapClientIdSecretToValue =  getClientSecretKeyToValue();
    static final Map<String,String> mapmarkeingCloudEndpointNameToValue =  getEndPointNameToValue();
    static final String accessToken = sendRequestForAccessToken();
    static final String accessTokenval = 'AccessToken'; 
    static final String triggerSend = 'TriggerSend';
    
    //Get Cient Secret Key and Value 
    private static Map<String,String> getEndPointNameToValue(){
        Map<String,String> tempMapClientIdSecretToValue =  new Map<String,String>();
        for(Marketing_Cloud_End_Point_URL__mdt objMarketing : [SELECT Id,MasterLabel,End_Point__c from Marketing_Cloud_End_Point_URL__mdt]){
            tempMapClientIdSecretToValue.put(objMarketing.MasterLabel,objMarketing.End_Point__c );
        }
        return tempMapClientIdSecretToValue;
    }
    
   @future(callout=true)
    public static void sendCustomerEReceipt(Set<Id> customerEreceiptId){
        System.debug('=========='+accessToken);
        List<Sobject> listTransactionItems = getCustomerEreceiptInfo(customerEreceiptId); 
        List<Sobject> listTransactionItems1 = getTransactionList(customerEreceiptId); 
        List<Sobject> listTransactionItems3 = getTaxInfo(customerEreceiptId);
        try {
            sendRequestForDataExtension1(accessToken,listTransactionItems,'CustomerEReceipt'); 
            sendRequestForDataExtension1(accessToken,listTransactionItems1 ,'TransactionItem');
            sendRequestForDataExtension1(accessToken,listTransactionItems3 ,'Tax');
            sendRequestForTriggerSend(accessToken,listTransactionItems);
        } 
       catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
        }
    }
    
    
    
    public static Void sendRequestForDataExtension1(String accessToken,List<Sobject> tempListCustomerEReceipt,String dataExtensionType){
        JSONGenerator gen = JSON.createGenerator(true);
        gen = generateJasonFortransactionDataExtension(gen,tempListCustomerEReceipt,dataExtensionType);
        System.debug('==dataextension==='+gen.getAsString());
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        if(dataExtensionType == 'CustomerEReceipt'){
        req.setEndpoint(mapmarkeingCloudEndpointNameToValue.get(dataExtensionType));
        }
        else if (dataExtensionType == 'TransactionItem'){
        req.setEndpoint(mapmarkeingCloudEndpointNameToValue.get(dataExtensionType));
        }
        else{
        req.setEndpoint(mapmarkeingCloudEndpointNameToValue.get(dataExtensionType));
        }
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json'); 
        req.setHeader('Authorization', 'Bearer '+ accessToken); 
        req.setBody(gen.getAsString());
        req.setCompressed(true);
        res = http.send(req);
        system.debug('========='+res);
        //if(!Test.isRunningTest())
         //   List<SObject> listSobject = (List<SObject> )JSON.deserializeUntyped(res.getBody());
        
    } 
    
    @testVisible
    private static JSONGenerator generateJasonFortransactionDataExtension(JSONGenerator gen,List<Sobject> tempListCustomerEReceipt, String dataExtensiontype){
        gen.writeStartArray();
        for(Sobject objTransaction : tempListCustomerEReceipt){
            gen.writeStartObject();
            gen.writeFieldName('keys');
            gen.writeStartObject();       
          //  gen.writeObjectField('Skunumber', objTransaction.Sku__c);
            gen.writeEndObject();
            gen.writeFieldName('values');
            gen.writeStartObject();
            Map<String, String>dataMap=getJsonMap(objTransaction,dataExtensiontype);
            for (String key:dataMap.keySet()) {
               if(dataMap.get(key) != null)
               gen.writeObjectField(key, dataMap.get(key));
               else
               gen.writeObjectField(key, '');
               
                
            }
            gen.writeEndObject();
            gen.writeEndObject(); 
        }
        gen.writeEndArray();
        return gen;
    }
    
    private static Map<String, String> getJsonMap(Sobject objTransaction,String DataExtensionType) {
        System.debug('======DataExtensionType ======='+DataExtensionType );
        Map<String,String> mapObjectnameToObjectAPI = new Map<String,String>();
        if(DataExtensionType == 'CustomerEReceipt'){
            mapObjectnameToObjectAPI = getFieldList('Customer_E_Receipts__c');
        }
        else if (DataExtensionType == 'TransactionItem'){
            mapObjectnameToObjectAPI = getFieldList('TransactionItem__c');
        }  
        else{
            mapObjectnameToObjectAPI = getFieldList('Tax__c');
        }    
        set<string> setApiName = new Set<String>();
        setApiName.addAll(mapObjectnameToObjectAPI.keyset());
        
        system.debug('=====setApiName=====>'+setApiName);
        
        Marketing_Cloud_Field_Mapping__mdt objMarketingCloudFieldMapping = getMarketingCloudFieldMapping();
        Map<String, Object> meta = new  Map<String, Object>();
        if(DataExtensionType == 'CustomerEReceipt'){
            meta = (Map<String, Object>) JSON.deserializeUntyped(objMarketingCloudFieldMapping.CustomEreceiptMapping__c);
        }
        else if(DataExtensionType == 'TransactionItem'){
            meta = (Map<String, Object>) JSON.deserializeUntyped(objMarketingCloudFieldMapping.Field_Mapping__c); 
        }
        else {
            meta = (Map<String, Object>) JSON.deserializeUntyped(objMarketingCloudFieldMapping.All_Taxes__c); 
        } 
        System.debug('====meta ======'+meta );
        Map<String, String> dataMap = new Map<String, String>();
        for(String objMetaDataMap : meta.Keyset()){
            String fieldApi = (String)meta.get(objMetaDataMap);
            if(setApiName.contains(fieldApi.toLowerCase()))
                dataMap.put(objMetaDataMap ,  (String)objTransaction.get(fieldApi) );
            else
                dataMap.put(objMetaDataMap ,  (String)objTransaction.getSobject('E_Receipts_Number__r').get(fieldApi) );
                
        }
        
        system.debug('======='+ dataMap );
        System.debug(LoggingLevel.Info, 'Your info');
        return dataMap;
        
    } 
    
    
    
    
     //Get Transaction List
    private static List<Sobject> getCustomerEreceiptInfo(Set<Id> customerEreceiptId){
        List<Sobject> listCustomerReceipt = [SELECT Id,Barcode__c,BusinessCheck_Amount__c,Cash_Amount__c,Cashier_userFirstName__c,
                                                Cashier_userId__c,tranNo__c,tranTypeId__c,Cashier_userName__c,Email_Address__c,Cash_Type__c,Change_Amount__c,Check_Amount__c,
                                                TransactionId__c
                                                FROM Customer_E_Receipts__c WHERE ID IN : customerEreceiptId];
        return listCustomerReceipt;
    }
    
    //Get Transaction List
    private static List<Sobject> getTransactionList(Set<Id> tempTransactionId){
        List<Sobject> listTransactionItems = [SELECT Id,Transaction_Sku__c,Transaction_ProductType__c,Transaction_Barcode__c,Transaction_Quantity__c,E_Receipts_Number__r.Name, E_Receipts_Number__r.Email_Address__c,
                                                         E_Receipts_Number__r.StoreId__c,Email_Address__c, E_Receipts_Number__r.Store_Name__c, E_Receipts_Number__r.TotalAmount__c, Promotions_Name__c  
                                                         FROM TransactionItem__c WHERE E_Receipts_Number__c IN : tempTransactionId];
        return listTransactionItems;
    }
    
    //Get Transaction List
    private static List<Sobject> getTaxInfo(Set<Id> tempTransactionId){
        List<Sobject> listTransactionItems = [SELECT Id,Tax_Description__c,Tax_DisplayCode__c,TaxID__c,Tax_Indicator__c,
                                                Tax_Total__c,Tax_Type__c,Email_Address__c
                                             from Tax__c WHERE Customer_E_Receipts__c IN : tempTransactionId];
        return listTransactionItems;
    }
    
    
    
    //Get ClientID, Client Secret Key and Value 
    private static Map<String,String> getClientSecretKeyToValue(){
        Map<String,String> tempMapClientIdSecretToValue =  new Map<String,String>();
        for(Marketing_Cloud_EReceipt__mdt objMarketing : [SELECT Id,MasterLabel,Key__c from Marketing_Cloud_EReceipt__mdt]){
            tempMapClientIdSecretToValue.put(objMarketing.MasterLabel,objMarketing.Key__c);
        }
        return tempMapClientIdSecretToValue;
    }

   
    public static String sendRequestForAccessToken(){
        String tempAccessToken;
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject(); 
        for(String objClientIdSecret : mapClientIdSecretToValue.keySet()){
            gen.writeObjectField(objClientIdSecret, mapClientIdSecretToValue.get(objClientIdSecret));    
        }
        gen.writeEndObject();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setEndpoint(mapmarkeingCloudEndpointNameToValue.get(accessTokenval));
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');  
        req.setBody(gen.getAsString());
        req.setCompressed(true);
        res = http.send(req);
        Map<String, Object> meta = (Map<String, Object> )JSON.deserializeUntyped(res.getBody());
        tempAccessToken = (String)meta.get('accessToken');
        return tempAccessToken;
    }  
    
    public static Void sendRequestForTriggerSend(String accessToken,List<Sobject> templistTransactionItems){
        Sobject objTransactionItem = templistTransactionItems[0];
        String emailAdd = String.valueOf(objTransactionItem.getSObject('E_Receipts_Number__r').get('Email_Address__c'));
        String firstName = String.valueOf(objTransactionItem.getSObject('E_Receipts_Number__r').get('Email_Address__c'));
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeFieldName('From');
        gen.writeStartObject();       
        gen.writeObjectField('Address',emailAdd );
        gen.writeObjectField('Name', emailAdd);
        gen.writeEndObject();
        gen.writeFieldName('To');
        gen.writeStartObject();       
        gen.writeObjectField('Address', emailAdd);
        gen.writeObjectField('SubscriberKey', emailAdd);
        gen.writeFieldName('ContactAttributes');
        gen.writeStartObject(); 
        gen.writeFieldName('SubscriberAttributes');
        gen.writeStartObject();       
        gen.writeObjectField('First Name', firstName);
        gen.writeObjectField('Last Name', firstName);
        gen.writeEndObject();
        gen.writeEndObject();
        gen.writeEndObject();
        gen.writeFieldName('Options');
        gen.writeStartObject();       
        gen.writeObjectField('RequestType', 'SYNC');
        gen.writeEndObject();
        System.debug('==TriggerSend==='+gen.getAsString());
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setEndpoint(mapmarkeingCloudEndpointNameToValue.get(triggerSend));
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json'); 
        req.setHeader('Authorization', 'Bearer '+ accessToken); 
        req.setBody(gen.getAsString());
        req.setCompressed(true);
        res = http.send(req);
        System.debug('===res======='+res);
    }   
    
    
    public static map<string, string> getFieldList(String selectedSObject){
    
        map<string, string> fieldList = new map<string, string>();
        if(selectedSObject != null){
            map<string,SObjectField> fList = schema.getGlobalDescribe().get(selectedSObject).getDescribe().fields.getMap();
            for(string str: fList.keySet()){
                fieldList.put(str, fList.get(str).getDescribe().getLabel());                
            }
        }else{
            return null;
        }
        return fieldList;
    }
    
    public Static Marketing_Cloud_Field_Mapping__mdt getMarketingCloudFieldMapping(){
        return [select Label,CustomEreceiptMapping__c,Field_Mapping__c,All_Taxes__c from  Marketing_Cloud_Field_Mapping__mdt Limit 1];
    }
    
}