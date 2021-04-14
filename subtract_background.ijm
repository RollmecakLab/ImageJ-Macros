 // this macro will subtract rows in the results table. 
 // very useful if you need to measue and do background correction
 
 for(a=0; a<nResults();a+=2){
 	//print( getResult("Mean",a));
 	//print(getResult("Mean",a+1));
 	print( (getResult("Mean",a))-(getResult("Mean",a+1)));
 	
 }
