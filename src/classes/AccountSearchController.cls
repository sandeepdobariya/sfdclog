public class AccountSearchController {
    public String selectedAccName {set;get;}
    public String selectedZip {set;get;}
    public String qry {set;get;}
    public List<innerCls> lstAcc {set;get;}
    static Integer globalCounter;
   
    public AccountSearchController (){
        lstAcc = new List<innerCls>();
        globalCounter = 0;
        searchAcc();
    }
    public void searchAcc(){
        globalCounter = 1;
        lstAcc = new List<innerCls>();
        String qry = ' SELECT Id,Name,BillingStreet, BillingState,Longitude__c,Latitude__c, BillingPostalCode, ' ;
        qry += ' BillingCountry, BillingCity From Account where BillingStreet != null';
                            
        if(selectedAccName != NULL && selectedAccName != ''){
                 qry += ' AND Name like \''+ selectedAccName + '%\'';
          }
          if(selectedZip != NULL && selectedZip != ''){
                qry += ' AND BillingPostalCode like \''+ selectedZip + '%\'';
          }
          qry += ' LIMIT 1000 ';
          for(Account acc:Database.query(qry))
                lstAcc.add(new innerCls(acc));
                
          system.debug('--lstAcc---'+lstAcc);
    }
    
    public Pagereference getPDF(){
      //  PageReference pr = Page.TestGoogleMap;
       // Blob content = pr.getContentAsPDF();
        //PageReference pageRef = new PageReference('http://s1.cdn.memeburn.com/wp-content/uploads/google_logo.jpg');
        PageReference pageRef = Page.TestPage;
        Blob content = pageRef.getContent();
        system.debug('--content--'+content);
        Attachment att = new Attachment();
        att.Body = content;
        att.Name = 'test.jpg';
       // att.FileName = 'test.png';
        att.ParentId = '0019000000q3R1f';
        insert att;
        return null;
    }
    
    public class innerCls{
        public Integer count{set;get;}
        public Account acc {set;get;}
        public innerCls(Account acc){
                this.count = globalCounter++;
                this.acc = acc;
        }
    }
}