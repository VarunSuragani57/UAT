public class JsonToApex2{

        public list<tranItems> tranItems{get;set;}
        public String totalAmount{get;set;}
        public String totalTaxValue{get;set;}
        public String totalVAT{get;set;}
        public String discountTotal{get;set;}
        public String promoTotal{get;set;}
        public String merchTotal{get;set;}
        public Integer tranNo{get;set;}
        public String barcode{get;set;}
        public String customerWorkPhoneNumber{get;set;}
        public String tranTypeId{get;set;}
        public String customerHomePhoneNumber{get;set;}
        public String tranDate{get;set;}
        public String customerMobilePhoneNumber{get;set;}
        public String localTranDate{get;set;}
        public String customerEmail{get;set;}
        public String localTimeZone{get;set;}
        public String customerZipCode{get;set;}
        public Integer totalItems{get;set;}
        public String customerState{get;set;}
        public Integer totalRefundItems{get;set;}
        public String customerCity{get;set;}
        public String currencyId{get;set;}
        public String customerAddress2{get;set;}
        public String customerAddress1{get;set;}
        public String customerLastName{get;set;}
        public payments payments{get;set;}
        public String customerFirstName{get;set;}
        public list<transactionDiscounts> transactionDiscounts{get;set;}
        public String taxExemptInfo{get;set;}
        public list<String> transactionPromos{get;set;}
        public String loyaltyPoints{get;set;}
        public String storeName{get;set;}
        public String loyaltyId{get;set;}
        public String streetName{get;set;}
        public String userLastName{get;set;}
        public String streetNumber{get;set;}
        public String userFirstName{get;set;}
        public String storeCity{get;set;}
        public String userName{get;set;}
        public String storeZipCode{get;set;}
        public String userId{get;set;}
        public String storeCountry{get;set;}
        public String salespersonName{get;set;}
        public String storePhoneNumber{get;set;}
        public String salespersonId{get;set;}
        public String storeFaxNumber{get;set;}
        public String storeId{get;set;}
        public String storeTimeZone{get;set;}
        public String tillId{get;set;}
        public String nonLoyaltyEmail{get;set;}
        public String deviceId{get;set;}
    public class transactionDiscounts{
        public String reasonCodeDesc{get;set;}
        public String discValue{get;set;}
        public String discountAmountTotal{get;set;}
        public String discType{get;set;}
    }
    public class tranItems{
        public String totalValue{get;set;}
        public String discValue{get;set;}
        public String discountPercentage{get;set;}
        public String amount{get;set;}
        public Integer refItemIdx{get;set;}
        public Integer qty{get;set;}
        public String discType{get;set;}
        public String description{get;set;}
        public list<String> basketSavings{get;set;}
        public String barcode{get;set;}
        public list<String> promoSavings{get;set;}
        public String sku{get;set;}
        public list<promotions> promotions{get;set;}
        public String productType{get;set;}
    }
    public class promotions{
        public String amount{get;set;}
        public String promoId{get;set;}
        public String privateName{get;set;}
        public String promoType{get;set;}
        public String description{get;set;}
        public String amountValue{get;set;}
        public String name{get;set;}
    }
    public class payments{
        public list<debit> debit{get;set;}
        public list<String> businessCheck{get;set;}
        public list<String> callforAuthorization{get;set;}
        public list<String> travelersCheck{get;set;}
        public list<giftCard> giftCard{get;set;}
        public list<String> personalCheck{get;set;}
        public list<String> manualCardEntry{get;set;}
        public list<cash> cash{get;set;}
        public list<String> offlineCardPayment{get;set;}
        public String change{get;set;}
    }
    public class giftCard{
        public String amount{get;set;}
        public String type{get;set;}
    }
    public class debit{
        public String amount{get;set;}
        public String merchantID{get;set;}
        public String eftTransactionTimestamp{get;set;}
        public String terminalID{get;set;}
        public String tenderType{get;set;}
        public String transactionID{get;set;}
        public String maskedCardNumber{get;set;}
        public String cardDescription{get;set;}
        public String tenderMarker{get;set;}
        public String totalAmountTransacted{get;set;}
        public String authToken{get;set;}
        public String amountApproved{get;set;}
        public String name{get;set;}
        public String cardEntryMode{get;set;}
        public String itemNum{get;set;}
        public String expiratyDate{get;set;}
        public String type{get;set;}
    }
    public class cash{
        public String amount{get;set;}
        public String type{get;set;}
    }
    
    public static JsonToApex2 parse(String json){
        return (JsonToApex2) System.JSON.deserialize(json, JsonToApex2.class);
    }
    
}