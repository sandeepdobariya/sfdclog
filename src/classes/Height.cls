// Create a Business Class name Height
public class Height {
        // data Member
        Integer feet;
        Integer inches;
        Integer inches1;
        // Default Constructor
        public Height(){
            feet = inches = 0 ; // Dummy State
        }
        
        // Parametarised Constructor
        public Height(Integer f , Integer i ){
            feet = f;
            inches = i;
        }
        
        // Parameterised Constructor with one Argument
        public Height(Integer fi){
            feet = inches = fi;
           
        }
        
        public void SetValue(Integer f , Integer i){
            feet = f;
            inches = i ;
        
        }
        
        public void SetValue(Integer f){
            feet = inches = f ;
        
        }

        
        public void GetValue(){
            System.debug('The Height is == >'+ feet + 'Feet'+inches+'Inches');
            
        }
 }