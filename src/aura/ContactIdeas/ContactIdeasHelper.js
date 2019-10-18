({
	showModal : function(component, event, helper) {
    component.set("v.isOpen", true);
    },
    OpenPage : function(component, event, helper) {
        var recId = component.get("v.recId");
        window.open('/apex/IdeaPdfView?Id='+recId,'_blank' ); 
    },
    ShowFields : function(component, event, helper,Field1,Field2) {
        $A.util.removeClass(component.find(Field1), "slds-hide");
        $A.util.removeClass(component.find(Field2), "slds-hide");
        $A.util.addClass(component.find(Field1), "slds-show");
        $A.util.addClass(component.find(Field2), "slds-show");
    },
    HideFields : function(component, event, helper,Field1,Field2) {
        	$A.util.removeClass(component.find(Field1), "slds-show");
            $A.util.removeClass(component.find(Field2), "slds-show");
            $A.util.addClass(component.find(Field1), "slds-hide");
            $A.util.addClass(component.find(Field2), "slds-hide"); 
    },
   ShowFieldValidatation : function(cmp, event, helper) {
            $A.util.removeClass(cmp.find("messageComponent1"), 'slds-hide');
            $A.util.addClass(cmp.find("messageComponent1"), 'slds-show');
            cmp.set("v.messageType", 'Error');
            cmp.set("v.message", 'Please select all the mendatory fields!');
        }
    
})