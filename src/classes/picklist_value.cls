/*
 * Copyright (c) 2009-2010 Akritiv Technologies, Inc.  All Rights Reserved.
 * This software is the confidential and proprietary information
 * (Confidential Information) of Akritiv Technologies, Inc.  You shall not
 * disclose or use Confidential Information without the express written
 * agreement of Akritiv Technologies, Inc.
 */
/*
 * Usage   :   class is used to provide "Take Payment" functionality.
 *             this class request UTA for the payment
 */
public with sharing class picklist_value{

   
   public List<Account> acc {get; set; }
   public String[] transactionIds {get; set; }
   public String TrxOrdertype  {get;set;}
   public String TrxOrderby {get;set;}
   public String transactionIdsKey{get;set;}
  
   public String accName {get;set;}
   public String accountId {get; set;}
   public String selectedTransactions {get; set; }
   public List<Selectoption> PaymentType{get;set;}
   public String selectedPaymentType{get;set;}
   
   public String ExpMM{get;set;}
   public String ExpYY{get;set;}
   public String CVV2{get;set;}
   public string Token{get;set;}
   public String CheckWirterLabel{get;set;}
  
   public List<Selectoption> EXPMonth{get;set;}
   public List<Selectoption> EXPYear{get;set;}
   public List<Selectoption> CheckIDType2{get;set;}
   public List<Selectoption> LicenseState1{get;set;}
   public String selectedCheckIDType{get;set;}
   public String selectedLicenseState{get;set;}
   public ID PaymentID1;
   
   /*public String Address{get;set;}
   public String City{get;set;}
   public String State{get;set;}
   public String ZipCode{get;set;}*/
   
   public String ABANumber{get;set;}
   public String CheckNo{get;set;}
   public String CheckCCType{get;set;}
   public String CheckIDType{get;set;}
   public String License{get;set;}
   public String LicenseState{get;set;}
   public String SecondaryId{get;set;}
   
   public boolean ShowCG{get;set;}
   public boolean ShowCC{get;set;}
   public boolean ShowACH{get;set;}
   public boolean ShowRDC{get;set;}
   public boolean ShowApproved{get;set;}
   
  
 
   public double PaymentAmount;
   
   public List<Selectoption> CheckCCType1{get;set;}
   public String trxId;
   
    
  // public Double Tax{get;set;}
  // public String Phone{get;set;}
   
   public String CheckWriterName{get;set;}
   public Account acc1{get;set;}
   public boolean showOK{get;set;}
   public boolean showMainScreen{get;set;}
   public String AccountNumber{get;set;}
   public String AccountNumberLabel{get;set;}
   public String CheckCCTypeLabel{get;set;}
   
   public picklist_value() {
       CheckWirterLabel = 'Check Writer Name';
       AccountNumberLabel = 'Account Number';
       CheckCCTypeLabel = 'Type Of Check';
      
       ShowCG = true;
       showOK = false;
       showMainScreen = true;
       ShowApproved = false;
       ShowCC = false;
       ShowACH = false;
       ShowRDC = false;
       PaymentType = new List<Selectoption>();
       CheckCCType1 = new List<Selectoption>();
       CheckIDType2 = new List<Selectoption>();
       LicenseState1 = new List<Selectoption>();
       EXPMonth = new List<Selectoption>();
       EXPYear = new List<Selectoption>();
       ExpMM = '';
       ExpYY = '';
       CVV2 = '';
       ABANumber = '';
       CheckNo = '';
       CheckCCType = '';
       CheckIDType = '';
       CheckWriterName = '';
       License = '';
       LicenseState = '';
       SecondaryId = ''; 
       AccountNumber = ''; 
       transactionIds = new List<String>();
       
       accountId = ApexPages.currentPage().getParameters().get('accId');
       
       trxId = ApexPages.currentPage().getParameters().get('txId');
       if(trxId != null && trxId != ''){
           transactionIds.add(trxId);
       }
       
       TrxOrdertype = ApexPages.currentPage().getParameters().get('ordertype');
       TrxOrdertype = (TrxOrdertype !=null ? String.escapeSingleQuotes(TrxOrdertype):null); 
       TrxOrderby = ApexPages.currentPage().getParameters().get('orderby');
       
       TrxOrderby = (TrxOrderby !=null ? String.escapeSingleQuotes(TrxOrderby):null);
       
       if(ApexPages.currentPage().getParameters().get('txIds') != null){
         transactionIdsKey = ApexPages.currentPage().getParameters().get('txIds').trim();
          transactionIdsKey = String.escapeSingleQuotes(transactionIdsKey);
           
          
        }
        
                
                
       
        
       
        
        CheckCCType1.add(new selectOption('B','Business'));
        CheckCCType1.add(new selectOption('P','Personal'));
        CheckCCType1.add(new selectOption('S','Saving'));
        PaymentType.add(new selectOption('ACH','Cheque'));
        PaymentType.add(new selectOption('CC','Credit/Debit Card'));
   //     PaymentType.add(new selectOption('ACH-G','Electronic Funds Transfer'));
   //     PaymentType.add(new selectOption('ACH-G','eloctronic funds transfer ACH with check Guarantee'));
    //    PaymentType.add(new selectOption('RDC-G','Remote Deposit Capture'));
   //     PaymentType.add(new selectOption('RDC-G','Remote Deposit Capture with check Guarantee'));
      //  PaymentType.add(new selectOption('ED','Edit'));
     //   PaymentType.add(new selectOption('DEL','Delete'));
          CheckIDType2.add(new selectOption('8','Passport'));
          CheckIDType2.add(new selectOption('9','Military ID'));
          CheckIDType2.add(new selectOption('10','Alabama DL'));
          CheckIDType2.add(new selectOption('11','Alaska DL'));
          CheckIDType2.add(new selectOption('12','Arizona DL'));
          CheckIDType2.add(new selectOption('13','Arkansas DL'));
          CheckIDType2.add(new selectOption('14','California DL'));
          CheckIDType2.add(new selectOption('15','Colorado DL'));
          CheckIDType2.add(new selectOption('16','Connecticut DL'));
          CheckIDType2.add(new selectOption('17','Delaware DL'));
          CheckIDType2.add(new selectOption('18','D.C. DL'));
          CheckIDType2.add(new selectOption('19','Florida DL'));
          CheckIDType2.add(new selectOption('20','Georgia DL'));
          CheckIDType2.add(new selectOption('21','Hawaii DL'));
          CheckIDType2.add(new selectOption('22','Idaho DL'));
          CheckIDType2.add(new selectOption('23','Illinois DL'));
          CheckIDType2.add(new selectOption('24','Indiana DL'));
          CheckIDType2.add(new selectOption('25','Iowa DL'));
          CheckIDType2.add(new selectOption('26','Kansas DL'));
          CheckIDType2.add(new selectOption('27','Kentucky DL'));
          CheckIDType2.add(new selectOption('28','Louisiana DL'));
          CheckIDType2.add(new selectOption('29','Maine DL'));
          CheckIDType2.add(new selectOption('30','Maryland DL'));
          CheckIDType2.add(new selectOption('31','Massachusetts DL'));
          CheckIDType2.add(new selectOption('32','Michigan DL'));
          CheckIDType2.add(new selectOption('33','Minnesota DL'));
          CheckIDType2.add(new selectOption('34','Mississippi DL'));
          CheckIDType2.add(new selectOption('35','Missouri DL'));
          CheckIDType2.add(new selectOption('36','Montana DL'));
          CheckIDType2.add(new selectOption('37','Nebraska DL'));
          CheckIDType2.add(new selectOption('38','Nevada DL'));
          CheckIDType2.add(new selectOption('39','New Hampshire DL'));
          CheckIDType2.add(new selectOption('40','New Jersey DL'));
          CheckIDType2.add(new selectOption('41','New Mexico DL'));
          CheckIDType2.add(new selectOption('42','New York DL'));
          CheckIDType2.add(new selectOption('43','North Carolina DL'));
          CheckIDType2.add(new selectOption('44','North Dakota DL'));
          CheckIDType2.add(new selectOption('45','Ohio DL'));
          CheckIDType2.add(new selectOption('46','Oklahoma DL'));
          CheckIDType2.add(new selectOption('47','Oregon DL'));
          CheckIDType2.add(new selectOption('48','Pennsylvania DL'));
          CheckIDType2.add(new selectOption('49','Rhode Island DL'));
          CheckIDType2.add(new selectOption('50','South Carolina DL'));
          CheckIDType2.add(new selectOption('51','South Dakota DL'));
          CheckIDType2.add(new selectOption('52','Tennessee DL'));
          CheckIDType2.add(new selectOption('53','Texas DL'));
          CheckIDType2.add(new selectOption('54','Utah DL'));
          CheckIDType2.add(new selectOption('55','Vermont DL'));
          CheckIDType2.add(new selectOption('56','Virginia DL'));
          CheckIDType2.add(new selectOption('57','Washington DL'));
          CheckIDType2.add(new selectOption('58','West Virginia DL'));
          CheckIDType2.add(new selectOption('59','Wisconsin DL'));
          CheckIDType2.add(new selectOption('60','Wyoming DL'));
          CheckIDType2.add(new selectOption('70','Canada DL'));
          CheckIDType2.add(new selectOption('80','AARP Card'));
          CheckIDType2.add(new selectOption('90','Company Check'));
          CheckIDType2.add(new selectOption('91','Check Reader / Virtual Terminal'));
          LicenseState1.add(new selectOption('AL','ALABAMA'));
        LicenseState1.add(new selectOption('AK','ALASKA'));
        LicenseState1.add(new selectOption('AS','AMERICAN SAMOA'));
        LicenseState1.add(new selectOption('AZ','ARIZONA'));
        LicenseState1.add(new selectOption('AR','ARKANSAS'));
        LicenseState1.add(new selectOption('CA','CALIFORNIA'));
        LicenseState1.add(new selectOption('CO','COLORADO'));
        LicenseState1.add(new selectOption('CT','CONNECTICUT'));
        LicenseState1.add(new selectOption('DE','DELAWARE'));
        LicenseState1.add(new selectOption('DC','DISTRICT OF COLUMBIA'));
        LicenseState1.add(new selectOption('FM','FEDERATED STATES OF MICRONESIA'));
        LicenseState1.add(new selectOption('FL','FLORIDA'));
        LicenseState1.add(new selectOption('GA','GEORGIA'));
        LicenseState1.add(new selectOption('GU','GUAM'));
        LicenseState1.add(new selectOption('HI','HAWAII'));
        LicenseState1.add(new selectOption('ID','IDAHO'));
        LicenseState1.add(new selectOption('IL','ILLINOIS'));
        LicenseState1.add(new selectOption('IN','INDIANA'));
        LicenseState1.add(new selectOption('IA','IOWA'));
        LicenseState1.add(new selectOption('KS','KANSAS'));
        LicenseState1.add(new selectOption('KY','KENTUCKY'));
        LicenseState1.add(new selectOption('LA','LOUISIANA'));
        LicenseState1.add(new selectOption('ME','MAINE'));
        LicenseState1.add(new selectOption('MH','MARSHALL ISLANDS'));
        LicenseState1.add(new selectOption('MD','MARYLAND'));
        LicenseState1.add(new selectOption('MA','MASSACHUSETTS'));
        LicenseState1.add(new selectOption('MI','MICHIGAN'));
        LicenseState1.add(new selectOption('MN','MINNESOTA'));
        LicenseState1.add(new selectOption('MS','MISSISSIPPI'));
        LicenseState1.add(new selectOption('MO','MISSOURI'));
        LicenseState1.add(new selectOption('MT','MONTANA'));
        LicenseState1.add(new selectOption('NE','NEBRASKA'));
        LicenseState1.add(new selectOption('NV','NEVADA'));
        LicenseState1.add(new selectOption('NH','NEW HAMPSHIRE'));
        LicenseState1.add(new selectOption('NJ','NEW JERSEY'));
        LicenseState1.add(new selectOption('NM','NEW MEXICO'));
        LicenseState1.add(new selectOption('NY','NEW YORK'));
        LicenseState1.add(new selectOption('NC','NORTH CAROLINA'));
        LicenseState1.add(new selectOption('ND','NORTH DAKOTA'));
        LicenseState1.add(new selectOption('MP','NORTHERN MARIANA ISLANDS'));
        LicenseState1.add(new selectOption('OH','OHIO'));
        LicenseState1.add(new selectOption('OK','OKLAHOMA'));
        LicenseState1.add(new selectOption('OR','OREGON'));
        LicenseState1.add(new selectOption('PW','PALAU'));
        LicenseState1.add(new selectOption('PA','PENNSYLVANIA'));
        LicenseState1.add(new selectOption('PR','PUERTO RICO'));
        LicenseState1.add(new selectOption('RI','RHODE ISLAND'));
        LicenseState1.add(new selectOption('SC','SOUTH CAROLINA'));
        LicenseState1.add(new selectOption('SD','SOUTH DAKOTA'));
        LicenseState1.add(new selectOption('TN','TENNESSEE'));
        LicenseState1.add(new selectOption('TX','TEXAS'));
        LicenseState1.add(new selectOption('UT','UTAH'));
        LicenseState1.add(new selectOption('VT','VERMONT'));
        LicenseState1.add(new selectOption('VI','VIRGIN ISLANDS'));
        LicenseState1.add(new selectOption('VA','VIRGINIA'));
        LicenseState1.add(new selectOption('WA','WASHINGTON'));
        LicenseState1.add(new selectOption('WV','WEST VIRGINIA'));
        LicenseState1.add(new selectOption('WI','WISCONSIN'));
        LicenseState1.add(new selectOption('WY','WYOMING'));
        LicenseState1.add(new selectOption('AE','Armed Forces Africa'));
        LicenseState1.add(new selectOption('AA','Armed Forces Americas'));
        LicenseState1.add(new selectOption('AE','Armed Forces Canada'));
        LicenseState1.add(new selectOption('AE','Armed Forces Europe'));
        LicenseState1.add(new selectOption('AE','Armed Forces Middle East'));
        LicenseState1.add(new selectOption('AP','Armed Forces Pacific'));
        
        for(Integer i = 1; i<=12; i ++){
        String s ; 
         if(i < 10)
            s = '0' + i;
         else
             s = '' + i;
        Integer j = 11 + i;
        EXPMonth.add(new selectOption(s,s));
        s = j + '';
        EXPYear.add(new selectOption(s,s));
        }
  }
   
   public pagereference changePaymentType1(){
   
    
      if(selectedPaymentType == 'CC'){
          CheckCCType1.clear();
          CheckCCType1.add(new selectOption('VISA','VISA'));
          CheckCCType1.add(new selectOption('Master Card','Master Card'));
          CheckCCType1.add(new selectOption('AMEX','AMEX'));
          CheckCCType1.add(new selectOption('Discover','Discover'));
          ShowCC = true;
          ShowCG = false;
          ShowACH = false;
          ShowRDC = false;
          CheckWirterLabel = 'Card Holder Name';
          AccountNumberLabel = 'Card #';
          CheckCCTypeLabel = 'Type Of Card';
      }
      else if(selectedPaymentType == 'ACH'){
          CheckCCType1.clear();
          CheckCCType1.add(new selectOption('B','Business'));
          CheckCCType1.add(new selectOption('P','Personal'));
          CheckCCType1.add(new selectOption('S','Saving'));
          ShowCG = true;
          ShowCC = false;
          ShowACH = false;
          ShowRDC = false;
          CheckWirterLabel = 'Check Writer Name';
          AccountNumberLabel = 'Account Number';
          CheckCCTypeLabel = 'Type Of Check';
      }
      else if(selectedPaymentType == 'ACH-G'){
          CheckCCType1.clear();
          CheckCCType1.add(new selectOption('B','Business'));
          CheckCCType1.add(new selectOption('P','Personal'));
          CheckCCType1.add(new selectOption('S','Saving'));
          ShowACH = true;
          ShowCG = false;
          ShowCC = false;         
          ShowRDC = false;
          CheckWirterLabel = 'Check Writer Name';
          AccountNumberLabel = 'Account Number';
          CheckCCTypeLabel = 'Type Of Check';
      }
       else if(selectedPaymentType == 'RDC-G'){
          CheckCCType1.clear();
          CheckCCType1.add(new selectOption('B','Business'));
          CheckCCType1.add(new selectOption('P','Personal'));
          CheckCCType1.add(new selectOption('S','Saving'));
          ShowRDC = true;
          ShowCG = false;
          ShowCC = false;
          ShowACH = false;
          CheckWirterLabel = 'Check Writer Name';
          AccountNumberLabel = 'Account Number';
          CheckCCType = 'Type Of Check';
      }else{
          ShowCC= false; 
          ShowCG = false;
       }
          
          return null;
   }
   
    
   
    public PageReference execute(){
        
      return goBackToSourcePage();
      // return null;    
    }
    
 public void save(){
   
           showMainScreen = false;
           showOK = true;
 }
    
  public Pagereference goBackToSourcePage() {
       
          return new Pagereference('/'+accountId);
  }
    
  public Pagereference goBackToPayment() {
       
          return new Pagereference('/'+PaymentID1);
  }
  
  public Pagereference sendEmail() {
       
         
                                 
          return new Pagereference('/'+accountId);
   }
    
    
     public Pagereference Cancel() {
     
               ExpMM = '';
               ExpYY = '';
               CVV2 = '';
               ABANumber = '';
               CheckNo = '';
               CheckCCType = '';
               CheckIDType = '';
               CheckWriterName = '';
               License = '';
               LicenseState = '';
               SecondaryId = ''; 
               AccountNumber = ''; 
             
               ShowMainScreen = true;
               ShowOK = false;
               return null;
          
    }
    
       public Pagereference goBack() {
               ShowMainScreen = true;
               ShowOK = false;
               return null;
       
       }

}