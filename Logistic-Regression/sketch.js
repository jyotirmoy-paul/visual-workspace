var dataset=[[1,210,80],
			[1,320,480],
			[1,30,219],
			[1,180,370],
			[1,480,480]];//The features

var fsdataset=[];

var y=[0,1,0,1,0];//The labels

var theta=[0,-1,1];
//var stepSize=0.0013130769230769;
var stepSize=1;
var diameter=10;
var hypo,cost1;


function setup() {
  // put setup code here
  
	var size=random(30,100);

	var cnv;
	if(windowWidth<1800)
		cnv = createCanvas(min(500,windowWidth), min(500,windowWidth));
	else
		cnv = createCanvas(700, 700);
	cnv.parent('left-container');
	cnv.id('graphcanvas');
	//cnv.style('position','fixed');
	if(width!=500){
		for (var i = 0; i <dataset.length ; ++i) {

			dataset[i][1]=round(map(dataset[i][1],0,500,0,width));
			dataset[i][2]=round(map(dataset[i][2],0,500,0,width));
		}
	}
	else{
		cnv.style('border','2px solid black');
	}
	/*
	var x = (windowWidth - width) / 2;
	var y = (windowHeight - height) / 2;
	cnv.position(x, y);
	*/
	

	for (var i = 0; i <dataset.length ; ++i) {
		fsdataset.push([]);
		fsdataset[i].push(1);
		fsdataset[i].push(map(dataset[i][1],0,height,0,1));
		fsdataset[i].push(map(dataset[i][2],0,width,0,1));
	}
	console.log(dataset);
	noLoop();
	
}



function cost(){
	var z=[];
	for(i=0;i<fsdataset.length;i++){
		var zt=fsdataset[i][0]*theta[0]+fsdataset[i][1]*theta[1]+fsdataset[i][2]*theta[2];
		//console.log("ZZZZZZZZZZZZZZZZZZZZZZZZZZ",zt);
		z.push(zt);

	}
	//console.log("z",z);
	var h=[];
	for (i=0;i<z.length;i++){
		//console.log("z(i)",z[i]);
		h.push(1/(1+Math.exp(-z[i])));
	}

	//console.log("h",h);
	var jval=0;
	var i;
	for (i=0;i<fsdataset.length;++i){
		jval += -1/4 *(Math.log(h[i]) * y[i] + Math.log(1-h[i]) * (1-y[i]));
		
	}
	console.log("jval:::::::",jval);
	//update Theta
	for(i=0;i<theta.length;++i){
		gradient=0;
		for (j=0;j<fsdataset.length;++j){
			gradient+=(1/fsdataset.length)*(h[j]-y[j])*fsdataset[j][i];
			
		}
		//console.log("i",gradient);
		theta[i] -= stepSize*gradient;
	}
	//console.log('Theta:',theta)
	return [h,jval];
}

function updateValues(h,cost){

	select("#step-val").html(stepSize.toString());
	select("#param-val").html(round(theta[0],2)+', '+
								round(theta[1],2)+', '+
								round(theta[2],2));


	select('#dataset-val').html("");
	select("#hypo-val").html("");
	
	var i,divi;
	for(i=0;i<hypo.length;i++){

		divi=createDiv('['+dataset[i].toString()+'], '+'['+
						round(fsdataset[i][0],2)+','+
						round(fsdataset[i][1],2)+','+
						round(fsdataset[i][2],2)+']');
		divi.parent("dataset-val");

		divi=createDiv(round(h[i],3)+", "+y[i]);
		divi.parent("hypo-val");
		
		
	}
	select("#cost-val").html(cost.toString());
}


function draw() {
	background(255);
	for (var i = 0; i <dataset.length ; ++i) {
		noStroke();
		if(y[i]==0)
			fill(255,0,0);
		else
			fill(0,255,0);
		ellipse(dataset[i][1],
			dataset[i][2],
			diameter,
			diameter);
		console.log(i);
	}
	
	if(dataset.length>2){

		
		[hypo,cost1]=cost();
		updateValues(hypo,cost1);

	}
	
	fill(0,0,255);
	var x1=0;
	var y1=(-theta[0]-theta[1]*x1)/theta[2];
	var x2=1;
	var y2=(-theta[0]-theta[1]*x2)/theta[2];

	
	stroke(0,255,255);
	//line(x1,y1,x2,y2);
	line(map(x1,0,1,0,width),
		map(y1,0,1,0,height),
		map(x2,0,1,0,width),
		map(y2,0,1,0,height));

}
var count=0;



function mousePressed(){
	
	redraw();

}