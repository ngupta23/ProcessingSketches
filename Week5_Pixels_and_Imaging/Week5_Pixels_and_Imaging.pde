PImage img01;
float w;
float h;

void settings(){
 img01 = loadImage("Headshot_resized.jpg"); // comes from data directory in this sketch 
 w = img01.width;
 h = img01.height;
 //size(600,800);
 size(int(w*2),int(h));
}

void setup(){
 background(255);
 image(img01,0,0); // image, x-loc, y-loc
 loadPixels();
 for (int i=0; i <pixels.length; i++){
   // extract the pixel color and tone down the red component
   float r = red(pixels[i]); // extracts the red compnent of the pixes;
   float g = green(pixels[i]); 
   float b = blue(pixels[i]); 
   float a = alpha(pixels[i]);
   println(a);
   pixels[i] = color(r*=0.5,g,b); // 50% red of original picture
 }
 updatePixels();
 image(img01,width/2,0); // image, x-loc, y-loc
 
 
}
