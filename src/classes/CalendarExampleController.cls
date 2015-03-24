/**
*   Controller for calendar component demo
*
*   @author Sahil Grover    <sgrover@acumensolutions.com>
*/
public with sharing class CalendarExampleController implements CalendarItemRetriever {

    public CalendarHandler Cal {get; private set;}
    public CalendarParameters CalParams {get; private set;}
    public list<calEvent> events {get;set;}
    String dtFormat = 'EEE, d MMM yyyy HH:mm:ss z';
    public CalendarExampleController() {
        CalParams = new CalendarParameters();
        CalParams.SelectedView = CalendarParameters.CalendarView.WEEK;
        Cal = new CalendarHandler(this);
    }

    /**
    *   Get calendar items in a date range
    *
    *   @param  startDate   The start date (inclusive) to retrieve calendar items for
    *   @param  endDate     The end date (inclusive) to retrieve calendar items for
    *
    *   @return A list of CalendarItem objects
    */
    public List<CalendarItem> getCalendarItems(Date startDate, Date endDate) {
        List<CalendarItem> calendarItems = new List<CalendarItem>();

        // standard events
        List<Event> events = new List<Event>([
            SELECT Id, Subject, Description, StartDateTime,
                EndDateTime, IsAllDayEvent
            FROM Event
            WHERE StartDateTime >= :startDate
                AND EndDateTime <= :endDate
            ]);
        for (Event e : events) {
            CalendarItem calItem = createCalendarItem(e);
            calItem.Actions.add( new SwitchCalendarItemTypeAction(calItem) );
            calendarItems.add(calItem);
        }

        // custom events
        List<CustomEvent__c> customEvents = new List<CustomEvent__c>([
            SELECT Id, Name, Description__c, StartDateTime__c,
                EndDateTime__c, IsAllDay__c
            FROM CustomEvent__c
            WHERE StartDateTime__c >= :startDate
                AND EndDateTime__c <= :endDate
            ]);
        for (CustomEvent__c e : customEvents) {
            CalendarItem calItem = createCalendarItem(e);
            calItem.Actions.add( new SwitchCalendarItemTypeAction(calItem) );
            calendarItems.add(calItem);
        }

        return calendarItems;
    }

    private CalendarItem createCalendarItem(CustomEvent__c e) {
        CalendarItem calItem = new CalendarItem(e.Id);
        calItem.Name = e.Name;
        calItem.Description = e.Description__c;
        calItem.StartDateTime = e.StartDateTime__c;
        calItem.EndDateTime = e.EndDateTime__c;
        calItem.IsAllDay = e.IsAllDay__c;
        calItem.CssClass = 'custom-event';
        return calItem;
    }

    private CalendarItem createCalendarItem(Event e) {
        CalendarItem calItem = new CalendarItem(e.Id);
        calItem.Name = e.Subject;
        calItem.Description = e.Description;
        calItem.StartDateTime = e.StartDateTime;
        calItem.EndDateTime = e.EndDateTime;
        calItem.IsAllDay = e.IsAllDayEvent;
        calItem.CssClass = 'standard-event';
        return calItem;
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
    
    private class SwitchCalendarItemTypeAction implements CalendarItemAction {

        private CalendarItem calItem;

        public SwitchCalendarItemTypeAction(CalendarItem calItem) {
            this.calItem = calItem;
        }

        /**
        *   Retrieve the label for the custom calendar action
        *
        *   @return The String label for the calendar action
        */
        public String getActionLabel() {
            return 'Switch Type';
        }

        /**
        *   Should the calendar reload after performing the action
        *
        *   @return True if the calendar should reload following the custom action, false otherwise
        */
        public boolean getInitOnComplete() {
            return true;
        }
        
        /**
        *   performAction   Calendar action logic
        *   
        *   @return Return a page to redirect to
        */
        public PageReference performAction() {
            if (calItem.CssClass == 'standard-event') {
                calItem.CssClass = 'custom-event';
            } else {
                calItem.CssClass = 'standard-event';
            }
            return null;
        }

    }
}