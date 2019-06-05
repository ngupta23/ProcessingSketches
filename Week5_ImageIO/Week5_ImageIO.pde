// Processing Data Types (Classes) - Starts with P
// P is used to differentiate from other JAVA class types
PImage img01;
float w;
float h;

void settings(){
 img01 = loadImage("Headshot_resized.jpg"); // comes from data directory in this sketch 
 w = img01.width;
 h = img01.height;
 //size(600,800);
 size(int(w),int(h));
}

void setup(){
 int opt = 1;
 if (opt == 1){
   background(255);
   image(img01,0,0); // image, x-loc, y-loc
 }
 else{
   background(img01); // can use this instead of image() command as well
 }
}
