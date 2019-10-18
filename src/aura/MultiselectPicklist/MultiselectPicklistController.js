({
    doInit : function(cmp, event, helper) {
        helper.getAllCategory(cmp, event, helper); 
        helper.getAllMaterialchecked(cmp, event, helper);
        
    },
    onCheck : function(cmp, event, helper) {
        var whichOne = event.target.id;
        var whichOneelmentValue = event.target;
        var valuechck = whichOneelmentValue.checked;
        let listCategory = cmp.get("v.selectedCategoryList");
        var listCategoryArr = [];
        var action = cmp.get("c.getContact");
        
        action.setParams({
            material : whichOne
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var opts = [];
                var arr = response.getReturnValue();
                var acclist = cmp.get("v.Acclist2");
                //alert(acclist.length);
                if(valuechck == true){
                    listCategoryArr.push(whichOne);    
                    for (var i = 0 ; i < listCategory.length; i++) {
                        listCategoryArr.push(listCategory[i]);
                    }
                    for (var i = 0 ; i < acclist.length; i++) {
                        opts.push(acclist[i]);
                    }
                    for (var i = 0 ; i < arr.length; i++) {
                        opts.push(arr[i]);
                    }
                    cmp.set("v.Acclist2",opts);
                    console.log(">>>>",cmp.get("v.Acclist2"));
                }else{
                    for (var i = 0 ; i < listCategory.length; i++) {
                        if(whichOne != listCategory[i]){
                            listCategoryArr.push(listCategory[i]);   
                        }  
                    } 
                    let listMaterial = cmp.get("v.checkedList");
                    var listMaterialarr = [];
                    for (var i = 0 ; i < listMaterial.length; i++) {
                        if(containsval(arr, listMaterial[i]) == false){
                            listMaterialarr.push(listMaterial[i]);
                        }
                    }
                    function containsval(arr, value) {
                        var i = arr.length;
                        while (i--) { 
                            if (arr[i].objCategoryMangement.Material__c === value) return true;
                        }
                        return false;
                    }
                    
                    cmp.set("v.checkedList",listMaterialarr);
                    for (var i = 0 ; i < acclist.length; i++) {
                        if(contains(arr, acclist[i].objCategoryMangement.Material__c) == false){
                            opts.push(acclist[i]);
                        }
                    }
                    function contains(arr, value) {
                        var i = arr.length;
                        while (i--) { 
                            if (arr[i].objCategoryMangement.Material__c === value) return true;
                        }
                        return false;
                    }
                    cmp.set("v.Acclist2",opts);
                    
                }
                cmp.set("v.selectedCategoryList",listCategoryArr);
            }
            else if (state === "INCOMPLETE") {
                // do something
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
    onCheckMaterial : function(cmp, event, helper) {
        
        let whichOne = event.target.id;
        let whichOneelmentValue = event.target;
        let valuechck = whichOneelmentValue.checked;
        let listMaterial = cmp.get("v.checkedList");
        var opts = [];
        if(valuechck == true){
            opts.push(whichOne);    
            for (var i = 0 ; i < listMaterial.length; i++) {
                opts.push(listMaterial[i]);
            }
        }
        else{
            for (var i = 0 ; i < listMaterial.length; i++) {
                if(whichOne != listMaterial[i]){
                    opts.push(listMaterial[i]);   
                } 
                
            } 
        }
        cmp.set("v.checkedList",opts);
        
        
    },
    onsubmit : function(cmp, event, helper) {
        let listMaterial = cmp.get("v.checkedList");
        let listCategory = cmp.get("v.selectedCategoryList").join(";");
        var materialString = listMaterial.join(";");
        alert('Delimited listMaterial :- ' + materialString);
        alert('Delimited listCategory :- ' + listCategory);
        //alert('RecordIds :- ' + cmp.get("v.recordId"));
        console.log(">>>listMaterial>>>",listMaterial);   
        var action = cmp.get("c.saveMaterial");
        action.setParams({
            materialString : materialString,
            listCategory : listCategory,
            recordId : cmp.get("v.recordId")
            
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var dismissActionPanel = $A.get("e.force:closeQuickAction");
                dismissActionPanel.fire();
                $A.get('e.force:refreshView').fire();
                
            }
            else if (state === "INCOMPLETE") {
                // do something
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