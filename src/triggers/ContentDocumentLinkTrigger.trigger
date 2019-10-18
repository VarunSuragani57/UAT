trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert) {
    set<Id> setIdeaWorkId = new Set<Id>();
    String keyPrifix = Ideas_That_Work__c.sobjecttype.getDescribe().getKeyPrefix();
    for(ContentDocumentLink objContentDoc : trigger.new){
        System.debug('====='+String.valueOf(objContentDoc.id).subString(0, 3));
        System.debug('====='+keyPrifix);
        if(String.valueOf(objContentDoc.id).subString(0, 3) == keyPrifix){
            setIdeaWorkId.add(objContentDoc.LinkedEntityId);
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