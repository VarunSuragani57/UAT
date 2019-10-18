({
    loadOptions: function (cmp, event, helper) {
        $A.util.addClass(cmp.find("Sample2"), 'slds-hide');
        $A.util.addClass(cmp.find("Sample3"), 'slds-hide');
        $A.util.addClass(cmp.find("Sample4"), 'slds-hide');
    },
    handleApplicationEvent : function(cmp, event) {
        var message = event.getParam("message");
        var type = event.getParam("type");
         //alert(message);
        // alert(type);
        if(type == 'next'){
        
            var cmpTarget1;
            var cmpTarget = cmp.find(message);
            if(message == 'Sample1'){
               cmpTarget1 = cmp.find('Sample2'); 
            }else if(message == 'Sample2'){
               cmpTarget1 = cmp.find('Sample3'); 
            }
            else if(message == 'Sample3'){
               cmpTarget1 = cmp.find('Sample4'); 
            }
            $A.util.removeClass(cmpTarget, 'slds-show');
            $A.util.addClass(cmpTarget, 'slds-hide');
            $A.util.addClass(cmpTarget1, 'slds-show');
        }else{
         
            var cmpTarget1;
            var cmpTarget = cmp.find(message);
            if(message == 'Sample4'){
               cmpTarget1 = cmp.find('Sample3'); 
            }else if(message == 'Sample3'){
               cmpTarget1 = cmp.find('Sample2'); 
            }
            else if(message == 'Sample2'){
               cmpTarget1 = cmp.find('Sample1'); 
            }
            
            $A.util.removeClass(cmpTarget, 'slds-show');
            $A.util.addClass(cmpTarget, 'slds-hide');
            $A.util.addClass(cmpTarget1, 'slds-show');   
        }
    }

})