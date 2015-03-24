// Create Business class name Temp
public class temp{
    Integer val1;
    Integer val2;
    Integer res;
    Integer res2;
    Integer res3;
    Integer res4;
    public temp(){
    }
    
    public void Setvalue(Integer v1, Integer v2){
        val1= v1;
        val2= v2;
    } 
    
    public void add(){
       system.debug('The Value 1==>'+ val1);     
       system.debug('The Value 2==>'+ val2);     
         res= val1 + val2;
    }
        
    public void getvalue(){
        system.debug('The Result==>'+ res);
        system.debug('The Result==>'+ res2);
         system.debug('The Result==>'+ res3);
     }   
    
}