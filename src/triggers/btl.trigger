trigger btl on Student__c (before insert) {
    list<student__c> sl= trigger.new;
    
    for(student__c s : sl){
        if(s.Experience__c == 2){
            //s.adderror('Experience cant be 2 Year...!!!');
            circle.areaofcircle();
        }
    }// End of For loop
}