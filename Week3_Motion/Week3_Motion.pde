void setup(){
 size(600,600);
 
}

float x = 100;
float y = 100;
float speedX = 4.5;
float speedY = 2.5;

void draw(){
  //float x = 100; // can not declare here since it gets wiped out each time we are calling draw (@ 60fps)
  background(255); // redraw animation so the previous rect is wiped out
  rect(x, y, 30, 30);
  // SpeedX and SpeedY define the slope of the movement
  x = x + speedX;
  y = y + speedY;
  
  // Collision Detection & response
  if (x > width){
    speedX = speedX * -1;
  }
  if (x < 0){
    speedX = speedX * -1;
  }
  
  if (y > height){
    speedY = speedY * -1;
  }
  if (x < 0){
    speedY = speedY * -1;
  }
}
