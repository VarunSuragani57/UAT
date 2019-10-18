trigger CaseTrigger on Case (before Insert,before update,after insert ,after update) {
        if(trigger.isUpdate ){
        
            if(trigger.isAfter){
                list<Case> caselist = new List<Case>([Select Id,Status,Attachment_Available__c,Previous_Case_Reject_reason__c,Subject,Case_Reject_Reason__c,RecordTypeId,Internal_Contact1__r.Email,contactId,
                Internal_Contact2__r.Email,Internal_Contact3__r.Email,Case.Type,Account.Owner.Email,AccountId,CaseNumber,Description,Internal_Contact4__r.Email,Internal_Contact5__r.Email from Case Where ID IN : trigger.newMap.keyset()]);
                CaseTriggerHelper.afterUpdate(caselist ,trigger.oldmap);
            }
            if(trigger.isBefore){
                CaseTriggerHelper.beforeUpdate(trigger.new,trigger.oldMap); 
                //CaseDiscountCalculations.beforeUpdate(trigger.new,trigger.oldMap); 
                CaseDiscountCalculations.CalculateTotalRefund(trigger.new,false);
            }
            
        }
        if(trigger.isInsert){
            
            if(trigger.isAfter){
                list<Case> caselist = new List<Case>([Select Id,Attachment_Available__c,Previous_Case_Reject_reason__c,Status,Case_Reject_Reason__c,Subject,RecordTypeId,Internal_Contact1__r.Email,contactId,Account.Owner.Email,AccountId,
                Internal_Contact2__r.Email,Internal_Contact3__r.Email,Internal_Contact4__r.Email,Type,CaseNumber,Description,Internal_Contact5__r.Email from Case Where ID IN : trigger.newMap.keyset()]);
                CaseTriggerHelper.afterInsert(caselist );
            }
            if(trigger.isBefore){
               // CaseTriggerHelper.beforeInsert(trigger.new); 
                //CaseDiscountCalculations.beforeUpdate(trigger.new,trigger.oldMap); 
                 CaseDiscountCalculations.CalculateTotalRefund(trigger.new,false);
            }
               
        } 
       
}