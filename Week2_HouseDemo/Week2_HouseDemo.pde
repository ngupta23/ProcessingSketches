void setup(){
 size(1000,800); // sets global variables 'width' and 'height'
 background(255);
 
 // make the house relative to the actual window
 float houseWidth = width * 0.8;
 float houseHeight = height * 0.6;
 
 float deltaWidth = (width - houseWidth);
 float deltaHeight = (height - houseHeight);
 
 // coordinates for roof
 float x0 = deltaWidth/2, y0 = deltaHeight;
 float x1 = deltaWidth/2 + houseWidth, y1 = deltaHeight;
 float x2 = width/2, y2 = 0;
 
 // center the house but set on the bottom
 strokeWeight(5);
 noStroke();  // removes stroke, we also have noFill
 fill(100,50,20);
 rect(deltaWidth/2,deltaHeight,houseWidth,houseHeight);
 
 // roof
 fill(40,10,40); // purple - R and B predominantly
 triangle(x0,y0,x1,y1,x2,y2);
 
 // door
 float doorWidth = houseWidth * 0.15;
 float doorHeight = houseHeight * 0.4;
 
 fill(200,20,20);
 rect(deltaWidth/2 - doorWidth/2 + houseWidth/2 
     ,deltaHeight +  houseHeight - doorHeight
     ,doorWidth ,doorHeight);
 
 

}
