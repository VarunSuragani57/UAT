public class UploadImgController {
    @AuraEnabled
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        System.debug('Saving the attachment');
         System.debug('base64Data ' +base64Data.trim());
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Attachment a = new Attachment();
        a.parentId = parentId;
        a.Body = EncodingUtil.base64Decode(base64Data);
        a.Name = fileName;
        a.ContentType = contentType;
        insert a;
        System.debug(' attachment id '+a.id);
        return a.Id;
    } 
     @AuraEnabled
    public static Id saveTheChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) { 
        System.debug('parentId '+parentId);
        System.debug('fileName '+fileName);
        System.debug('base64Data '+base64Data);
        System.debug('attachemnt Id '+fileId);
        if (String.isNotBlank(fileId) && String.isNotEmpty(fileId) ) {
           appendToFile(fileId, base64Data);
        } else {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType);
        }
        System.debug('file saved '+fileId);
        return Id.valueOf(fileId);
    } 
    
     private static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        System.debug('Updaing the file '+fileId);
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id = :fileId
        ];
        
        String existingBody = EncodingUtil.base64Encode(a.Body);
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data); 
        
        update a;
    } 
}