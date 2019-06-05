PImage img01;
float w;
float h;

void settings(){
 img01 = loadImage("Headshot_resized.jpg"); // comes from data directory in this sketch 
 size(1000,1000);
 //size(600,800);
 
}

void setup(){
 background(255);
 image(img01,0,0); // image, x-loc, y-loc
 
 loadPixels(); // loads the current pixels into the built in pixels array
 //pixels is a 2D array
 int opt = 2;
 for (int i=0; i<50000; i++){
   if (opt == 1){
     pixels[int(random(pixels.length))] = color(0); // adds dots to the entire sketch. Can we do it to just the picture
   }
   else{
     // The image has its own pixel array which you can use instead of all the pixels
     img01.pixels[int(random(img01.pixels.length))] = color(0); //
   }
 }
 img01.updatePixels();
 image(img01,width/2,0); // need to redraw the image otherwise we dont see the updates
  
}
