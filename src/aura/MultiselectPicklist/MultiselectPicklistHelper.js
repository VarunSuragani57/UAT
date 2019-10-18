({
	getAllCategory : function(cmp, event, helper) {
		var action = cmp.get("c.getAccountName");
        action.setParams({
            recordId : cmp.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
             
                cmp.set("v.Catlist",response.getReturnValue());
                var listCategory = cmp.get("v.Catlist");
                var listCategoryArr = [];
                for (var i = 0 ; i < listCategory.length; i++) {
                    if(listCategory[i].isSelected == true)
                        listCategoryArr.push(listCategory[i].objCategoryMangement.Category__c);
                }
                
                cmp.set("v.selectedCategoryList",listCategoryArr);
                console.log(">>>>",cmp.get("v.Catlist"));
            }
            else if (state === "INCOMPLETE") {
              
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
	},
    getAllMaterialchecked : function(cmp, event, helper) {
		var action = cmp.get("c.getMaterialOnload");
         action.setParams({
            recordId : cmp.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
             
                cmp.set("v.Acclist2",response.getReturnValue());
                var listmaterialArr = [];
                var listmaterial = cmp.get("v.Acclist2");
                for (var i = 0 ; i < listmaterial.length; i++) {
                    if(listmaterial[i].isSelected == true)
                        listmaterialArr.push(listmaterial[i].objCategoryMangement.Material__c);
                }
                
                cmp.set("v.checkedList",listmaterialArr);
                console.log(">>>>",cmp.get("v.Acclist2"));
            }
            else if (state === "INCOMPLETE") {
              
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
	}
     
})