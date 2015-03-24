public class customerPortalCls{
  

public Account acc{get;set;}
public Contact c{get;set;}
public User u{get;set;}
public User newUser {get;set;}
public String selectedProfileId {get;set;}
public Boolean isDisabled {get;set;}
public Boolean isNewUserFound {get;set;}
public Boolean clickedButton {get;set;}

       

    public customerPortalCls(){

         //  acc = new Account();

            c = new Contact();

            u = new User();

            newUser= new User();

            isDisabled=false;  

            System.debug('inside constructor');

            isNewUserFound=false;

            clickedButton = false;

        }

         

       public PageReference checkForNewUser(){

        try{

            System.debug('isNewUserFound: ' + isNewUserFound);

          if(isNewUserFound==true)

            return null;

           

          System.debug('checking for new user with username:' + u.username);

          User usr = [select id, name, username from User where username= :u.username LIMIT 1];

          if(usr!=null && usr.username == u.username){

             newUser = usr;

             isNewUserFound = true;

             System.debug('great news - found user with userId: ' + newUser.id);

             System.debug('isNewUserFound: ' + isNewUserFound);

          }

          return null;

        }catch(Exception ex){

            System.debug('...didnt find user yet...');

            return null;

        }

       }   

        

       //Controller method invoked from the VF page button

       public PageReference createPortaluser(){

        try{

            clickedButton = true;

            //Create the Account

            Id accountId = createAccount();

            System.debug('successfully created account');

             

            //Create the Contact associated to the previously created Contact

            Id contactId = createContact(accountId);

             

            
            if(selectedProfileId == null || u.username==null){

                if(selectedProfileId==null){

                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Profile is required: Please select a profile to associate new user');

                    ApexPages.addMessage(myMsg);

                }

                if(u.username==null){

                   ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Username is required: Please a username for the new user');

                   ApexPages.addMessage(myMsg);

                }

                return null;

            }

             

            //Create the User

           

            customerPortalCls.createUser((String)contactId, c.Email, c.FirstName,c.lastname,u.Username,selectedProfileId);

             

            //Display success message to VF page

            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'Successfully created Portal Contact & User records.');

            ApexPages.addMessage(myMsg);

             isDisabled=true;

            return null;

        }catch(Exception ex){

            //Display error message to VF page

            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage());

            ApexPages.addMessage(myMsg);

            return null;

        }

       }

        

    //Method to create the Account

    public Id createAccount(){

        // insert a;

       //  System.debug('successfully created test account with Id:' + a.id);

        // return a.id;
        return null;

    }

     

    //Method to create the Contact

    public Id createContact(Id acctId){

        c.accountid=acctId;

        insert c;

        System.debug('successfully created test contact with Id:' + c.id);

        return c.id;

    }

     

    
    
    @future static void createUser(String contactId, String email, String firstName, String lastName, String userName, String profileId) {

        Database.DMLOptions dmo = new Database.DMLOptions();

        dmo.EmailHeader.triggerUserEmail = true;

        User u = new User(alias = 'standt', email=email,emailencodingkey='UTF-8', lastname=lastname, languagelocalekey='en_US',localesidkey='en_US', profileid = profileId, contactId=contactId,timezonesidkey='America/Los_Angeles', username=username);

         

        u.setOptions(dmo);

        insert u;

    }

 

    public List<SelectOption> getCustomerPortalProfiles() {

        //Execute query to get all profiles associated to Customer Portal

        Profile[] profiles = [Select p.name, p.id From Profile p where p.UserLicense.Name like '%Customer Portal%'];

        List<SelectOption> options = new List<SelectOption>();

        for(Profile p: profiles)

              options.add(new SelectOption(p.id,p.name));

        return options;

    }

     

    public PageReference reset(){

        PageReference newpage = new PageReference('/apex/createPortaluser');

        newpage.getParameters().clear();

        newpage.setRedirect(true);

        return newpage;

    }

     

    /* REQUIRED TEST METHODS */

 /*   static testMethod void createCustomerPortalUserTest() {

        customerPortalCls cpTest = new customerPortalCls();

        List<SelectOption> profileOptions = cpTest.getCustomerPortalProfiles();

        cpTest.a= new Account(name='TestMethod Account Name');

        cpTest.c = new Contact(firstName='TestFirstName', lastName='TestLastName', email='test@testorg.com');

        cpTest.u = new User(username='testusername@abc.com');

        Profile[] profiles = [Select p.name, p.id From Profile p where p.UserLicense.Name like '%Customer Portal%'];

        cpTest.selectedProfileId = profiles[0].id;

         

        Test.startTest();

            cpTest.checkForNewUser();

            PageReference testPageRef= cpTest.createPortaluser();

             

        Test.stopTest();

        PageReference testPageRef2 = cpTest.reset();

        cpTest.checkForNewUser();

         

    }

     

    static testMethod void createCustomerPortalUserTestProfileIdError() {

        Boolean errorFound = false;

        customerPortalCls cpTest = new customerPortalCls();

        cpTest.a= new Account(name='TestMethod Account Name');

        cpTest.c = new Contact(firstName='TestFirstName', lastName='TestLastName', email='test@testorg.com');

        cpTest.u = new User(username='testusername@abc.com');

        Profile[] profiles = [Select p.name, p.id From Profile p where p.UserLicense.Name like '%Customer Portal%'];

        cpTest.selectedProfileId = null;

         

        Test.startTest();

            PageReference testPageRef= cpTest.createPortaluser();

        Test.stopTest();

         

        ApexPages.Message[] mssgs = ApexPages.getMessages();

        for(ApexPages.Message m : mssgs){

           if(m.getDetail()=='Profile is required: Please select a profile to associate new user')

              errorFound=true;

        }

        System.assert(errorFound==true);

    }

     

     static testMethod void createCustomerPortalUserTestNullUsernameError() {

        Boolean errorFound = false;

        customerPortalCls cpTest = new customerPortalCls();

        cpTest.a= new Account(name='TestMethod Account Name');

        cpTest.c = new Contact(firstName='TestFirstName', lastName='TestLastName', email='test@testorg.com');

        cpTest.u = new User();

        Profile[] profiles = [Select p.name, p.id From Profile p where p.UserLicense.Name like '%Customer Portal%'];

        cpTest.selectedProfileId = profiles[0].id;

         

        Test.startTest();

             

            PageReference testPageRef= cpTest.createPortaluser();

                 

        Test.stopTest();

        ApexPages.Message[] mssgs = ApexPages.getMessages();

        for(ApexPages.Message m : mssgs){

           if(m.getDetail()=='Username is required: Please a username for the new user')

              errorFound=true;

        }

        System.assert(errorFound==true);

    }

     

     static testMethod void createCustomerPortalUserRequiredFieldErrors() {

        Boolean errorFound = false;

        customerPortalCls cpTest = new customerPortalCls();

        cpTest.a= new Account();

        cpTest.c = new Contact(firstName='TestFirstName', lastName='TestLastName', email='test@testorg.com');

        cpTest.u = new User();

        Profile[] profiles = [Select p.name, p.id From Profile p where p.UserLicense.Name like '%Customer Portal%'];

        cpTest.selectedProfileId = profiles[0].id;

         

        Test.startTest();

            PageReference testPageRef= cpTest.createPortaluser();

        Test.stopTest();

    }
*/
}