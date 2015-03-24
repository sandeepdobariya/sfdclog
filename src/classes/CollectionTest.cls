public class CollectionTest{
   public static testmethod void main(){
      //Chcking the behaviour List Collection
      //Create
      List<String> names = new List<String>();
      names.add('Arun');
      names.add('Jaipal');
      names.add('Murali');
      names.add('nikhil');
      System.debug('Values printed through for each loop : ');
      for(String value : names){
        System.debug(value);
      }
   }// End of Testmethod
}//end of testClass