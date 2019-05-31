void drawStatue(){
  stroke(0); //
  fill(194,143,99); drawBase(); // base color
  noStroke();
  fill(161,199,182); drawBody(); // rust color
  drawFaceArmFlame(color(161,199,182), color(255,128,0,random(100,255)));
}

void drawBase(){
  rectMode(CORNER);
  // Base 1, 3, and 5
  pushMatrix();
    // start from off screen (left), then move to screen as translation variable gets updated
    translate(-translation,0); 
    rect(width*0.10,height*0.95,width*0.80,2*slabHeight); 
    rect(width*0.30,height*0.85,width*0.40,2*slabHeight);
    rect(width*0.40,height*0.775,width*0.20,slabHeight);
  popMatrix();
   
  // Base 2, and 4 
  pushMatrix();
    // start from off screen (right), then move to screen as translation variable gets updated
    translate(translation,0); 
    rect(width*0.20,height*0.90,width*0.60,2*slabHeight); 
    rect(width*0.35,height*0.80,width*0.30,2*slabHeight); 
  popMatrix();  
}

void drawBody(){
  for (int i=1; i<20; i++){
    if (i < 8){
      pushMatrix();
        // start from off screen (right), then move to screen as translation variable gets updated
        translate(translation,0); 
        rect(width*(0.45-i*bodyWidthIncrementPercent),height*(0.775 - i*0.025), width*(0.10+i*2*bodyWidthIncrementPercent), slabHeight);
      popMatrix();
        
    }
    else{
      pushMatrix();
        // start from off screen (left), then move to screen as translation variable gets updated
        translate(-translation,0); 
        rect(width*(0.45+(i-15)*bodyWidthIncrementPercent),height*(0.775 - i*0.025), width*(0.10-(i-15)*2*bodyWidthIncrementPercent), slabHeight);
      popMatrix();
    }
  }  
}

void drawFaceArmFlame(color faceColor, color flameColor){ 
  // Draw left face, arm and flame
  pushMatrix();
    // start from off screen (left), then move to screen as translation variable gets updated
    translate(width/2-translation,height*0.25);
    arc(0, 0, .08*width, 0.1*height, PI/2, 3*PI/2, OPEN); //left face
    
    // half of the crown relatve to left face
    triangle(-5,-10,0,-10,0,-100); //spikes (half center)
    triangle(-10,-10,-5,-10,0-50,-100); //spikes (first left)
    triangle(-20,-10,-10,-10,0-100,-100); //spikes (second left)
               
    pushMatrix(); // arm and flame are relative to the face
      translate(-0.08*width,0.0*height); //translateArm to the right position relative to the body
      rotate(-PI/5);
      rectMode(CENTER);
      rect(0,0,0.025*width,0.15*height); // arm
      fill(flameColor); // flickering flame
      ellipse(0,-0.1*height,0.025*width,0.05*height); //flame
    popMatrix();
  popMatrix();
   
  // Draw Right Face 
  pushMatrix();
    fill(faceColor); // rust color
    // start from off screen (right), then move to screen as translation variable gets updated
    translate(width/2+translation,height*0.25);
    arc(0, 0, .08*width, 0.1*height, -PI/2, PI/2, OPEN); // right face
    
    // other half of the crown relatve to right face
    triangle(0,-10,+5,-10,0,-100); //spikes (half center)
    triangle(+10,-10,+5,-10,0+50,-100); //spikes (right first)
    triangle(+20,-10,+10,-10,0+100,-100); //spikes (second first)
  popMatrix();   
}
