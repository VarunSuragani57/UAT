trigger Transaction_Trigger  on TransactionItem__c (After insert) {    
    sendRequestToMarketingCloud.sendCustomerEReceipt(Trigger.newmap.Keyset());

}