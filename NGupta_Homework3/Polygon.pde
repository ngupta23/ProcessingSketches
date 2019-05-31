void polygon(float x, float y, float radius, int sides, float strokeWt, color strokeColor) {
  polygon(x, y, radius, sides, strokeWt, strokeColor, 0);
}

// overloaded function (1)
void polygon(float x, float y, float radius, int sides, float strokeWt, color strokeColor, float theta){
  // Creates 2 polygons, one that is rotated by theta from the other
  float x2, y2;
  float rotAmount = TWO_PI/sides;
  
  // NOTE: x and y are the center of the shape
  // Then we draw the circle (or polygon) around it by adding x2 and y2 to it
  
  strokeWeight(strokeWt);
  stroke(strokeColor);
  noFill();
  //fill(strokeColor);
  
  beginShape();
  for (int i = 0; i < sides; i++){
    x2 = x + radius * cos(theta + i * rotAmount);
    y2 = y + radius * sin(theta + i * rotAmount);
    vertex(x2,y2); 
  }
  endShape(CLOSE);
  
}

// overloaded function (2)
void polygon(float x, float y, float radius, int sides, float strokeWt, color strokeColor, int fill){
  float x2, y2;
  float rotAmount = TWO_PI/sides;
  float theta = 0;
  
  // NOTE: x and y are the center of the shape
  // Then we draw the circle (or polygon) around it by adding x2 and y2 to it
   
  strokeWeight(strokeWt);
  stroke(strokeColor);
  if (fill == 1){
    fill(strokeColor);
  }
  else{
    noFill();
  }
    
  beginShape();
  for (int i = 0; i < sides; i++){
    x2 = x + radius * cos(theta + i * rotAmount);
    y2 = y + radius * sin(theta + i * rotAmount);
    vertex(x2,y2); 
  }
  endShape(CLOSE);
  
}
