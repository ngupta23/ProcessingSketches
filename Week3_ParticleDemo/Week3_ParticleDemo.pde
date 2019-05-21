float x, y;
float radius = 30;
float spdX = 5, spdY = 4;

void setup() {
  size(800, 700);
  x = width/2;
  y = height/2;
}

void draw() {
  background(255);
  for (int i = 1; i < 6 ; i++){
    // void polygon(float radius, int sides, float strokeWt, color strokeColor)
    polygon(i*6, i+3, 2, color(255,0,0));
  }
  moveParticle();
  checkCollisions();
}

void moveParticle() {
  //spdY = spdY + 1; // curved motion
  //println("X: " + spdX + " ; Y: " + spdY);
  x += spdX;
  y += spdY;
}

void checkCollisions(){
  // when you reach with a radius of the edge, you check for collision
  // also when you are drawing, you are shifting by a radius 
  // so it looks like the other edge is hitting the boundary
  if (x >= width - radius | x <= 0 + radius){
    spdX = -spdX; // reverse speed  
  }
  if (y >= height -radius | y <= 0 + radius){
    spdY = -spdY; // reverse speed  
  }
  
 
}
