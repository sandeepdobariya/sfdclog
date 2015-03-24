public class testlistex {
    public static testmethod void main(){
        list<String> list1 = new list<string>{'Ashish','Nirav','Dhiral','Naishan','Niket'};
        
     /*   list1.add('Ashish');
        list1.add('Nirav');
        list1.add('Dhiral');
        list1.add('Naishan');
        list1.add('Niket');
        //list1.remove(2);  */
        
        System.debug(' The 5 String of List1');
        
        for(String l1 : list1){
            System.debug(l1);
        }
     // End of List1   
        
        list<string> list2 = new String[(list1.size())];
        
        for(Integer temp = 0; temp<list1.size();temp++){
            list2[temp] = (list1[temp]);
        }
        
        System.debug('The 5 String Of List2');
        for(String l2 : list2){
            System.debug(l2);
        }
        
        for(Integer temp = 0; temp<list2.size();temp++){
        
            if(temp==2){
                list2[temp] = 'lali';
                temp++;     
            }
            if(temp==3){
                    list2[temp]='Pinkesh';    
                    temp++;
            }
        }
        
        System.debug('The New 5 String Of List2');
        for(String l2 : list2){
            System.debug(l2);
        }
        boolean flag = true ;
        for(Integer temp = 0; temp<list2.size();temp++){
         if(list1[temp]!= list2[temp]){
                 flag = false;
                 break;
         }
           
       }
       if(flag == true){
         System.debug('Both List1 and list2 are Same');
       }
       else
       {
             System.debug('Both List1 and list2 are Not Same');
       
       }
    }// End of Test Method
}// End of outer Class