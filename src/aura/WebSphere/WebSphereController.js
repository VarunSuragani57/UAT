({
	onLoad : function(component, event, helper) {
        var action = component.get('c.SerchConsumerDetails'); 
        /*
        action.setParams({
            "entityType" : component.get('v.componentString') 
        });*/
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.listInner', a.getReturnValue());
                console.log(JSON.stringify(a.getReturnValue()));
            }
        });
        $A.enqueueAction(action);
    },
    handleKeyUp: function (cmp, evt) {
        var isEnterKey = evt.keyCode === 13;
        var queryTerm = cmp.find('enter-search').get('v.value');
        if (isEnterKey) {
            cmp.set('v.issearching', true);
            setTimeout(function() {
                alert('Searched for "' + queryTerm + '"!');
                cmp.set('v.issearching', false);
            }, 2000);
        }
    }
	
})