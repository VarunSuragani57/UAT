/**
* @author        IBM - Varun Suragani
* @Name          CaseTriggerHelper 
* @Created date  03/22/2018
* @description   Apex class to provide the functionality to send emails
* @Version       42.0      
*/

public class CaseTriggerHelper{

    public static Map<String,List<String>> mapGroupNameToEmailIds;
    public static Map<Id,Attachment> mapAttachment = new Map<Id,Attachment>();
    public static Map<Id,Id> mapContent = new Map<Id,Id>();
    
    public static void beforeInsert(List<Case> newCase){
    }
    
    public static void afterInsert(List<Case> newCase){
        Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Brand Management').getRecordTypeId();
        Map<id,Case> mapCase2 = new Map<Id,Case>();
        for(case objCase : newCase){
           if((objCase.status == 'New') && (objCase.RecordtypeId == devRecordTypeId) )
                mapCase2.put(objCase.Id,objCase);
            if((objCase.status == 'Open' || objCase.status == 'Brand Integrity Reviewed' || objCase.status == 'Escalated') && (objCase.RecordtypeId == devRecordTypeId) )
                mapCase2.put(objCase.Id,objCase);
        }
        sendNotificationToManagerOnChangeStatus(mapCase2);
        
    } 
    
     public static void beforeUpdate(List<Case> newCase,Map<Id,Case> mapOldCases){
          System.debug('======mapOldCases========='+mapOldCases);
         
          for(case objCase : newCase){
          System.debug('======mapAttachment========='+mapAttachment);
          System.debug('======objCase.Id========='+objCase.Id);
              //if(!objCase.Attachment_Available__c && objCase.status == 'Closed' && objCase.status != mapOldCases.get(objCase.Id).status){
              //      objCase.addError('Please attach attachment!');
              //  }
                if(objCase.status != mapOldCases.get(objCase.Id).status && mapOldCases.get(objCase.Id).status == 'Review Reject'){
                    objCase.Previous_Case_Reject_reason__c = objCase.Case_Reject_Reason__c ;
                    objCase.Case_Reject_Reason__c = '';
                }   
            }
            
     }
     
     
    public static void afterUpdate(List<Case> newCase,Map<Id,Case> mapOldCases){
    
    Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Brand Management').getRecordTypeId();
        Map<id,Case> mapCase = new Map<Id,Case>();
        Map<id,String> mapRejectedCase = new Map<Id,String>();
        Map<id,Case> mapCase2 = new Map<Id,Case>();
        for(case objCase : newCase){
            //if((objCase.RecordtypeId == devRecordTypeId)  && ( objCase.status == 'Closed' && objCase.status != mapOldCases.get(objCase.Id).status))
            //   mapCase.put(objCase.Id,objCase);
            if(objCase.status != 'Closed'){
            if((objCase.status == 'Open'|| objCase.status == 'Brand Integrity Reviewed' || objCase.status == 'Escalated') && (objCase.RecordtypeId == devRecordTypeId)  && (objCase.status != mapOldCases.get(objCase.Id).status))
                   mapCase2.put(objCase.Id,objCase);  
            }
            if(objCase.status != mapOldCases.get(objCase.Id).status && objCase.status== 'Review Reject'){
                mapRejectedCase.put(objCase.Id,objCase.Previous_Case_Reject_reason__c);
            }  
        }
        //if(mapCase.size()>0)
        //sendNotificationToManager(mapCase);
        if(mapRejectedCase.size()>0)
            createCaseComment(mapRejectedCase);
        if(mapCase2.size()>0)
        sendNotificationToManagerOnChangeStatus(mapCase2);
    }
    
