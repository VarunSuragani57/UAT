({
	handleClick : function(component, event, helper) {
       /* var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
            "message" : "Sample4",
        "type" : "next"});
        appEvent.fire();
        */
	},
    handleClickPrevious : function(component, event, helper) {
        var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
            "message" : "Sample4",
        "type" : "previous"});
        appEvent.fire();
	}
})