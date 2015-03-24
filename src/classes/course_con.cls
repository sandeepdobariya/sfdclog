public class course_con {

    course__c c;
    list<course__c> c1;
    Public course_con(){
        c = new course__c();
        c1 = new list<course__c>();        
        
      
        c1 = [select name,duration__c,fees__c from course__c];
        insert c1;
    }
    
    Public void Setname(String n){
        c.name = n;
    }
    public String Getname(){
        return c.name;
    }
    
    Public void Setduration(Decimal dur){
        c.duration__c = dur;
    }
    public decimal Getduration(){
        return c.duration__c;
    }
    
    Public void Setfees(Decimal dur){
        c.fees__c = dur;
    }
    public decimal Getfees(){
        return c.fees__c;
    }
      
    public PageReference save(){
          PageReference rf = new PageReference('https://ap1.salesforce.com/a0F/o');
          c.name = getname();
          c.duration__c = getduration();
          c.fees__c = getfees();
          
          insert c;
          return rf;
    }
    
    public list<course__c> getlist1(){
        return c1;
    }
    
    
    
    
}