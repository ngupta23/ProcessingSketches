float lightX = -50;
float spdX = 10;
void setup(){
  size(600,600,P3D); 
  noStroke(); // If we add noStroke for 3D it turns off lighting as well, hence we need to add lighting effects manually otherwise it is all white (if background id white)
}

void draw(){
  background(0);
  //lights();
  pointLight(255,255,255,lightX,-20,420);
  pointLight(255,255,255,-100,height/2, 100); // Ambient Light
  translate(width/2,height/2,200); // go into plane with -ve value
  rotateY(frameCount * PI / 180);
  sphere(100);  
  lightX += spdX;
}
