public class MyController {
    list<Bill__c> account1 = new list<Bill__c>();

    
    public PageReference save() {
    try{
        update account1;
    }
    catch(DmlException ex){
        ApexPages.addMessages(ex);
    }
    return null;
    }

    public String getName() { 
        return 'MyController';
    }

    public Bill__c getAccount() {
        if(account1 == null)
        account1 = [select id, Amount_Paid__c,Discount__c from Bill__c
        where id = :ApexPages.currentPage().getParameters().get('id')];
        return null;

    }
}