    public  Static Map<Id,Integer> caseHistory(Map<id,String> mapRejectedCase){
        Map<Id,Integer> tempMapCaseIdToRejectedCount = new Map<Id,Integer>();
        for(CaseHistory objCase : [SELECT Id,OldValue,NewValue,CaseId from CaseHistory Where CaseId IN : mapRejectedCase.Keyset()]){
            if(objCase.NewValue == 'Review Reject' && !tempMapCaseIdToRejectedCount.containsKey(objCase.CaseId)){
                tempMapCaseIdToRejectedCount.put(objCase.CaseId,1);
            }else if(objCase.NewValue == 'Review Reject'){
                tempMapCaseIdToRejectedCount.put(objCase.CaseId,tempMapCaseIdToRejectedCount.get(objCase.CaseId)+1);
            }
               
        }
        return tempMapCaseIdToRejectedCount ;
    }
    public static void sendNotificationToManagerOnChangeStatus(Map<Id,Case> mapCases){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        //EmailTemplate et=[Select id from EmailTemplate where name = 'Retail Case HTML' limit 1];
        Map<Id,Case> mapCaseIdToCaseComment = getCaseComment(mapCases);
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> ();
        for(Id ids : mapCases.Keyset()){
             String CaseComment = '';
            if(!mapCaseIdToCaseComment.get(Ids).CaseComments.isEmpty() && mapCaseIdToCaseComment.get(Ids).CaseComments!= null && mapCaseIdToCaseComment.get(Ids).CaseComments[0].CommentBody != null)
                CaseComment = mapCaseIdToCaseComment.get(Ids).CaseComments[0].CommentBody;
                
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();            
            List<String> emailMessage = new List<String>();
            if(mapCases.get(Ids).AccountId!= null && mapCases.get(Ids).Account.Owner.Email!= null && mapCases.get(Ids).Account.Owner.Email != null){
                sendTo.add(mapCases.get(Ids).Account.Owner.Email);
            }
            if(mapCases.get(Ids).Internal_Contact1__c != null && mapCases.get(Ids).Internal_Contact1__r.Email != null){
                sendTo.add(mapCases.get(Ids).Internal_Contact1__r.Email);
            }
            if(mapCases.get(Ids).Internal_Contact2__c != null && mapCases.get(Ids).Internal_Contact2__r.Email != null){ 
                sendTo.add(mapCases.get(Ids).Internal_Contact2__r.Email);
            }
            if(mapCases.get(Ids).Internal_Contact3__c != null && mapCases.get(Ids).Internal_Contact3__r.Email != null){
                sendTo.add(mapCases.get(Ids).Internal_Contact3__r.Email);
            }
            if(mapCases.get(Ids).Internal_Contact4__c != null && mapCases.get(Ids).Internal_Contact4__r.Email != null){
                sendTo.add(mapCases.get(Ids).Internal_Contact4__r.Email);
            }
            if(mapCases.get(Ids).Internal_Contact5__c != null && mapCases.get(Ids).Internal_Contact5__r.Email != null){
                sendTo.add(mapCases.get(Ids).Internal_Contact5__r.Email);
            }
            if(sendTo.size() > 0){
                mail.setToAddresses(sendTo);
                String body ='';
                body += '<div style="background-color:#cccccc"><div Style="margin-left:10%"><img src="https://carhartt--de.cs91.my.salesforce.com/servlet/servlet.ImageServer?id=0152F000000FOwD&oid=00D2F000000CrWq&lastMod=1522094226000" alt="Sample Image" height="100" width="80%"/></div>';
                body += '<div Style="height:500px;margin-left:10%;background-color:white;width:72%"><br/><br/><br/>Hi '+ ',<br/><br/> ';
                body += 'Case Url:- <a href="'+System.Label.EmailTemplateUrl+'/'+mapCases.get(Ids).Id+'">'+'Case URL'+'</a><br/>';
                body += 'Case Subject :- '+mapCases.get(Ids).Subject+'<br/>';
                
                if(mapCases.get(Ids).Status == 'Escalated'){
                    mail.setSubject('========' +  mapCases.get(Ids).Type); 
                }
                else if(mapCases.get(Ids).Status != 'New' && mapCases.get(Ids).Status != 'Escalated'){
                    mail.setSubject('Brand Inegrity review' +  mapCases.get(Ids).Type); 
                    
               
                }else{
                    mail.setSubject('New Case' +  mapCases.get(Ids).Type); 
                    body += 'Case Description:- '+mapCases.get(Ids).Description+'<br/>';   
                }
                body += 'Case Number:- '+mapCases.get(Ids).CaseNumber+'<br/>';
                body += 'Case Type:- '+mapCases.get(Ids).Type+'<br/>';
                body += 'Case Status:- '+mapCases.get(Ids).Status+'<br/><br/>';
                body += 'CaseComment :- '+CaseComment+'<br/><br/>';
                body += 'Thank You</div></div>'; 
                
                mail.setHtmlBody(body); 
                mails.add(mail);        
                system.debug(emailMessage);
            }
            
            
        }
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
        System.debug('===results ===='+results );
    }
    
