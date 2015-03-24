public class collectionsobject{
     public static testmethod void main(){
          student__c s1= new student__c();
            s1.name='karthik';
            
            s1.email_id__c='karthik13@yahoo.com';
         list<student__c> stdnt = new list<student__c>();
               stdnt.add(s1);
                system.debug('hiiiiii');
         for(student__c s : stdnt){
             system.debug('hiiiiii');
             System.debug('The name = '+s.name);
             system.debug('emailid='+s.email_id__c);
         
         }  
             
     }// End of Testmethod
}// End of class