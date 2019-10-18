({
	itemSelected : function(component, event, helper) {
		helper.itemSelected(component, event, helper);
        //alert('Test');
	}, 
    serverCall :  function(component, event, helper) {
		helper.serverCall(component, event, helper);
         //alert('Test1');
	},
    clearSelection : function(component, event, helper){
        helper.clearSelection(component, event, helper);
         alert('Test2');
    } 
})