trigger Customer_Ereceipt_Trigger on Customer_E_Receipts__c (After update) {    
    sendRequestToMarketingCloud.sendCustomerEReceipt(Trigger.newmap.Keyset());
}