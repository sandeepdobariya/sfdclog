public with sharing class ConditionalOverrideController {
    
    public ConditionalOverrideController(ApexPages.StandardController sc){
        
    }
    
    Public pagereference doOveride(){
        String RecId = ApexPages.currentPage().getParameters().get('id');
        
        if(!String.isBlank(RecId)){
            
            //retrieve account information
            Account a = [SELECT Id, Name FROM Account WHERE Id=:RecId];
            
            //if account name contains 'green' then redirect to default account page layout
            if(!String.isBlank(a.Name) && !a.Name.containsIgnoreCase('green')){
                
                return new PageReference('/'+RecId+'?nooverride=1');
            
            }
            
        }
        
        return null;
        return null;
    }
}