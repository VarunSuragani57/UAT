({
	handleClick : function(component, event, helper) {
        var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
            "message" : "Sample3",
        "type" : "next"});
        appEvent.fire();
	},
    handleClickPrevious : function(component, event, helper) {
        var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
            "message" : "Sample3",
        "type" : "previous"});
        appEvent.fire();
	},
    
    loadOptions: function (component, event, helper) {
        var opts = [
            { value: "Product Idea", label: "Product Idea" },
            { value: "Packaging Idea", label: "Packaging Idea" },
            { value: "Marketing Advertisement Idea", label: "Marketing Advertisement Idea" },
            { value: "Other", label: "Other"}
         ];
         component.set("v.options", opts);
    
}


})