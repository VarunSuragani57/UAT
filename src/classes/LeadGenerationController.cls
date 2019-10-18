public class LeadGenerationController{
    public Lead newLead{get;set;}
    // Instance fields
    public String searchTerm {get; set;}
    public String selectedMovie {get; set;}
    
    public LeadGenerationController(){
        newLead = new Lead();
         ProdcentercodeList=new List<String>();
    }
    
    public static List<String> ProdcentercodeList{get;set;}
    @RemoteAction
    public static String[] getproductioncentercode(String value){
        try{
            ProdcentercodeList=new List<String>();
            if(String.isNotBlank(value)){
                value= '%'+value+'%';
                List<User> prod=[Select Id,Name from User where UserName LIKE:value];
                for(User l: prod){
                    ProdcentercodeList.add(l.Name);
                }
            }
            return ProdcentercodeList;
        }catch(Exception e){
            System.debug('Message:='+e.getMessage()+'**Line Number='+e.getLineNumber());
        }
        return null;
    }
    
    public static User serchUser(String searchTerm) {
        
        User userRecord = [Select Id,name from User Where Name=:searchTerm limit 1];
        return userRecord;
    }
    
    public void createLead(){
       try{
           User userRecord = serchUser(searchTerm);
           newLead.OWnerId = userRecord.Id; 
           Insert newLead;
           newLead = new Lead();
           
       }
       Catch(Exception ex){
          Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.warning,ex.getMessage()));  
       }
           
    }
}