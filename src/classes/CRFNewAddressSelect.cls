public with sharing class CRFNewAddressSelect {

private Student__c AD;
    public CRFNewAddressSelect(ApexPages.StandardController stdcontroller) {
    this.AD=(Student__c)stdController.getRecord();
    }

Boolean disp=False;


Public Boolean getdisp(){
return disp;
}
    
String Values;

public String getValues() {
            return Values;
        }
            
        public void setValues(String Values) {
            this.Values= Values;
            if(Values!=null)
            disp=True;
        }
public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('None','None'));
            options.add(new SelectOption('CA','Cease Address'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));
            return options;
        }

}