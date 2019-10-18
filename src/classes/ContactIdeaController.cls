public class ContactIdeaController {

    @AuraEnabled
    public static Ideas_That_Work__c newIdeasThatWork() {
        return (Ideas_That_Work__c) Ideas_That_Work__c.sObjectType.newSObject(null, true);
    }

    @Auraenabled
    public static List < LegalTermCondition__mdt > getStatements() {
        LegalTermCondition__mdt[] listLegalTermConditions = [SELECT MasterLabel, isChecked__c, statement__c From LegalTermCondition__mdt Order By MasterLabel ASC];
        List < String > listStatements = new List < String > ();
        for (LegalTermCondition__mdt objLegalTermConditions: listLegalTermConditions) {
            listStatements.add(objLegalTermConditions.Statement__c);
        }
        return listLegalTermConditions;
    }

    @Auraenabled
    public static Ideas_That_Work__c createIdea(String jsonString, String Id, String DML) {
        Map < String, Object > meta = (Map < String, Object > ) JSON.deserializeUntyped(JsonString);
        Ideas_That_Work__c newideaRec = new Ideas_That_Work__c();
        if (DML == 'Update') {
            newideaRec.put('Id', Id);
        }
        String objType = 'Ideas_That_Work__c';
        Map < String, Schema.SObjectType > schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(objType);
        Map < String, Schema.SObjectField > fieldMap = leadSchema.getDescribe().fields.getMap();
        Set < String > NotIncludeFieldSet = new Set < String > {
            'IsDeleted',
            'TermCondition__c',
            'Attachment_Available__c'
        };
        system.debug('======jsonString-======' + jsonString);
        for (String fieldName: meta.KeySet()) {
            Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            if (!NotIncludeFieldSet.contains(fieldName)) {
                //system.debug('======fielddataType-======'+fielddataType);
                //System.debug('=======field====='+fieldName);
                //System.debug('=====value======='+(string)meta.get(fieldName));
                String value = (string) meta.get(fieldName);
                newideaRec.put(fieldName, value);
            }
        }


        if (DML == 'Update') {
            Update newideaRec;
        } else {
            Insert newideaRec;
        }
        System.debug(meta);
        return [SELECT Any_professional_or_personal_abt_idea_25__c, TermCondition__c, Are_there_other_brands_currently_20__c, Carhartt_currently_offering_your_idea__c,
            City__c,Carhartt_make_something_similar__c, CreatedById, CreatedDate, Do_you_have_any_information_regarding_co__c, Email__c,
            Explain_Carhartt_offers_to_idea_19__c, First_Name__c, Id, Idea_Category_Others_11__c, Idea_Category__c,
            Idea_Title_13__c, Information_regarding_copyrights_22__c, Information_regarding_copyrights_Text_23__c,
            Interested_in_your_idea_or_purchasing_15__c, Last_Name__c, Name, OwnerId, Phone_Number__c,
            Product_Idea_Ans_12__c, State__c, Street_Address__c, SystemModstamp, Tell_us_about_your_idea_14__c,
            Tell_us_a_little_bit_more_about_yourself__c, what_other_brands_similar_to_idea_21__c, ZipCode__c FROM Ideas_That_Work__c
            Where Id =: newideaRec.Id
        ];

    }

}