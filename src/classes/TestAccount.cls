Public Class TestAccount {
    Public static TestMethod void main(){
        Savings ICICI = new Savings();
        
        ICICI.SetValue(101,'Sandeep',20000);
        //ICICI.GetBalance();
        ICICI.Deposite(10000);
        ICICI.Withdraw(1000);
        
        Account ICIC = new Savings();
        ICIC.GetBalance();
        //ICIC.Deposite(10000);
        
    }
}