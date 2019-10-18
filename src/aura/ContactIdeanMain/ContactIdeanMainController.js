({
    handleApplicationEvent : function(Component, event) {
        var message = event.getParam("message");
        var type = event.getParam("type");
       if(type != '' && message != ''){   
        if(type == 'next' ){
        //alert(message);
         //alert(type);
            var cmpTarget1;
            var cmpTarget = Component.find(message);
            if(message == 'Sample1'){
               cmpTarget1 = Component.find('Sample2'); 
            }else if(message == 'Sample2'){
               cmpTarget1 = Component.find('Sample3'); 
            }
           
            $A.util.removeClass(cmpTarget, 'slds-show');
            $A.util.addClass(cmpTarget, 'slds-hide');
            $A.util.removeClass(cmpTarget1, 'slds-hide');
            $A.util.addClass(cmpTarget1, 'slds-show');
        }else{
         
            var cmpTarget1;
            var cmpTarget = Component.find(message);
            if(message == 'Sample4'){
               cmpTarget1 = Component.find('Sample3'); 
            }else if(message == 'Sample3'){
               cmpTarget1 = Component.find('Sample2'); 
            }
            else if(message == 'Sample2'){
               cmpTarget1 = Component.find('Sample1'); 
            }
            
            $A.util.removeClass(cmpTarget, 'slds-show');
            $A.util.addClass(cmpTarget, 'slds-hide');
            $A.util.removeClass(cmpTarget1, 'slds-hide'); 
            $A.util.addClass(cmpTarget1, 'slds-show');   
        }
       }
    }

})