void setupStatue(){
  setupBase();
  setupBody();
  setupFace();  
}

void drawStatue(){
  noStroke();
  
  fill(194,143,99); // base color 
  drawBase();
  
  fill(161,199,182); // rust color
  drawBody();
  
  drawFaceArmFlame(color(161,199,182), color(255,255,0,random(10)));
}

void setupBase(){
  // Setup Base
  x[0] = width*0.10;
  initX0 = x[0]; // for stopping critiria
  x[1] = width*0.20;
  x[2] = width*0.30;
  x[3] = width*0.35;
  x[4] = width*0.40;
}
void setupBody(){
  // Setup Body
  for (int i=1; i < 20; i++){
    if (i < 8){
      x[4+i] = width*(0.45-i*bodyWidthIncrementPercent);
    }
    else{
      x[4+i] = width*(0.45+(i-15)*bodyWidthIncrementPercent);
    }
  }
}
void setupFace(){
  // Setup Face
  x[25] = 0; // left face
  x[26] = 0; // right face  
}

void drawBase(){
  rectMode(CORNER);
  pushMatrix();
    translate(-translation,0);
    rect(x[0],height*0.95,width*0.80,2*slabHeight); 
    rect(x[2],height*0.85,width*0.40,2*slabHeight);
    rect(x[4],height*0.775,width*0.20,slabHeight);
  popMatrix();
   
  pushMatrix();
    translate(translation,0);
    rect(x[1],height*0.90,width*0.60,2*slabHeight); 
    rect(x[3],height*0.80,width*0.30,2*slabHeight); 
  popMatrix();  
}

void drawBody(){
  for (int i=1; i<20; i++){
    
    if (i < 8){
      pushMatrix();
        translate(translation,0);
        rect(x[4+i],height*(0.775 - i*0.025), width*(0.10+i*2*bodyWidthIncrementPercent), slabHeight);
      popMatrix();
        
    }
    else{
      pushMatrix();
        translate(-translation,0);
        rect(x[4+i],height*(0.775 - i*0.025), width*(0.10-(i-15)*2*bodyWidthIncrementPercent), slabHeight);
      popMatrix();
    }
  }  
}

void drawFaceArmFlame(color faceColor, color flameColor){ 
  // Draw left face, arm and flame
  pushMatrix();
    translate(width/2-translation,height*0.25);
    arc(x[25], 0, .08*width, 0.1*height, PI/2, 3*PI/2, OPEN); //left face
    
    //crown relatve to face
    triangle(x[25]-5,-10,x[25]+5,-10,x[25],-100); //spikes (center)
    triangle(x[25]-10,-10,x[25]-5,-10,x[25]-50,-100); //spikes (first left)
    triangle(x[25]+10,-10,x[25]+5,-10,x[25]+50,-100); //spikes (right first)
    triangle(x[25]-20,-10,x[25]-10,-10,x[25]-100,-100); //spikes (second left)
    triangle(x[25]+20,-10,x[25]+10,-10,x[25]+100,-100); //spikes (second first)
               
    pushMatrix(); // arm and flame are relative to the face
      translate(translateArm,0.0*height); //translateArm to the right position relative to the body
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
    translate(width/2+translation,height*0.25);
    arc(x[26], 0, .08*width, 0.1*height, -PI/2, PI/2, OPEN); // right face
  popMatrix();   
}
