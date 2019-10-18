({
	doInIt : function(Component, event, helper) {
        var action = Component.get("c.getStatements");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
                //alert("From server: " + response.getReturnValue());
				Component.set("v.listOfStatement",response.getReturnValue());
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
    handleClickNext : function(Component, event, helper) {
       var count = 0;
        const cmps = Component.find("boxPack");
        if ($A.util.isArray(cmps)) {
            cmps.forEach(Component => {
                // do stuff...
                console.log("====",Component.get("v.value"));
                if(Component.get("v.value") == true){
                count++;
            	}
                
            })
            }
		
        if(count == '11'){
            $A.util.removeClass(Component.find("messageComponent"), 'slds-show');
            $A.util.addClass(Component.find("messageComponent"), 'slds-hide');
            var appEvent = $A.get("e.c:SampleEvent");
            appEvent.setParams({
                "message" : "Sample2",
                "type" : "next"});
            appEvent.fire();    
        }else{
           $A.util.removeClass(Component.find("messageComponent"), 'slds-hide');
           $A.util.addClass(Component.find("messageComponent"), 'slds-show');
           Component.set("v.messageType", 'error' );
		   Component.set("v.message", 'Please select all the term and conditions' );
           
        }
       
	},
    handleClickPrevious : function(Component, event, helper) {
        $A.util.removeClass(Component.find("messageComponent"), 'slds-show');
        $A.util.addClass(Component.find("messageComponent"), 'slds-hide');
        var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
        "message" : "Sample2",
        "type" : "previous"});
        appEvent.fire();
        
	}
})