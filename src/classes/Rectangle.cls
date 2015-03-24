public class Rectangle {

    Private Integer length; 
    Private Integer breadth;
//    Private Integer perimeter;
    Private Integer area;
    public Rectangle(){
    
    }
    
    Public void SetValue(Integer len, Integer bth ){
        length = len ;
        breadth = bth ; 
        
    }
    
    public void Area(){
         area = length * breadth ;
    }
    
    public Integer Perimeter(){
          Integer perimeter = (2*length + 2*breadth);
          return perimeter;
    }
    
    public void GetValue(){
        System.debug('The Length is == >' + length); 
        System.debug('The Breadth is == >' + breadth); 
        System.debug('The Area of Rectangle is == >' + area); 
  //      System.debug('The Perimeter of Rectangle is == >' + perimeter); 
        
        
    }
 }