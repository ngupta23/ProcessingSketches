void setup(){
 //size(390, 300); // Original 
 size(780, 600); // 2x size
 background(246,220,159);
 
 // Red Circle
 int center_x = round(0.64 * width);
 int center_y = round(0.64 * height);
 int diameter = round(0.64 * height);
 noStroke();
 fill(221,57,22);
 ellipse(center_x,center_y,diameter,diameter);
 
 // Black Circle 1
 center_x = round(0.56 * width);
 center_y = round(0.10 * height);
 diameter = round(0.13 * height);
 fill(0,0,0);
 ellipse(center_x,center_y,diameter,diameter);
 
 // Lighter "blackish" circle
 center_x = round(0.56 * width);
 center_y = round(0.67 * height);
 //fill(0,0,0,100); // add transparency
 fill(80,65,46); 
 ellipse(center_x,center_y,diameter,diameter);
 
 // vertical dividing line
 int x0 = round( 0.65 * width);
 stroke(246,220,159);
 strokeWeight(10);
 line(x0,0,x0,height);
 
 // horizontal line
 int y0 =round( 0.78 * height);
 stroke(223,187,64);
 strokeWeight(6);
 line(0,y0,width,y0);
 
 // multiple vertical lines
 float init = 0.55;
 float strokeWt = 6.5;
 float gap = 2.5;
 stroke(223,187,64);
 strokeWeight(strokeWt);
 for (int i = 0; i < 4; i++){
   x0 =round(init * width + i*(strokeWt+gap));
   line(x0,0,x0,height);
 }  
 
 // Background Pixelation
 noStroke();
 fill(246,220,159,5);
 for(int i=0; i<width; i= i + width/39){
   for(int j=0; j<height; j = j + height/30){
     fill(0+random(100),0+ random(100),0+random(100),20); // with transparency
     rect(i, j, width/39, height/30);
   }
 }
 
 
}
 
 
 
