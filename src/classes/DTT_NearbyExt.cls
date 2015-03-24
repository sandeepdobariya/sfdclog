global with sharing class  DTT_NearbyExt {
    
    // Properties
    public boolean legendPopup {get; set;}
    
    public void closePopup() {
       legendPopup = false;
    }
 
    public void showPopup() {
       legendPopup = true;
    }



    /*
     * Constructor
     */

    public DTT_NearbyExt(ApexPages.StandardController controller) { }


    @RemoteAction
    global static List<sobject> getNearby(String lat, String lon)
    {
        list<sobject> retVal = new list<sobject>();
        retVal.addAll(getNearbyAccounts(Lat, Lon));
        retVal.addAll(getNearbyLeads(Lat, Lon));
        return retVal;
    }
    
    
    // Find warehouses nearest a geolocation
    @RemoteAction
    global static List<SObject> getNearbyAccounts(String lat, String lon) {

        // If geolocation isn't set, use San Francisco
        if(lat == null || lon == null || lat.equals('') || lon.equals('')) {
            lat = '35.120163';
            lon = '-80.909236';
        }

        // SOQL query to get the nearest warehouses
        integer radius = integer.valueof('Near By Readius');
        String queryString =
            'SELECT Id, RecordType.Name, Total_Sales_Last_12_Months__c, Name, Phone, BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet, ShippingCity,ShippingCountry,ShippingPostalCode,ShippingState,ShippingStreet, Location__Longitude__s, Location__Latitude__s, Ship_To__c ' 
                + 'FROM Account ' +
            'WHERE DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') < '  + radius +
            ' ORDER BY DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') '; // +
            //'LIMIT 100';

        system.debug(queryString);
        // Run and return the query results
        return(database.Query(queryString));
    }

    // Find warehouses nearest a geolocation
    @RemoteAction
    global static List<Sobject> getNearbyLeads(String lat, String lon) {

        // If geolocation isn't set, use San Francisco
        if(lat == null || lon == null || lat.equals('') || lon.equals('')) {
            //306 Forsyth Hall Dr
            //Charlotte, NC 28273, USA
            //35.120163, -80.909236
            lat = '35.120163';
            lon = '-80.909236';
        }

        // SOQL query to get the nearest warehouses
        integer radius = integer.valueof('Near By Readius');
        String queryString =
            'SELECT Id,Company,  Name, FirstName, Phone, City,Country,PostalCode,State,Street,Longitude__c,Latitude__c ' 
                + 'FROM Lead ' +
            'WHERE (Owner.LastName = \'Camoplast Solideal\' or OwnerID = ' + '\'' + UserInfo.getUserId() + '\'' +  
            ' ) and DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') < ' + radius + 
            ' ORDER BY DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') ' ; //+
            //'LIMIT 100';

        system.debug(queryString);
        // Run and return the query results
        return(database.Query(queryString));
    }
}