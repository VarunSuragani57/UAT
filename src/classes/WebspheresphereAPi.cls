public class WebspheresphereAPi{
    
    @Auraenabled
    public static List<WebInner> FetchConsumerDetails() {
        
        string responseBody = [SELECT Id,MainData__c from WebSphere__mdt Where MasterLabel='Data' ].MainData__c;
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
        
        List<Object> listResults = (List<Object>)results.get('results');
        List<WebInner> listWebInner = new List<WebInner>();
        for(Object objResult : listResults ){
            Map<String, Object> mapWebInner = (Map<String, Object>)objResult ;
            
            WebInner objWebInner = new WebInner();
            objWebInner.orderNumber =  (Integer)mapWebInner.get('id');
            objWebInner.orderDate = (String)mapWebInner.get('full_name');
            objWebInner.DeliveryDate = (String)mapWebInner.get('email');
            objWebInner.type = (String)mapWebInner.get('phone');
            listWebInner.add(objWebInner);
        }
        system.debug('=======>>>>'+listWebInner); 
        return listWebInner;  
        
    }
    
    
    @Auraenabled
    public static webSpherMain SerchConsumerDetails() {
        
        string responseBody = [SELECT Id,MainData__c from WebSphere__mdt Where MasterLabel='Data1'].MainData__c;
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(responseBody);

        
        webSpherMain objwebSpherMain = new webSpherMain();
		objwebSpherMain.id =  (Integer)results.get('id');
		objwebSpherMain.full_name = (String)results.get('full_name');
		objwebSpherMain.email = (String)results.get('email');
		objwebSpherMain.phone = (String)results.get('phone');
		objwebSpherMain.lifetime_value = (Decimal)results.get('lifetime_value');		
		objwebSpherMain.num_recent_orders = (Integer)results.get('num_recent_orders');
		Map<String, Object> mapcrowdtwist_profile = (Map<String, Object>)results.get('crowdtwist_profile');
		objwebSpherMain.crowdtwist_profileId = (Integer)mapcrowdtwist_profile.get('id');
		//objwebSpherMain.crowdtwist_profilelast_login = '';
		//objwebSpherMain.crowdtwist_profilelast_update = '';
		objwebSpherMain.total_points =(Integer)mapcrowdtwist_profile.get('total_points');  
		List<Object> listResults = (List<Object>)results.get('transactions');  
		List<TransactionItemsInner> listWebSpherMain = new List<TransactionItemsInner>();  
        for(Object objResult : listResults ){
            Map<String, Object> mapTransactionItemsInner = (Map<String, Object>)objResult ;
            
            TransactionItemsInner objTransactionItemsInner = new TransactionItemsInner();
            objTransactionItemsInner.order_number =  (String)mapTransactionItemsInner.get('order_number');
            objTransactionItemsInner.create_time = (String)mapTransactionItemsInner.get('create_time');
            objTransactionItemsInner.expected_delivery_date = (String)mapTransactionItemsInner.get('expected_delivery_date');
            objTransactionItemsInner.source = (String)mapTransactionItemsInner.get('source');
            listWebSpherMain.add(objTransactionItemsInner);
        }
        objwebSpherMain.listTransactionItemInner = listWebSpherMain;
        System.debug('objwebSpherMain=='+objwebSpherMain);
        return objwebSpherMain;
    }
    public class WebSpherMain{
        @Auraenabled
        public Integer id;
        @Auraenabled
        public String full_name;
        @Auraenabled
        public String email;
        @Auraenabled
        public String phone;
        @Auraenabled
        public Decimal lifetime_value;
        @Auraenabled
        public Integer num_recent_orders;
        @Auraenabled
        public Integer crowdtwist_profileId;
        @Auraenabled
        public String crowdtwist_profilelast_login;
        @Auraenabled
        public String crowdtwist_profilelast_update;
        @Auraenabled
        public Integer total_points;
        @Auraenabled
    	public List<TransactionItemsInner> listTransactionItemInner;
        
    }
    public class TransactionItemsInner{
        @Auraenabled
        public String order_number;
        @Auraenabled
        public String create_time;
        @Auraenabled
        public String expected_delivery_date;
        @Auraenabled
        public String source;
    }
    
    
    public class WebInner{
        @Auraenabled
        public Integer orderNumber;
        @Auraenabled
        public String orderDate;
        @Auraenabled
        public String DeliveryDate;
        @Auraenabled
        public String type;
    }
    
}