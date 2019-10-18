public class AttachmentTriggerHandler {
    static final String keyPrifix = Ideas_That_Work__c.sobjecttype.getDescribe().getKeyPrefix();
    
    public static void afterDelete(List<Attachment> listAttachmentOld){
        set<Id> setIdeaWorkId = new Set<Id>();
        for(Attachment objAtt : listAttachmentOld){
           if(String.valueOf(objAtt.parentId).subString(0, 3) == keyPrifix){
                setIdeaWorkId.add(objAtt.parentId);
            } 
        }
        list<Ideas_That_Work__c> listIdeaThatWorkUpdate = new List<Ideas_That_Work__c>();
        List<Ideas_That_Work__c> listIdeasThatWork = [select Id,(select Id from attachments) from Ideas_That_Work__c WHERE ID IN : setIdeaWorkId];
        for(Ideas_That_Work__c objIdeasThatWork : listIdeasThatWork){
            if(objIdeasThatWork.attachments.isEmpty()){
                objIdeasThatWork.Attachment_Available__c = false;
                listIdeaThatWorkUpdate.add(objIdeasThatWork);
            }
        }
        update listIdeaThatWorkUpdate;
    }
}