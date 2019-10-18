public class CaseDiscountCalculations{

  
     public static void CalculateTotalRefund(List<Case> newCase, boolean isorderitem){
      set<id> caseids = new set<id>();
          for(Case objCase : newCase){
          caseids.add(objCase.id);
        }
      
      

        Map<string,decimal> caseIDvtAmount = new Map<string,decimal>();

         Map<string,decimal> caseIDvtTax = new Map<string,decimal>();

        for(Order_Item__c  ss :  [select id,Case__r.id,Product_Cost__c,Tax__c,Discount_if_applicable__c,Discount_if_applicable_Dollar__c from Order_Item__c where Case__r.id in :caseids]){
           

                if (! caseIDvtAmount.containsKey(ss.Case__r.id)) {
                  caseIDvtAmount.put(ss.Case__r.id,0);                   
                }
                caseIDvtAmount.put(ss.Case__r.id,caseIDvtAmount.get(ss.Case__r.id) + ss.Tax__c + ss.Product_Cost__c);
                
                
                 if (! caseIDvtTax.containsKey(ss.Case__r.id)) {
                  caseIDvtTax.put(ss.Case__r.id,0);                   
                }
                caseIDvtTax.put(ss.Case__r.id,caseIDvtTax.get(ss.Case__r.id) + ss.Tax__c );
            
        }
        
         system.debug('caseIDvtAmount------------- ' + caseIDvtAmount); 
       list<case> casetoUpd = new list<case>();
         for(Case objCase : newCase){
         if(caseIDvtAmount.get(objCase.id) != null){
         objCase.Total_Refund__c = caseIDvtAmount.get(objCase.id);
         }else{
         objCase.Total_Refund__c = 0;
         }
         if(caseIDvtTax.get(objCase.id) != null){
         objCase.Total_Tax_Refund__c = caseIDvtTax.get(objCase.id);
         }else{
         objCase.Total_Tax_Refund__c = 0;
         }
         
          if(objCase.Freight_Refund__c == true){
             objCase.Total_Refund__c += objCase.Freight_Amount__c + objCase.Freight_Tax__c;
             objCase.Total_Tax_Refund__c += objCase.Freight_Tax__c;
             }
             
          if(objCase.Discount_if_applicable_Dollar__c != null){
            //objCase.Total_Tax_Refund__c += objCase.Discount_if_applicable_Dollar__c;
            objCase.Total_Refund__c  += objCase.Discount_if_applicable_Dollar__c;
          }  
          
          if(objCase.Discount_if_applicable__c != null){ //merchandise refund
             objCase.Total_Refund__c += ((objCase.Total_Merchandise__c * objCase.Discount_if_applicable__c)/100);     
             objCase.Total_Tax_Refund__c += ((objCase.Tax__c * objCase.Discount_if_applicable__c)/100);  
          } 
         /*  if(objCase.Discount_if_applicable__c != null){ //order refund
             objCase.Total_Refund__c += ((objCase.Total_Order__c * objCase.Discount_if_applicable__c)/100);      
          }*/
           if(objCase.Discount_if_applicable_Dollar__c != null){ // tax refund
            objCase.Total_Refund__c += ((objCase.Tax__c / objCase.Total_Merchandise__c ) * objCase.Discount_if_applicable_Dollar__c);   
              objCase.Total_Tax_Refund__c += ((objCase.Tax__c / objCase.Total_Merchandise__c ) * objCase.Discount_if_applicable_Dollar__c);   
          }
         
          casetoUpd.add(objCase);
        }
        
        if(isorderitem == true && casetoUpd.size()>0){
          update casetoUpd;
        }
       
     }
    
}