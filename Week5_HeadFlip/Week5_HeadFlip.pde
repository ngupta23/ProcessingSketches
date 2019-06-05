void setup(){
  background(255);
  size(1200,800);
  PImage p = loadImage("Headshot_resized.jpg"); // comes from data directory in this sketch 
  int len = p.pixels.length - 1; // note that length accesses all the pixels (width * height)
  print (len);
  image(p,0,0);
  
  PImage p2 = createImage(600,800,RGB); // width, height, and color mode
  for (int i=len; i>0; i--){
    //println(len-i);
    p2.pixels[len-i] = p.pixels[i];
  }
  
  image(p2,600,0);
}