    public static Map<Id,Case> getCaseComment(Map<Id,Case> mapCases){
        Map<Id,Case> mapCaseIdToCaseComment = new Map<Id,Case>([SELECT ID,(SELECT ID,CommentBody
                                                                 FROM CaseComments LIMIT 1) from Case Where ID IN : mapCases.Keyset()]);
        return mapCaseIdToCaseComment ;
    }
    
    /* 
    public static Map<Id,Attachment> getAttachment(Map<Id,Case> mapCases){
        Map<Id,Attachment> tempmapAttachment = new Map<Id,Attachment>();
        for(Attachment att : [select parentId,Name, Body, BodyLength from Attachment where ParentId = : mapCases.keyset()]){
            tempmapAttachment.put(att.parentId,att);
        }
        return tempmapAttachment ;
    }
    */
    
    
    /*
     public static void sendNotificationToManager(Map<Id,Case> mapCases){
        List<OrgwideEmailAddress>  orgWideEmailAddRecord = [SELECT Address,CreatedById,CreatedDate,DisplayName,Id,IsAllowAllProfiles 
                                                            FROM OrgWideEmailAddress Where Address =:System.label.BrandManagementDefaultemailaddress];
        EmailTemplate et=[Select id from EmailTemplate where name = 'Brand Management Close case email template' limit 1];
        
        List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
        mapAttachment = getAttachment(mapCases);     
        
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> ();
        for(Id ids : mapCases.Keyset()){
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            if(mapCases.get(ids).ContactId != null){
            
                message.setTemplateId(et.id);
                message.setTargetObjectId(mapCases.get(ids).contactId);
                message.setSaveAsActivity(false);
                message.setWhatId(ids);  
                message.setWhatId(ids);  
                if ( orgWideEmailAddRecord.size() > 0 ) {
                   message.setOrgWideEmailAddressId(orgWideEmailAddRecord.get(0).Id);
                }
                if(mapAttachment.get(ids) != null){
                    Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                    efa.setFileName(mapAttachment.get(ids).Name);
                    efa.setBody(mapAttachment.get(ids).Body);
                    fileAttachments.add(efa);
                    message.setFileAttachments(fileAttachments);
                }
                {
                   List<ContentDocumentLink> listContentDocument =   [SELECT ContentDocumentID, LinkedEntity.type, LinkedEntityId 
                                                                        FROM ContentDocumentLink 
                                                                        WHERE LinkedEntityId = :ids];
                   Set<Id> setContentDocumentIds = new Set<Id>();
                   for(ContentDocumentLink objContentDocumentLink : listContentDocument ){
                       setContentDocumentIds.add(objContentDocumentLink.ContentDocumentID); 
                   } 
                   System.debug('====setContentDocumentIds====='+setContentDocumentIds);                                                    
                   if(setContentDocumentIds.size()>0){
                   ContentDocument objContentDoc = [SELECT ArchivedById FROM ContentDocument WHERE ID IN : setContentDocumentIds order By CreatedDate DESC LIMIT 1];                                                    
                   ContentVersion   objContentVersion   = [SELECT Title,FileType ,VersionData,ContentDocumentId  FROM ContentVersion WHERE ContentDocumentId   =:objContentDoc.Id  limit 1];
                    
                    Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                    efa.setFileName(objContentVersion.Title+'.'+objContentVersion.FileType);
                    efa.setBody(objContentVersion.VersionData);
                    fileAttachments.add(efa);
                    message.setFileAttachments(fileAttachments);
                   }                                                  
                }
                //List<String> sendTo = new List<String>{'kumar.technodev24@gmail.com'};  
                //message.setToAddresses(sendTo);
                messages.add(message);
            }
         }
         
         Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
    }
    */
    public Static Void createCaseComment(Map<Id,String> caseMap){
        List<CaseComment> NewComment = new List<CaseComment>();
        Map<Id,Integer> tempCaseHistoryMap = caseHistory(caseMap);
        for(Id ids : caseMap.Keyset()){
            if(tempCaseHistoryMap.ContainsKey(ids) && tempCaseHistoryMap.get(ids) >= 1){
                CaseComment com = new CaseComment();
                com.ParentId = ids ;
                com.CommentBody= 'Case Reject Reason-'+caseMap.get(ids);
                NewComment.add(com) ;
            }
        }
        
        if(!NewComment.isEmpty())
            Insert NewComment;
    }
    
    
}