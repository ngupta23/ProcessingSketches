size(400,400);
background(255);
noFill();
translate(0,height/2);
beginShape();
  for (int i=0; i < width; i++){ 
    vertex(i,sin(i*PI/180)*height/2);
  }
endShape();
