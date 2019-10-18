({
	getPicklistVal : function(component) {
        var opts = [];
        opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
        },{
                 class: "optionClass",
                        label: "11111",
            value: "11111"});
        component.find("couponTypeId").set("v.options", opts);
    }
})