PVector speed = new PVector(0.2,0.4);
PVector pos = new PVector(100,100);

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  ellipse(pos.x, pos.y, 10, 10);
  pos.add(speed);
}
