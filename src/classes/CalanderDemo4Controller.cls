public with sharing class CalanderDemo4Controller {


    public CalendarHandler Cal {get; private set;}
    public CalendarParameters CalParams {get; private set;}
    public list<calEvent> events {get;set;}
    String dtFormat = 'EEE, d MMM yyyy HH:mm:ss z';
    public CalanderDemo4Controller () {
        pageLoad();
    }




    
    public PageReference pageLoad() {
        events = new list<calEvent>();     
       
        for (CustomEvent__c cont  : [SELECT Id, Name, Description__c, StartDateTime__c,EndDateTime__c, IsAllDay__c FROM CustomEvent__c]) {
            //CalendarItem calItem = createCalendarItem(e);
           // calItem.Actions.add( new SwitchCalendarItemTypeAction(calItem) );
         //   calendarItems.add(calItem);
            
            DateTime startDT = datetime.newInstance(Date.Today().Year(),cont.StartDateTime__c.Month(), cont.StartDateTime__c.Day());
            calEvent bday = new calEvent();
             
            bday.title = cont.Name;
            bday.allDay = true;
            bday.startString = startDT.format(dtFormat);
            //Because this is an all day event that only spans one day, we can leave the send date null
            bday.endString = '';
            bday.url = '/' + cont.Id;
            bday.className = 'event-birthday';
            events.add(bday);
            
        }
        
        return null;
    }
    
    //Class to hold calendar event data
    public class calEvent{
        public String title {get;set;}
        public Boolean allDay {get;set;}
        public String startString {get;set;}
        public String endString {get;set;}
        public String url {get;set;}
        public String className {get;set;}
    }

}