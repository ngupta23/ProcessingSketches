void setup(){
 size(1200,800); 
 noStroke();
 int border = 300;
 for (int i=0; i<200; i++){
   fill(random(255),random(255),random(255),random(255));
   rect(random(border,width-border),random(border,height-border), 50,50);
 }
 
 loadPixels(); // loads the current pixels into the built in pixels array
 //pixels is a 1D array (works with length only)
 for (int i=0; i<pixels.length/2; i++){
   pixels[i] = color(200,100,50); // accessing the rows and covering half of them with a color  
 }
 updatePixels();
 
}
