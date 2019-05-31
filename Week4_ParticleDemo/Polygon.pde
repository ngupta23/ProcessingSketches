void polygon(float x, float y, float radius, int sides, float strokeWt, color strokeColor) {
  //ellipse(x, y, radius*2, radius*2);
  //rect(x-radius,y-radius,radius*2, radius*2);
  
  
  float theta = 0;
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
