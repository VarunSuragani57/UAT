({
    loadOptions: function(component, event, helper) {
        $A.util.addClass(component.find("OtherCategory"), "slds-hide");
        $A.util.addClass(component.find("OtherCategory1"), "slds-hide");
        $A.util.addClass(component.find("productIdea"), "slds-hide");
        $A.util.addClass(component.find("productIdea1"), "slds-hide");
        var opts = [{
                value: "Packaging Idea",
                label: "Packaging Idea"
            },
            {
                value: "Product Idea",
                label: "Product Idea"
            },
            {
                value: "Marketing Advertisement Idea",
                label: "Marketing Advertisement Idea"
            },
            {
                value: "Other",
                label: "Other"
            }
        ];
        component.set("v.options", opts);
        var opts1 = [{
                value: "No",
                label: "No"
            },
            {
                value: "Yes",
                label: "Yes"
            },
            {
                value: "Not Sure",
                label: "Not Sure"
            }
        ];
        component.set("v.options1", opts1);

        component.set("v.options2", opts1);

        var opts2 = [{
                value: "No",
                label: "No"
            },
            {
                value: "Yes",
                label: "Yes"
            },
        ];
        component.set("v.options3", opts2);
        console.log("=========", component.get("v.options"));

        var self = this; // safe reference

        // Create an action to invoke the Apex controller method
        // which will return a new Contact record
        var initAction = component.get("c.newIdeasThatWork");
        initAction.setCallback(self, function(a) {
            component.set("v.IdeaThatWork", a.getReturnValue());
        });

        // Enqueue the action
        $A.enqueueAction(initAction);

    },
    SubmitIdea: function(cmp, event, helper) {
        var isError = "Success";
        var recId = cmp.get("v.recId");
        var action = cmp.get("c.createIdea");
           
        if (recId != '' && typeof(recId) != "undefined") {  
           //alert("Record Exists");
           action.setParams({
           "jsonString": JSON.stringify(cmp.get("v.IdeaThatWork")),
            "Id": recId,
            "DML": "Update"
            });
        }else{
           //alert("Record Not Exits");
           action.setParams({
           "jsonString": JSON.stringify(cmp.get("v.IdeaThatWork")),
            "Id": "",
            "DML": "Insert"
            });                      
        }
        //alert(JSON.stringify(cmp.get( "v.IdeaThatWork" )));
        var obj = JSON.parse(JSON.stringify(cmp.get("v.IdeaThatWork")));
        for (var prop in obj) {
        var emailField ;             
        emailField = obj["Email__c"];   
       // alert(emailField);
        if(validateEmail(emailField)  == true ||  typeof emailField != "undefined" || emailField == ""){
            
            if (typeof obj["Idea_Title_13__c"] == "undefined" || obj["Idea_Title_13__c"] == ""){
                helper.ShowFieldValidatation(cmp, event, helper);
                isError = 'Error';
                
            }
            if (typeof obj["Tell_us_about_your_idea_14__c"] == "undefined" || obj["Tell_us_about_your_idea_14__c"] == ""){
                helper.ShowFieldValidatation(cmp, event, helper);
                 isError = 'Error';
                
            }
            if (typeof obj["Interested_in_your_idea_or_purchasing_15__c"] == "undefined" || obj["Interested_in_your_idea_or_purchasing_15__c"] == ""){
                helper.ShowFieldValidatation(cmp, event, helper);
                 isError = 'Error';
            }
            if (typeof obj["Any_professional_or_personal_abt_idea_25__c"] == "undefined"  || obj["Any_professional_or_personal_abt_idea_25__c"] == ""){
                helper.ShowFieldValidatation(cmp, event, helper);
                 isError = 'Error';
            }
            if (typeof obj["Tell_us_a_little_bit_more_about_yourself__c"] == "undefined"  || obj["Tell_us_a_little_bit_more_about_yourself__c"] == ""){
                helper.ShowFieldValidatation(cmp, event, helper);
                 isError = 'Error';
            }
            
            
            
            if ((obj["Idea_Category__c"] == "Please Select" || obj["Idea_Category__c"] == "") ||
                (obj["Idea_Category__c"] == "Product Idea" && typeof obj["Kind_of_Product_Idea__c"] == "undefined" ) ||
               (obj["Idea_Category__c"] == "Other" && typeof obj["Idea_Category_Others_11__c"] == "undefined" )) {
                helper.ShowFieldValidatation(cmp, event, helper);
                isError = 'Error';
            }
        
            if ((obj["Carhartt_currently_offering_your_idea__c"] == "Please Select" || obj["Carhartt_currently_offering_your_idea__c"] == "") ||
                (obj["Carhartt_currently_offering_your_idea__c"] == "Yes" && typeof obj["Explain_Carhartt_offers_to_idea_19__c"] == "undefined" )) {
               helper.ShowFieldValidatation(cmp, event, helper);
                 isError = 'Error';
            }
            if ((obj["Are_there_other_brands_currently_20__c"] == "Please Select" || obj["Are_there_other_brands_currently_20__c"] == "") ||
                (obj["Are_there_other_brands_currently_20__c"] == "Yes" && typeof obj["what_other_brands_similar_to_idea_21__c"] == "undefined")) {
                helper.ShowFieldValidatation(cmp, event, helper);
                 isError = 'Error';
            }
            if ((obj["Information_regarding_copyrights_22__c"] == "Please Select" || obj["Information_regarding_copyrights_22__c"] == "") ||
                (obj["Information_regarding_copyrights_22__c"] == "Yes" && typeof obj["Information_regarding_copyrights_Text_23__c"] == "undefined")) {
                helper.ShowFieldValidatation(cmp, event, helper);
                 isError = 'Error';
            }

        }
        }
        function validateEmail(emailField){
              	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    			//alert(emailField);
                if (reg.test(emailField) == false && typeof emailField != "undefined" && emailField != "") 
                {
                    $A.util.removeClass(cmp.find("messageComponent1"), 'slds-hide');
                    $A.util.addClass(cmp.find("messageComponent1"), 'slds-show');
                    cmp.set("v.messageType", 'Error');
                    cmp.set("v.message", 'Please give correct email address formate');
                    isError = 'Error';                
                    return false;
                }
             	return true;
         }  
       //alert(isError);  
        if (isError != "Error") {
            $A.util.removeClass(cmp.find("messageComponent1"), 'slds-show');
            $A.util.addClass(cmp.find("messageComponent1"), 'slds-hide');
            cmp.set("v.messageType", '');
            cmp.set("v.message", '');
            isError = '';
            action.setCallback(this, function(response) {
                var state = response.getState();

                
                if (state === "SUCCESS") {
					//alert("Record Created Succesfully.");	
                    helper.showModal(cmp, event, helper);
                    var data = JSON.parse(JSON.stringify(response.getReturnValue()));
                    console.log("====data-====" + JSON.stringify(response.getReturnValue()));
                    cmp.set("v.IdeaNumber", data.Name);
                    cmp.set("v.recId", data.Id);
                    var attachmentsEvent = $A.get("e.c:SaveAttachments");
                    attachmentsEvent.setParams({
                        "ParentId": data.Id
                    });
                    attachmentsEvent.fire();
                } else if (state === "INCOMPLETE") {
                    // do something
                } else if (state === "ERROR") {
                    var errors = response.getError();
                   // alert("Sorry for the error . Please reload the page and submit your idea (if you have bigger idea, better upload a document)");
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
        }
        
    },
    handleClickPrevious: function(component, event, helper) {
        $A.util.removeClass(component.find("messageComponent"), 'slds-show');
        $A.util.addClass(component.find("messageComponent"), 'slds-hide');
        var appEvent = $A.get("e.c:SampleEvent");
        appEvent.setParams({
            "message": "Sample3",
            "type": "previous"
        });
        appEvent.fire();

    },
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    },
    handleBindAttachment: function(component, event) {
        var message = event.getParam("message");
        var rowindex = parseInt(event.getParam("index"));
        console.log("### in handler : msg :" + JSON.stringify(message));
        console.log("### in handler : rowindex :" + rowindex);
        // var rows=component.get("v.LineItems");
        // var targetRow = rows[rowindex];
        //targetRow.attachments = message;
        //component.set("v.LineItems",rows);
        //console.log(component.get("v.LineItems"));
    },
    handleRadioClick: function(component, event, helper) {
        var getWhichBtn = event.getSource().getLocalId();
        //alert(getWhichBtn);
        if(getWhichBtn == "r0"){
         component.set(("v.IdeaThatWork.Kind_of_Product_Idea__c"),"New product or product improvement idea");   
        }
        if(getWhichBtn == "r1"){
          component.set(("v.IdeaThatWork.Kind_of_Product_Idea__c"),"Request to bring back a discontinued product");  
        }
        if(getWhichBtn == "r2"){
          component.set(("v.IdeaThatWork.Kind_of_Product_Idea__c"),"Request for additional sizes on a current product");  
        }

        
    },
    OnChangeCategory: function(component, event, helper) {
        var selectedCategory = component.get("v.IdeaThatWork.Idea_Category__c");
        //alert(selectedCategory);
        var Field1 = "friendFamilyFieldId";
        var Field2 = "friendFamilyFieldId1";
        if (selectedCategory == 'Other') {
            helper.HideFields(component, event, helper, Field1, Field2);
            $A.util.removeClass(component.find("OtherCategory"), "slds-hide");
            $A.util.removeClass(component.find("OtherCategory1"), "slds-hide");
            $A.util.addClass(component.find("OtherCategory"), "slds-show");
            $A.util.addClass(component.find("OtherCategory1"), "slds-show");

            $A.util.removeClass(component.find("productIdea"), "slds-show");
            $A.util.removeClass(component.find("productIdea1"), "slds-show");
            $A.util.addClass(component.find("productIdea"), "slds-hide");
            $A.util.addClass(component.find("productIdea1"), "slds-hide");

        } else if (selectedCategory == 'Product Idea') {
			helper.ShowFields(component, event, helper, Field1, Field2);
            $A.util.removeClass(component.find("productIdea"), "slds-hide");
            $A.util.addClass(component.find("productIdea"), "slds-show");
            $A.util.removeClass(component.find("productIdea1"), "slds-hide");
            $A.util.addClass(component.find("productIdea1"), "slds-show");
            $A.util.removeClass(component.find("OtherCategory"), "slds-show");
            $A.util.removeClass(component.find("OtherCategory1"), "slds-show");
            $A.util.addClass(component.find("OtherCategory"), "slds-hide");
            $A.util.addClass(component.find("OtherCategory1"), "slds-hide");

        } else {
            helper.HideFields(component, event, helper, Field1, Field2);
            $A.util.removeClass(component.find("OtherCategory"), "slds-show");
            $A.util.removeClass(component.find("OtherCategory1"), "slds-show");
            $A.util.addClass(component.find("OtherCategory"), "slds-hide");
            $A.util.addClass(component.find("OtherCategory1"), "slds-hide");
            $A.util.removeClass(component.find("productIdea"), "slds-show");
            $A.util.removeClass(component.find("productIdea1"), "slds-show");
            $A.util.addClass(component.find("productIdea"), "slds-hide");
            $A.util.addClass(component.find("productIdea1"), "slds-hide");
        }
    },
    OnChangeCopyRights: function(component, event, helper) {
        var selectedCategory = component.get("v.IdeaThatWork.Information_regarding_copyrights_22__c");
        var Field1 = "copyRightsId";
        var Field2 = "copyRightsId1";
        if (selectedCategory == 'Yes') {
            helper.ShowFields(component, event, helper, Field1, Field2);
        } else {
            helper.HideFields(component, event, helper, Field1, Field2);
        }

        //alert(selectedCategory);
    },
    OnChangebrand: function(component, event, helper) {
        var selectedCategory = component.get("v.IdeaThatWork.Are_there_other_brands_currently_20__c");
        var Field1 = "brandsId";
        var Field2 = "brandsId1";
        if (selectedCategory == 'Yes') {
            helper.ShowFields(component, event, helper, Field1, Field2);
        } else {
            helper.HideFields(component, event, helper, Field1, Field2);
        }
        //alert(selectedCategory);
    },
    OnChangeoffers: function(component, event, helper) {
        var selectedCategory = component.get("v.IdeaThatWork.Carhartt_currently_offering_your_idea__c");
        //alert(selectedCategory);
        var Field1 = "offersId";
        var Field2 = "offersId1";
        if (selectedCategory == 'Yes') {
            helper.ShowFields(component, event, helper, Field1, Field2);
        } else {
            helper.HideFields(component, event, helper, Field1, Field2);
        }
    },
    gotoURL: function(component, event, helper) {
        var recId = component.get("v.recId");
        if (recId != '' && typeof(recId) != "undefined") {
            $A.util.removeClass(component.find("messageComponent"), 'slds-show');
            $A.util.addClass(component.find("messageComponent"), 'slds-hide');
            helper.OpenPage(component, event, helper);
        }

        /*var compEvt = $A.get("e.c:IdeaToWorkEventForVF");        
        // set the Selected sObject Record to the event attribute.  
        compEvt.setParams({"IdeaThatWorkEventValue" : component.get( "v.IdeaThatWork" )});  
        // fire the event  
        compEvt.fire(); 
        */

    },
    ClosePopUp: function(component, event, helper) {
        var recId = component.get("v.recId");
        if (recId != '' && typeof(recId) != "undefined") {
            component.set("v.isOpen", false);
            //$A.util.removeClass(component.find("messageComponent"), 'slds-show');
            //$A.util.addClass(component.find("messageComponent"), 'slds-hide');
           
        }


    }
})