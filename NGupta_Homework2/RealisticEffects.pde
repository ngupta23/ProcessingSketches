void addSquarePixelation(int pixelW, int pixelH, int transparency){
  // Background Pixelation
  noStroke();
  fill(246,220,159,5);
  for(int i=0; i<width; i= i + width/pixelW){
    for(int j=0; j<height; j = j + height/pixelH){
      fill(0+random(100),0+ random(100),0+random(100),transparency); // with transparency
      rect(i, j, width/pixelW, height/pixelH);
    }
  }
}
