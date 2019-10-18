public class IdeasThatWorkPageController {
    public static String ideaThatWork{get;set;}
    public Ideas_That_Work__c IdeaThatWorkRecord{get;set;}
    public boolean showcheckbox{get;set;}
    public IdeasThatWorkPageController(){
    try{
      showcheckbox= true;
      Id recordId = apexpages.currentpage().getparameters().get('id');
      IdeaThatWorkRecord = new Ideas_That_Work__c();
      
      IdeaThatWorkRecord = [SELECT Any_professional_or_personal_abt_idea_25__c,Kind_of_Product_Idea__c ,TermCondition__c,Are_there_other_brands_currently_20__c,Carhartt_currently_offering_your_idea__c,
                                                       City__c,Carhartt_make_something_similar__c,CreatedById,CreatedDate,Do_you_have_any_information_regarding_co__c,Email__c,
                                                       Explain_Carhartt_offers_to_idea_19__c,First_Name__c,Id,Idea_Category_Others_11__c,Idea_Category__c,
                                                       Idea_Title_13__c,Information_regarding_copyrights_22__c,Information_regarding_copyrights_Text_23__c,
                                                       Interested_in_your_idea_or_purchasing_15__c,Last_Name__c,Name,OwnerId,Phone_Number__c,
                                                       Product_Idea_Ans_12__c,State__c,Street_Address__c,SystemModstamp,Tell_us_about_your_idea_14__c,
                                                       Tell_us_a_little_bit_more_about_yourself__c,what_other_brands_similar_to_idea_21__c,ZipCode__c FROM Ideas_That_Work__c
                                                       Where Id=:recordId ];
                                                       
     }
     catch(Exception ex){
     }
        
    }
}