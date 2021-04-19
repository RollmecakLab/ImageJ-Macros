// A macro that will move your line in 1 pixel incremetns and add up the nice kymographs you get...

// draw your line roi
name=getTitle();
//roiManager("Add");
Roi.getCoordinates(x, y); // gets the coordinates of the roi
//run("Reslice [/]...", "output=1.000 start=Top avoid");

// now we want to move the ROI. you will have to change this part to move in the desired direction. 
// remember to keep the lines the same length!

// here generate the values for the new poly line 
// in this example we are going to move along the x - axis so..
xnew = x;
ynew = y ; // will keep the yvalues can't change line length!

for(dX=0;dX<10;dX++){
	for(i=0;i<x.length;i++){
		xnew[i]=x[i]-1;
	}
		makeSelection( "polyline", xnew, y ); // makes and adds the rois to roi manager
		roiManager("add");
}


// now we have all the lines, let's make a bunch of thickenss 1 kymographs
numRois=roiManager("count"); // get the number of Rois. then...

for(k=0;k<numRois;k++){
roiManager("select",k)
run("Reslice [/]...", "output=1.000 start=Top avoid");
kymoname="kymo_"+k;
rename(kymoname);
selectImage(name);
}

//makes a stack from all your thin 1 line kymos
run("Images to Stack", "method=[Copy (center)] name=Stack title=kymo_ use keep");


