global class MultiselectController {
    
    @Auraenabled
    public static List<MultiSelectControllerWrapper> getAccountName(String recordId){
        List<MultiSelectControllerWrapper> listMultiSelectControllerWrapper = new List<MultiSelectControllerWrapper>();
        Opportunity opp = [SELECT ID,Material__c,Category__c from  Opportunity WHERE ID =:recordId];
        Set<String> selectedCategory = new Set<String>();
        if(opp.Category__c != null)
        selectedCategory.addAll(opp.Category__c.split(';'));
        Set<CategoryManagement__mdt> acclist = new Set<CategoryManagement__mdt>();
        Set<String> uniquecategory = new Set<string>();
        List<CategoryManagement__mdt> uniqueAcclist = new List<CategoryManagement__mdt>();
        CategoryManagement__mdt[] CategoryManagement = [SELECT MasterLabel,Category__c,Material__c,Ischecked__c FROM CategoryManagement__mdt];
        for(CategoryManagement__mdt objAccount : CategoryManagement){
           MultiSelectControllerWrapper objMultiSelectControllerWrapper = new MultiSelectControllerWrapper(); 
            if(!uniquecategory.Contains(objAccount.Category__c)){
                    objMultiSelectControllerWrapper.objCategoryMangement = objAccount;
                objMultiSelectControllerWrapper.isSelected = false; 
                if(selectedCategory.contains(objAccount.Category__c)){
                    objMultiSelectControllerWrapper.isSelected = true;     
                }
                uniquecategory.add(objAccount.Category__c); 
                listMultiSelectControllerWrapper.add(objMultiSelectControllerWrapper);
            }
            
        }
        
        return listMultiSelectControllerWrapper;
    }
    
    @Auraenabled
    public static List<MultiSelectControllerWrapper> getMaterialOnload(String recordId){
        List<MultiSelectControllerWrapper> listMultiSelectControllerWrapper = new List<MultiSelectControllerWrapper>();
        Opportunity opp = [SELECT ID,Material__c,Category__c from  Opportunity WHERE ID=:recordId];
        Set<String> selectedCategory = new Set<String>();
        Set<String> selectedMaterial = new Set<String>(); 
        if(opp.Material__c != null)
        selectedMaterial.addAll(opp.Material__c.split(';'));
        if(opp.Category__c != null)
        selectedCategory.addAll(opp.Category__c.split(';'));
        
        
        Set<CategoryManagement__mdt> acclist = new Set<CategoryManagement__mdt>();
        Set<String> uniquecategory = new Set<string>();
        List<CategoryManagement__mdt> uniqueAcclist = new List<CategoryManagement__mdt>();
        CategoryManagement__mdt[] CategoryManagement = [SELECT MasterLabel,Category__c,Material__c,Ischecked__c FROM CategoryManagement__mdt];
        for(CategoryManagement__mdt objAccount : CategoryManagement){
           
            if(!uniquecategory.Contains(objAccount.Material__c) && selectedCategory.contains(objAccount.Category__c) ){
                MultiSelectControllerWrapper objMultiSelectControllerWrapper = new MultiSelectControllerWrapper(); 
                objMultiSelectControllerWrapper.objCategoryMangement = objAccount;
                objMultiSelectControllerWrapper.isSelected = false; 
                if(selectedMaterial.contains(objAccount.Material__c))
                {
                    objMultiSelectControllerWrapper.isSelected = true; 
                    uniquecategory.add(objAccount.Material__c);  
                }
                
                listMultiSelectControllerWrapper.add(objMultiSelectControllerWrapper);
                }

        }
        
        return listMultiSelectControllerWrapper;
    }
    
     @Auraenabled
    public static List<MultiSelectControllerWrapper> getContact( String material){
        List<MultiSelectControllerWrapper> listMultiSelectControllerWrapper = new List<MultiSelectControllerWrapper>();
        
        CategoryManagement__mdt[] CategoryManagement = [SELECT MasterLabel,Category__c,Material__c FROM CategoryManagement__mdt Where Category__c =:material];
        for(CategoryManagement__mdt objAccount : CategoryManagement){
            MultiSelectControllerWrapper objMultiSelectControllerWrapper = new MultiSelectControllerWrapper(); 
            objMultiSelectControllerWrapper.objCategoryMangement = objAccount;
            objMultiSelectControllerWrapper.isSelected = false; 
            listMultiSelectControllerWrapper.add(objMultiSelectControllerWrapper);
        }
        return listMultiSelectControllerWrapper;
    }
    
    @Auraenabled
    public static void saveMaterial( String materialString,String listCategory,String recordId){
        
        System.debug('materialString>>>>'+materialString);
        Opportunity opp = [SELECT ID,Material__c,Category__c from  Opportunity WHERE ID =: recordId];
        opp.Material__c  = materialString;
        opp.Category__c  = listCategory;
        Update opp;
    }

}