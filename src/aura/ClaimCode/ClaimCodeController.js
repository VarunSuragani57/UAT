({
    doInit : function(component, event, helper) {
        var today = new Date();
        component.set('v.today', today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate());
        helper.getPicklistVal(component, event, helper);
    },
    
    setOutput : function(component, event, helper) {
    	var cmpMsg = component.find("msg");
    	$A.util.removeClass(cmpMsg, 'hide');
    	
        var todayVal = component.find("today").get("v.value");
        var oDateTime = component.find("oDateTime");
        oDateTime.set("v.value", todayVal);
      
    },
    getCouponCode: function(component, event, helper) {
        console.log("====",JSON.stringify(component.get("v.selItem")));
        var userInfo = component.get("v.selItem");
        console.log(userInfo.val);
        var action = component.get("c.getCouponCodeVal");
        action.setParams({
            userId : userInfo.val,
            couponType : component.find("couponTypeId").get("v.value")
        });
        action.setCallback(this, function(response) {
           alert(response.getReturnValue()) ;
            component.set("v.CustomerPromoCodes.Display_PromoCode__c", response.getReturnValue());
            component.set("v.CustomerPromoCodes.PromoCode_Issue__c", response.getReturnValue());

        })
        $A.enqueueAction(action);
    },
     createCoupon : function(component, event, helper) {
         console.log('====='+JSON.stringify(component.get("v.CustomerPromoCodes")));
        var userInfo = component.get("v.selItem");
        console.log(userInfo.val);
        var action = component.get("c.createCouponCode");
        action.setParams({
            userId : userInfo.val,
            objVal : JSON.stringify(component.get("v.CustomerPromoCodes"))
        });
        action.setCallback(this, function(response) {
           alert(response.getReturnValue()) ;
            
        })
        $A.enqueueAction(action);
     }
})