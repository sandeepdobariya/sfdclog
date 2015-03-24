Public class Savings extends Account {
       
       Public override void Withdraw(Integer amt){
           
           if((a_balance - amt) < 0){
                       System.debug(' You Can not Withdraw Amount');
                       System.debug(' The Available Balance is ==>'+ a_balance);
                         
           }
           else{
                   a_balance -= amt;
                   System.debug('Your Avail Balance ==>'+a_balance);
           }
       }   
       
       Public override void Deposite(Integer amt){
        System.debug('Ur Avail Balance is ==>'+a_balance);
        a_balance += amt;
        System.debug('Ur Deposite Amount ==>'+amt);
        System.debug('Ur Available Balance is ==>'+a_balance);
      }
      
}