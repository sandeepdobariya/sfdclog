public class exceptiondemo{
    public static testmethod void main(){
        Integer num = 10;
        Integer den = 2;
        
        try{
            Integer res = num/den;
            System.debug('The Result==>'+res);
        }
        catch(Exception e){
            System.debug('Devide By Zero Exception');
        }
        
        System.debug(' Complete Process');
    }
}