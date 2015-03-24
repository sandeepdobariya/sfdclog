public class actionfunctioncontroller{

    public PageReference invoicetypeChaged() {
        return null;
    }


    public Id selectbill{get;set;}
    public List<Selectoption> Bill{get;set;}
    public List<Bill__c> billlist;
    
    public actionfunctioncontroller(){
    
        Bill = new List<Selectoption>();
        
        billlist = [select id, name from Bill__c limit 999];
        
        for(Bill__c bil : billlist){
        
                Bill.add(new selectOption(bil.Id,bil.Name));
        }
        
    
    }
    
    public pagereference next(){
    
        
         return new Pagereference('https://c.na9.visual.force.com');
        }
    


}