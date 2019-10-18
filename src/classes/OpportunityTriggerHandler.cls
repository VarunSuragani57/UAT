public class OpportunityTriggerHandler {
 public static void beforeInsertUpdate(List<Opportunity> newOpportunities){
     Map<String,List<String>> mapCategoryManagement = new Map<String,List<String>>();
        CategoryManagement__mdt[] CategoryManagement = [SELECT MasterLabel,Category__c,Material__c FROM CategoryManagement__mdt];
        for(CategoryManagement__mdt objCategoryManagement : CategoryManagement){
            if(!mapCategoryManagement.containsKey(objCategoryManagement.Category__c))
                mapCategoryManagement.put(objCategoryManagement.Category__c,new List<String>{objCategoryManagement.Material__c});
            else
                mapCategoryManagement.get(objCategoryManagement.Category__c).add(objCategoryManagement.Material__c);
        }
        for(Opportunity opp: newOpportunities){
            if(opp.Category__c != null)
            {
                List<String> Categories = opp.Category__c.split(';');
            List<String> materialList = new List<String>();
            for(String objCategory : Categories ){
                if(mapCategoryManagement.containsKey(objCategory))
                materialList.addall(mapCategoryManagement.get(objCategory));
            }
            opp.Material__c = string.join(materialList,';'); 
            }
            
        }

     
 }
}