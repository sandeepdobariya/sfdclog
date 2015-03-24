global class Batchprocess implements Database.Batchable<sobject>{
    String tet = 'er';
    global database.querylocator<sobject> start(Database.BatchableContext bc){
        String squery = 'select id,name from student__c ';
        return Database.getquerylocator(squery);
    } 
    
    global void execute(Database.BatchableContext bc, LIST<Student__c> l1){
        
        for(Student__c s1 : l1)
        {
            if(s1.name == 'lali')
            {
                s1.name = 'ashish';
            }   
        }
        update l1;
    }
    
    global void finish(Database.BatchableContext bc) {
    /// Just commentng line
    }
}