trigger ContentDocumentTrigger on ContentDocumentLink (after insert) {
    Set<Id> setContentDocumentIds = new Set<Id>();
    for(ContentDocumentLink objContentDocumentLink : trigger.new){
        setContentDocumentIds.add(objContentDocumentLink.LinkedEntityId);
    }
    list<Case> listUpdateCase = new List<Case>();
    List<Case> listCases = [Select Id,Attachment_Available__c from Case WHERE ID IN : setContentDocumentIds];
    for(Case objCase : listCases){
        objCase.Attachment_Available__c = true;
        listUpdateCase.add(objCase);
    }
    update listUpdateCase;
    
}