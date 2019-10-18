@RestResource(urlMapping='/marketingCloud/*') //endpoint definition > {Salesforce Base URL}/services/apexrest/CreateLeadController/
global class MarketingCloudController {
    
    
    @HttpPost //HttpPost annotation exposes the method as a REST resource and called when an HTTP POST request is sent
    global static String MarketingCloudInput() {
        String message; 
        try{
        RestRequest req = RestContext.request; //the RestRequest for the Apex REST method
        Map<String, Object> body = new Map<String, Object>();
        String jsonBody = req.requestBody.toString(); //the body of the request
        Map<String, Object> jsonMap = (Map<String, Object>)JSON.deserializeUntyped(jsonBody);
        List<Customer_E_Receipts__c> listCustomerEReceipt = new List<Customer_E_Receipts__c>(); 
        Customer_E_Receipts__c objCustomerEReceipt = new Customer_E_Receipts__c();
        
        
        // Required fields 
        message = 'Success ->'+ (String)jsonMap.get('id');
        objCustomerEReceipt.Till_Id__c = (String)jsonMap.get('tillId');  
        objCustomerEReceipt.MerchTotal__c = (String)jsonMap.get('merchTotal');
        objCustomerEReceipt.TotalAmount__c = (String)jsonMap.get('total');
        objCustomerEReceipt.StoreId__c = (String)jsonMap.get('storeId');
        objCustomerEReceipt.Store_Name__c = (String)jsonMap.get('storeName');
        objCustomerEReceipt.Street_Name__c = (String)jsonMap.get('streetName');
        objCustomerEReceipt.streetNumber__c = (String)jsonMap.get('streetNumber');
        objCustomerEReceipt.Store_City__c = (String)jsonMap.get('storeCity');
        objCustomerEReceipt.Store_ZipCode__c = (String)jsonMap.get('storeZipCode');
        objCustomerEReceipt.Store_Country__c = (String)jsonMap.get('storeCountry');
        objCustomerEReceipt.Store_PhoneNumber__c = (String)jsonMap.get('storePhoneNumber');
        objCustomerEReceipt.Store_FaxNumber__c = (String)jsonMap.get('storeFaxNumber');
        objCustomerEReceipt.Store_TimeZone__c = (String)jsonMap.get('storeTimeZone');
        objCustomerEReceipt.tranNo__c = string.valueof((Integer)jsonMap.get('tranNo'));
        objCustomerEReceipt.Barcode__c = (String)jsonMap.get('barcode');
        objCustomerEReceipt.tranTypeId__c = (String)jsonMap.get('tranTypeId');
        objCustomerEReceipt.tranDate__c = (String)jsonMap.get('tranDate');
        objCustomerEReceipt.localTranDate__c = (String)jsonMap.get('localTranDate');
        objCustomerEReceipt.localTimeZone__c = (String)jsonMap.get('localTimeZone');
        objCustomerEReceipt.Total_Items__c = string.valueof((Integer)jsonMap.get('totalItems'));
        objCustomerEReceipt.PromoTotal__c = (String)jsonMap.get('promoTotal');
        objCustomerEReceipt.CustomerFirstName__c = (String)jsonMap.get('customerFirstName');
        objCustomerEReceipt.CustomerLastName__c = (String)jsonMap.get('customerLastName');
        objCustomerEReceipt.CustomerAddress__c = (String)jsonMap.get('customerAddress1');
        objCustomerEReceipt.CustomerCity__c = (String)jsonMap.get('customerCity');
        objCustomerEReceipt.CustomerState__c = (String)jsonMap.get('customerState');
        objCustomerEReceipt.CustomerZipCode__c = (String)jsonMap.get('customerZipCode');
        objCustomerEReceipt.CustomerEmail__c = (String)jsonMap.get('customerEmail');
        objCustomerEReceipt.CustomerMobilePhoneNumber__c = (String)jsonMap.get('customerMobilePhoneNumber');
        objCustomerEReceipt.CustomerHomePhoneNumber__c = (String)jsonMap.get('customerHomePhoneNumber');
        objCustomerEReceipt.CustomerWorkPhoneNumber__c = (String)jsonMap.get('customerWorkPhoneNumber');
        objCustomerEReceipt.Total_Refund_Items__c = string.valueof((Integer)jsonMap.get('totalRefundItems'));
        objCustomerEReceipt.nonLoyaltyEmail__c = (String)jsonMap.get('nonLoyaltyEmail');
        objCustomerEReceipt.LoyaltyPoints__c = (String)jsonMap.get('loyaltyPoints');
        
        
        
        
        
        // Not Required fields
        
        objCustomerEReceipt.SalespersonId__c = (String)jsonMap.get('salespersonId');
        objCustomerEReceipt.Salesperson_Name__c = (String)jsonMap.get('salespersonName');
        objCustomerEReceipt.Cashier_userId__c = (String)jsonMap.get('userId');
        objCustomerEReceipt.Cashier_userName__c = (String)jsonMap.get('userName');
        objCustomerEReceipt.Cashier_userFirstName__c = (String)jsonMap.get('userFirstName');
        objCustomerEReceipt.Cashier_userLastName__c = (String)jsonMap.get('userLastName');
        objCustomerEReceipt.CurrencyId__c = (String)jsonMap.get('currencyId');
        objCustomerEReceipt.DiscountTotal__c = (String)jsonMap.get('discountTotal');
        objCustomerEReceipt.TotalTaxValue__c = (String)jsonMap.get('totalTaxValue');
        
        
        //  message = (String)jsonMap.get('taxExempt'); 
        // objCustomerEReceipt.TransactionId__c = (integer)jsonMap.get('transactionId'); -------------------------------- causing issue
        // objCustomerEReceipt.tranItems__c = (String)jsonMap.get('tranItems');
        // objCustomerEReceipt.payments__c = (String)jsonMap.get('payments');
        //  objCustomerEReceipt.transactionDiscounts__c = (String)jsonMap.get('transactionDiscounts');
        
        
        
        //objCustomerEReceipt.CustomerEmail__c = 'Test@gmail.com';
        //objCustomerEReceipt.nonLoyaltyEmail__c = 'Test@gmail.com';
        
        
        
        
        
        
        
        // Loyalty User details 
        
        List<Object> listLoyaltyUser = (List<Object>) jsonMap.get('loyaltyUser');
        if(listLoyaltyUser != null)
        Map<String,object> mapLoyaltyUserJSON = (Map<String,object>)listLoyaltyUser[0];
        
        objCustomerEReceipt.loyaltyId__c = (String)jsonMap.get('loyaltyId');
        objCustomerEReceipt.Loyalty_FirstName__c = (String)jsonMap.get('loyaltyFName');
        objCustomerEReceipt.Loyalty_LastName__c = (String)jsonMap.get('loyaltyLName');
        objCustomerEReceipt.Loyalty_Email__c = (String)jsonMap.get('loyaltyEmail');
        objCustomerEReceipt.Loyalty_MobilePhoneNumber__c = (String)jsonMap.get('mobilePhoneNumber');
        objCustomerEReceipt.Loyalty_Type__c = (String)jsonMap.get('loyaltyType');
        
        
        
        
        // Tax details
        List<Tax__c> listTaxRec = new List<Tax__c>();
        List<Object> listTax = (List<Object>) jsonMap.get('tax');
        
        for(object objTax : listTax ){
            Map<String,object> maptaxJSON = (Map<String,object>)objTax;
            Tax__c objtaxRec = new Tax__c();
            objtaxRec.TaxID__c = (String)maptaxJSON.get('id');
            objtaxRec.Tax_Description__c = (String)maptaxJSON.get('description');
            objtaxRec.Tax_DisplayCode__c = (String)maptaxJSON.get('displayCode');
            objtaxRec.Tax_Indicator__c = (String)maptaxJSON.get('indicator');
            objtaxRec.Tax_Type__c = 'tax'; 
            objtaxRec.Tax_Total__c = (String)maptaxJSON.get('total');         
            listTaxRec.add(objtaxRec);
        }
        
        List<Object> listVATTax = (List<Object>) jsonMap.get('totalVAT');
        for(object objTax : listVATTax ){
            Map<String,object> maptaxJSON = (Map<String,object>)objTax;
            Tax__c objtaxRec = new Tax__c();
            objtaxRec.TaxID__c = (String)maptaxJSON.get('id');
            objtaxRec.Tax_Description__c = (String)maptaxJSON.get('description');
            objtaxRec.Tax_DisplayCode__c = (String)maptaxJSON.get('displayCode');
            objtaxRec.Tax_Indicator__c = (String)maptaxJSON.get('indicator');
            objtaxRec.Tax_Type__c = 'totalVAT';    
            objtaxRec.Tax_Total__c = (String)maptaxJSON.get('total');         
            listTaxRec.add(objtaxRec);
        }
        
        
        
        
        //objCustomerEReceipt.DiscountTotal__c = (String)maptaxJSON.get('discountTotal');
        
        
        
        
        //Payment List
        Map<String,object> mapPaymentJson = (Map<String,object>)jsonMap.get('payments');
        if(mapPaymentJson != null && mapPaymentJson.containsKey('debit') != null){
            List<Object> listCredits = (List<Object>) mapPaymentJson.get('debit');
            for(object objdebit : listCredits ){
                Map<String,object> mapDebit = (Map<String,object>)objdebit;
                objCustomerEReceipt.CreditCard_Description__c = (String)mapDebit.get('cardDescription');
            }
        }
        
        
        //Cash
        if(mapPaymentJson != null && mapPaymentJson.containsKey('cash') != null){
            List<Object> listCash = (List<Object>) mapPaymentJson.get('cash');
            for(object objCash : listCash ){
                Map<String,object> mapCash = (Map<String,object>)objCash ;
                objCustomerEReceipt.Cash_Amount__c = (String)mapCash.get('amount');
                
            }
        }
        
        
        listCustomerEReceipt.add(objCustomerEReceipt);
        List<TransactionItem__c> listtransInsert = new List<TransactionItem__c >();
        List<object> listTransactionJson = (List<Object>)jsonMap.get('tranItems');
        for(object objPromotion : listTransactionJson ){
            TransactionItem__c objTransactionItem = new TransactionItem__c();
            
            //UnderTransactionItem mapping 
            Map<String,object> mapPromotions = (Map<String,object>)objPromotion;
            //itemType //paidFlag//rrpPrice//amount
            
            ////tender Detail Values for Mapping 
            Map<String,object> maptenderDetail = (Map<String,object>)mapPromotions.get('tenderDetails');
            
            
            
            //Product Values for Mapping 
            Map<String,object> mapProduct = (Map<String,object>)mapPromotions.get('product');
            if(mapProduct  != null){
                objTransactionItem.Transaction_Sku__c  = (String)mapProduct.get('sku');
                objTransactionItem.Transaction_Description__c = (String)mapProduct.get('description');
                objTransactionItem.Transaction_Barcode__c = (String)mapProduct.get('barcode');
                objTransactionItem.Transaction_Barcode__c = (String)mapProduct.get('barcode');
                objTransactionItem.Transaction_ItemName__c = (String)mapProduct.get('name');
                //PropertiesJason
                Map<String,Object> mappropertiesJson = (Map<String,Object>)mapProduct.get('propertiesJson');
                
                //Products data
                Map<String,Object> mapproducts = (Map<String,Object>)mappropertiesJson.get('products');
                //maxNoOfDiscounts = (String)mapproducts.get('maxNoOfDiscounts');
            }
            
            
            // Map<String,object> mapProductwithProduct = (Map<String,object>)mapProducts.get('products');
            
            
            
            List<object> listPromotions = (List<object>)mapPromotions.get('promotions');
            if(listPromotions  != null){
                for(object objpromotionVal :  listPromotions ){
                    Map<String,object> mapPromotionsval = (Map<String,object>)objpromotionVal;
                    object promoutinValObj = (object)mapPromotionsval.get('amount');
                    if(String.valueOf(promoutinValObj ) != '' && String.valueOf(promoutinValObj ).contains('$')){
                        message = String.valueOf(promoutinValObj );
                        //objTransactionItem.amount__c = String.valueOf(promoutinValObj);
                        objTransactionItem.Transaction_ProductType__c = (String)mapPromotionsval.get('productType');
                        // objTransactionItem.Transaction_Sku__c = objTrans.sku;
                        // objTransactionItem.Transaction_Barcode__c = objTrans.barcode;
                        // objTransactionItem.Transaction_Description__c = objTrans.description;
                        //Do all the mapping of transaction item field.
                    }else{
                        Map<String,object> mapPromotionsvalFinal = (Map<String,object>)promoutinValObj;    
                    }
                    
                }
            }
            listtransInsert.add(objTransactionItem);  
        }
        
        if(!listTaxRec.isEmpty())
            Insert listTaxRec ;
            
            
        if(!listtransInsert.isEmpty()){
            Insert listtransInsert ;
        }
        
        if(!listCustomerEReceipt.isEmpty()){
            Insert listCustomerEReceipt;
        }
        
        
        //update trans 
        List<TransactionItem__c> listtransupdate = new List<TransactionItem__c >();    
        for(TransactionItem__c  objTrans : listtransInsert ){
            objTrans.E_Receipts_Number__c = listCustomerEReceipt[0].ID;
            listtransupdate.add(objTrans);
        }
        if(!listtransupdate.isEmpty()){
            update listtransupdate;
        }
        
        List<Tax__c> listTaxdate = new List<Tax__c>();    
        for(Tax__c objTax : listTaxRec ){
            objTax.Customer_E_Receipts__c= listCustomerEReceipt[0].ID;
            listTaxdate.add(objTax);
        }
        
        if(!listTaxdate.isEmpty()){
            update listTaxdate;
        }
        
        if(!listtransupdate.isEmpty()){
            update listtransupdate;
        }
        
        listCustomerEReceipt[0].SendData__c = true;
        update listCustomerEReceipt;
        }
        catch(Exception ex) {
            message =ex.getMessage();
        }
        return message ; 
    }
    
    
    
    
}