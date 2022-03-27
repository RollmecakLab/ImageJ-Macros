  // a macro to subtract consecutive profiles form each other 

  ImID=getImageID(); // needed for selecting main window
  NumRois=roiManager("count"); // the total number of ROIs.
  NumSlices=nSlices; // for preallocating arrays later...

  for(i=0 ; i<NumRois-1;i+=2){// so i will count which tube we are on
  	// now select the MT roi and get its profile
  	  selectImage(ImID);
  	roiManager("select",i);
  	run ("Plot Z-axis Profile");
    MTXaxis = newArray ();
    MTIntValues = newArray ();
    Plot.getValues (MTXaxis, MTIntValues);
    
 
   selectImage(ImID);
  roiManager("select",i+1);

  run ("Plot Z-axis Profile");
  BGXaxis = newArray ();
  BGIntValues = newArray ();
  Plot.getValues (BGXaxis, BGIntValues);
   
  BgCorr=newArray(MTIntValues.length);  // will hold the Bgcorected Int
 
    for(j=0;j<BGXaxis.length;j++){ // here we do the subtraction
    	BgCorr[j]=MTIntValues[j]-BGIntValues[j];

  	setResult(" MT_"+i , j,BgCorr[j]) ; // writes it out to the Results Table

  	}

// should add getting means, and normalization as well as saving as .csv here, but that is also all easy to so in PRISM
  
  
  
  }
