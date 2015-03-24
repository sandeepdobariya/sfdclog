Public class Db_Student {
    Public Static Testmethod void main(){
        
        course__c c1 = new course__c();
        c1.name = 'Java';
        c1.duration__c = 2;
        c1.fees__c = 20000;
        
        List<course__c> cs_list = new List<course__c>();
    
        insert c1;
        
        cs_list = [select name from course__c ];
        
        for(course__c cr : cs_list){
            System.debug('The Course Name is == >'+cr.name);
            //System.debug('The duration Name is == >'+cr.duraton__c);
            //System.debug('The Fees Name is == >'+cr.fees__c);
        }// End of For loop
    }//End of Test Method
}// End of Test class