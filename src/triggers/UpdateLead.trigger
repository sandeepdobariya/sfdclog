trigger UpdateLead on Lead (before update,before insert) {
    if(Trigger.IsBefore){
        if(Trigger.IsInsert || Trigger.IsUpdate){
             for(Lead  Le : Trigger.New){
                 Le.Company = 'ABC';
                 Le.lastname = Userinfo.getname();
             }
        }
    }    
}