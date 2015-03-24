global class OnsiteCheckinClass{

    
    public OnsiteCheckinClass(ApexPages.StandardController c){}
    public OnsiteCheckinClass(ApexPages.StandardSetController c){}
    
        
    @RemoteAction
    // Find events nearest a geolocation
    global static List<VolunteerEvent__c> getNearby(String lat, String lon) {
        // If geolocation isn't set, use San Francisco
        //if(lat == null || lon == null || lat.equals('') || lon.equals('')) {
            lat = '40.966667';
            lon = '-5.500000';
        //}

        // SOQL query to get the nearest warehouses
        String queryString =
            'SELECT Id, Name, Description__c, Needs__c, ' +
                'Address__c, City__c, Event_Date__c, State__c ' +
            'FROM VolunteerEvent__c ' +
            'WHERE DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') < 30 ' +
            'ORDER BY DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') ' +
            'LIMIT 10';

        // Run and return the query results
      //  system.debug('==>'+GEOLOCATION('13.081603999999999','80.2751828'));
        system.debug('----->'+queryString );
        return(database.Query(queryString)); 
    }

    @RemoteAction
    global static Volunteer__c CreateVolunteerRec(Integer hours, String mobile, String confNum, String eventId){
        Volunteer__c volunteer = new Volunteer__c();
        volunteer.Total_Hours__c = hours;
        volunteer.VolunteerEvent__c = eventId;
        volunteer.User__c = UserInfo.getUserId();
        volunteer.Confirmation_Number__c = confNum;
        volunteer.Mobile__c = mobile;
        volunteer.Check_In_Time__c = datetime.now();
        insert volunteer;
        
        return volunteer;
    }
    
    @RemoteAction
    public static Id makeContentPublic(String contentVersionId) {
        ContentVersion cv = [SELECT ContentDocumentId 
                             FROM ContentVersion 
                             WHERE Id = :contentVersionId];
        ContentDocumentLink cdl = new ContentDocumentLink(
            ContentDocumentId = cv.ContentDocumentId, 
            LinkedEntityId = UserInfo.getOrganizationId(), 
            ShareType = 'V');
        insert cdl;
        
        return cv.ContentDocumentId;
    }
   
}