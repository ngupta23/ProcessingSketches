// BLT Exercise
float angle = 0;
float rotSpeed = PI/60;
void setup(){
 size(1000,1000); 
}

void draw(){
 background(0);
 translate(width/2, height/2);
 rotate(angle);
 rectMode(CENTER); 
 rect(0,0,100,100);
 angle += rotSpeed;
  
}
