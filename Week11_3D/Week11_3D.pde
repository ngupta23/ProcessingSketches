void setup(){
  size(800,800,P3D);
  fill(255,128,0);
  noStroke();
}

void draw(){
  background(128);
  lights();
  translate(width/2,height/2);
  rotateY(radians(frameCount)); // 60 frames per second, frameCount keeps track of the number 
  rotateX(radians(frameCount)*0.5);
  //rotateZ(radians(frameCount));
  box(100);  
}
