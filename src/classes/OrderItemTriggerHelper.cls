public class OrderItemTriggerHelper{


public static void afterUpdate(list<Order_Item__c> oitemlist){
   set<id> caseids = new set<id>();
   for(Order_Item__c oi: oitemlist){
    caseids.add(oi.Case__c);
   }
   if(caseids.size()>0){
   list<case> cslist = new list<case>();
   cslist = [select id,Total_Refund__c ,Total_Tax_Refund__c, Freight_Refund__c ,Freight_Amount__c ,Freight_Tax__c,Discount_if_applicable_Dollar__c ,Total_Merchandise__c ,Total_Order__c ,Tax__c from case where id in: caseids ];
   CaseDiscountCalculations.CalculateTotalRefund(cslist, true);
   }
}

}