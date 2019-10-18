({
	handleClickNext : function(component, event, helper) {
        var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
            "message" : "Sample1",
        "type" : "next"});
        appEvent.fire();
	},
    handleClickPrevious : function(component, event, helper) {
        
        var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
        "message" : "",
        "type" : ""});
        appEvent.fire();
        
	}
})