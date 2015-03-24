public class TaskChartController {

    public List<AggregateResult> lstAR = new List<AggregateResult>();
    
    public TaskChartController()
    {
        lstAR = [SELECT ActivityDate, COUNT(id) Total 
                FROM Task
                WHERE IsClosed = FALSE 
                AND ActivityDate = NEXT_N_DAYS:30
                GROUP BY ActivityDate];
    }
    
    public list<TaskClass> getResults()
    {
        list<TaskClass> lstResult = new List<TaskClass>();
        for (AggregateResult ar: lstAR)
        {
            taskClass objTaskClass = new taskClass(ar);
            lstResult.add(objTaskClass);
        }                       
        return lstResult;
    }
    
    class taskClass
    {
        public Integer Total
        {get; set;}
        
        public Date ActivityDate
        {get; set;}
            
        public taskClass(AggregateResult ar)
        {
            Total = (integer)ar.get('Total');
            ActivityDate = (Date)ar.get('ActivityDate');
        }
    }
}