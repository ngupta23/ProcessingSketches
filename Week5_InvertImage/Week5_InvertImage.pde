PImage img01;
float w;
float h;

void settings(){
 img01 = loadImage("Headshot_resized.jpg"); 
 w = img01.width;
 h = img01.height;
 size(int(w*2),int(h));
}

void setup(){
  image(img01,0,0); // image, x-loc, y-loc
  filter(INVERT);
  image(img01,width/2,0); // image, x-loc, y-loc
}
