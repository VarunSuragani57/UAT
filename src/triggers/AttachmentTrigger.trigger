trigger AttachmentTrigger on Attachment (before insert,after delete) {
    set<Id> setIdeaWorkId = new Set<Id>();
    String keyPrifix = Ideas_That_Work__c.sobjecttype.getDescribe().getKeyPrefix();
    if(trigger.isDelete){
        AttachmentTriggerHandler.afterDelete(trigger.old);  
    }
    if(trigger.isInsert){
        for(Attachment objAtt : trigger.new){
            if(String.valueOf(objAtt.parentId).subString(0, 3) == keyPrifix){
                setIdeaWorkId.add(objAtt.parentId);
            }
        }
    }
    list<Ideas_That_Work__c> listIdeaThatWorkUpdate = new List<Ideas_That_Work__c>();
    List<Ideas_That_Work__c> listIdeaThatWork = [Select Id from Ideas_That_Work__c WHERE ID IN :setIdeaWorkId];
    for(Ideas_That_Work__c objIdeatThatWork : listIdeaThatWork){
        objIdeatThatWork.Attachment_Available__c = true;
        listIdeaThatWorkUpdate.add(objIdeatThatWork);
    }
    update listIdeaThatWorkUpdate;

}