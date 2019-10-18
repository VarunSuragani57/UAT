@isTest
public class MockHttpResponseGenerator implements HttpCalloutMock 
{    
    public static String jsonResponse;
    public HTTPResponse respond(HTTPRequest req) 
    {

        HttpResponse res = new HttpResponse();
        
        res.setHeader('Content-Type', 'application/xml');
        res.setBody(jsonResponse);
        res.setStatusCode(200);
        System.assertEquals('POST', req.getMethod());
      
        return res;
    }
}