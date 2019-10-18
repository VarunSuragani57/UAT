@isTest(SeeAllData=true)
public class UploadOpportunityScheduleLineItemTests{

      static testmethod void testLoadData() {
            StaticResource testdoc = [Select Id,Body,Name from StaticResource where name ='testMethodCSVUpload1'];
            UploadOpportunityScheduleLineItem testUpload = new UploadOpportunityScheduleLineItem();
            testUpload.contentFile= testdoc.Body;
            testUpload.nameFile= 'test.csv';
            testUpload.ReadFile();
            testUpload.insertfile();
          }


}