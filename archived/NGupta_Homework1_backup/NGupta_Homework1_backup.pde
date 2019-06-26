void setup(){
 //size(1500, 1788); // sets global variables 'width' and 'height'
 size(750, 894); // sets global variables 'width' and 'height'
 
 // White background
 background(255);
 
 // Black Rectangle
 fill(0,0,0,225);
 rect(width*0.025, height*0.025,width*0.95,height*0.95);
 
 noFill();

 // Yellow Triangle 
 int x0 = round(0.24 * width);
 int y0 = round(0.58 * height);
 int x1 = round(0.09 * width);
 int y1 = round(0.80 * height);
 int x2 = round(0.4 * width);
 int y2 = round(0.77 * height);
 stroke(251,248,85);
 triangle(x0, y0, x1, y1, x2, y2);
  
 // Blue Circle
 int center_x = round(0.43 * width);
 int center_y = round(0.7 * height);
 int diameter = round(0.28 * width);
 stroke(120,129,248);
 ellipse(center_x,center_y,diameter,diameter);

 // Square
 x0 = round(0.23 * width);
 y0 = round(0.60 * height);
 x1 = round(0.51 * width);
 y1 = round(0.63 * height);
 x2 = round(0.48 * width);
 y2 = round(0.86 * height);
 int x3 = round(0.2 * width);
 int y3 = round(0.833 * height);
 stroke(221,62,43);
 quad(x0, y0, x1, y1, x2, y2, x3, y3);
 
 noStroke();

 // Filled Blue Circle
 center_x = round(0.43 * width+100);
 center_y = round(0.7 * height-200);
 diameter = round(0.28 * width);
 fill(120,120,248,200);
 ellipse(center_x,center_y,diameter,diameter);
 
 // Filed Yellow Triangle
 x0 = round(0.24 * width+100);
 y0 = round(0.58 * height-200);
 x1 = round(0.09 * width+100);
 y1 = round(0.80 * height-200);
 x2 = round(0.4 * width+100);
 y2 = round(0.77 * height-200);
 fill(251,248,85,180);
 triangle(x0, y0, x1, y1, x2, y2);
 
 //fill(251,248,85,180);
 //triangle(x0, y0, x1, y1, x2, y2);
 
 // Filled Red Square
 x0 = round(0.23 * width+100);
 y0 = round(0.60 * height-200);
 x1 = round(0.51 * width+100);
 y1 = round(0.63 * height-200);
 x2 = round(0.48 * width+100);
 y2 = round(0.86 * height-200);
 x3 = round(0.2 * width+100);
 y3 = round(0.833 * height-200);
 fill(221,62,43,150);
 quad(x0, y0, x1, y1, x2, y2, x3, y3);
 
 fill(221,110,0,75);
 quad(x0, y0, x1, y1, x2, y2, x3, y3);
 
 fill(120,120,248,50);
 ellipse(center_x,center_y,diameter,diameter);
 
 
 

 
 
}
