public with sharing class UploadOpportunityScheduleLineItem
{
    
    
    // Global variables
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    //List<Schedule__c> lstScheduleToUpdate = new List<Schedule__c>();
    //public Schedule__C objSchedule{get;set;}
    //String array for taking csv data by line.
    String[] filelines = new String[]{};
    //string array for taking csv columns.
    String[] fileColumns = new String[]{};
    
    //set for storing all id's from csv.
    set<String> opptoupload{get;set;}
    //map for storing data from csv.
    public map<String,String> mapOppIDMonthYearToAccAmount{get;set;}
    public map<Integer, List<String>> mapUnmatchedSchedules{get;set;}  
    Private map<String,String> mapUserNameToUserId ;
       
       //Main constructor
    public UploadOpportunityScheduleLineItem()
    {
        //Initalizing required objects.
        //objSchedule = new Schedule__c();
        mapUserNameToUserId  = new map<String,String>();
        opptoupload = new set<String>();
        List<User> userlist = [SELECT Id,Name from User Where isActive=:true];
        for(User objUser : userlist){
            if(!mapUserNameToUserId.containsKey(objUser.Name))
                mapUserNameToUserId.put(objUser.Name,objUser.Id);
        }
        mapOppIDMonthYearToAccAmount = new map<String,String>();
        mapUnmatchedSchedules  = new map<integer, List<String>>();
    }
    Public string selectedname{get;set;}
    Public List<Selectoption> getselectedCaseRecordtyps(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            for(RecordType objRecordType :[SELECT id,name from Recordtype Where SobjectType  =: 'Lead']){
                lstnamesel.add(new selectoption(objRecordType.id,objRecordType.name));
            }
            return lstnamesel; 
    }
        
        
    //Method to read file content and check extension and file format.
    public Pagereference ReadFile()
    {
        try{
        //If without selecting csv file you clicked on upload it will give error message.
        if(nameFile == null)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'You should select csv file to upload');
            ApexPages.addMessage(errormsg);
            return null;
        }
        //Taking file extension.
        String extension = nameFile.substring(nameFile.lastIndexOf('.')+1);
        //Checking if file extension is .csv.
        if(extension == 'csv' ||extension == 'CSV')
        {
            nameFile=contentFile.toString();
            //Spliting by new line
            filelines = nameFile.split('\n');
            //Spliting values by (,) for checking coloumn size
            fileColumns = filelines[0].trim().split(',');
            //If column size is 5 then only it will proceed.
            if(fileColumns.size() <= 32)
            {
                for (Integer i=1;i<filelines.size();i++)
                {
                    List<String> inputvalues = new List<String>();
                    inputvalues = filelines[i].split(',');
                    System.debug('=====>>>>>>>>>>'+inputvalues.size());
                       //opptoupload.add(inputvalues[0]);  
                    //mapOppIDMonthYearToAccAmount.put(inputvalues[0]+inputvalues[1]+inputvalues[2]+inputvalues[3],inputvalues[4]);
                    mapUnmatchedSchedules.put(i-1,inputvalues);
                    //lstScheduleToUpdate = new List<Schedule__c>();
                }
                System.debug('====='+filelines[6].split(','));
                System.debug('====='+filelines[7].split(','));
                System.debug('====='+filelines[8].split(','));
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.info,'File uploaded successfully');
                ApexPages.addMessage(errormsg);
               
                return null;
            }
            else
            {
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'There should be 5 columns in csv file');
                ApexPages.addMessage(errormsg);
                return null;
            }
            //return null;
        }
        //If file is not csv type then it will give error message.
        else
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'File type should be csv type');
            ApexPages.addMessage(errormsg);
            return null;
        }
        }
         catch(Exception ex)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,ex.getMessage()+'There is an issue with file.Please check with Adminstrator!');
            ApexPages.addMessage(errormsg);
            return null;
        }
    }
    
    
    public void insertfile(){
       try{
        List<Lead> listLead = new List<Lead>();
        if(mapUnmatchedSchedules.size() > 0 ){
            for(Integer objKey : mapUnmatchedSchedules.Keyset()){
                
                integer i = 0;
                System.debug(mapUnmatchedSchedules);
                List<String> listValues =  mapUnmatchedSchedules.get(0);
                System.debug(listValues);
                
                Lead objLead = new Lead();
                objLead.RecordtypeId = selectedname;
                if(mapUserNameToUserId.containsKey(listValues[0]))
                objLead.OwnerId = mapUserNameToUserId.get(listValues[0]);
                objLead.LastName = listValues[1];
                objLead.firstName = listValues[2];
                objLead.SALUTATION = listValues[3];
                objLead.TITLE= listValues[4];
                objLead.COMPANY= listValues[5];
                objLead.STREET = listValues[6].trim();
                objLead.CITY = listValues[7].trim();
                objLead.State= listValues[8].trim();
                objLead.POSTALCODE = listValues[9];
                objLead.COUNTRY = listValues[10];
                objLead.STATECODE = listValues[11];
                objLead.COUNTRYCode = listValues[12];
                //if(listValues[12] != null)
                //objLead.LATITUDE = Decimal.valueOf(listValues[12]);
                //if(listValues[13]!= null)
                //objLead.LONGITUDE = Decimal.valueOf(listValues[13]);
                objLead.GEOCODEACCURACY = listValues[15];
                objLead.Phone = listValues[16];
                objLead.FAX = listValues[17];
                objLead.EMAIL = listValues[18];
                objLead.WEBSITE = listValues[19];
                objLead.DESCRIPTION = listValues[20];
                objLead.LEADSOURCE = listValues[21];
                objLead.STATUS= listValues[22];
                objLead.INDUSTRY= listValues[22];
                objLead.RATING= listValues[24];
                if(listValues[24] !=Null)
                    objLead.ANNUALREVENUE= Decimal.valueOf(listValues[25]);
                if(listValues[24] !=null)    
                objLead.NUMBEROFEMPLOYEES= Integer.valueOF(listValues[26]);
                
                listLead.add(objLead);
                i++;
                
            }
        }
        if(listLead.size()>0){
                Insert listLead;
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Created Successfully.Thank you!');
                ApexPages.addMessage(errormsg);
            }
            }
             catch(Exception ex)
            {
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,ex.getMessage()+'   There is an issue with file.Please check with Adminstrator!');
                ApexPages.addMessage(errormsg);
            }
    }
}