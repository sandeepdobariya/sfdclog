Public Class settolist {
    Public Static TestMethod Void Main(){
        List<String> list1 = new List<String>{'Ashish','Nirav','Niket'};
        
        List<String> list2 = new List<String>();
        
        Set<String> set2 = new Set<String>();
        
         for(Integer temp = 0; temp<list1.size();temp++){
            list2[temp] = (list1[temp]);
        }
        
        System.debug('The 5 String Of List2');
        for(String l2 : list2){
            System.debug(l2);
        }
        //set2.add(list1);
        //list2.add(list1);
    }// End of Test Method
}// End of Main Class