trigger OrderItemTrigger on Order_Item__c  (before Insert,before update,after insert ,after update) {
        if(trigger.isUpdate ){
        
            if(trigger.isAfter){
               OrderItemTriggerHelper.afterUpdate(trigger.New);
            }
            
            
        }
             
}