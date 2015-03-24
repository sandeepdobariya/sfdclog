public class sample_Controller {
public string requiredFieldName{get;set;} 
    public void save(){
        if ( requiredFieldName == null || requiredFieldName == '' ){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter a value in the Required Field box in order to save this record.'));
        }
    }
}