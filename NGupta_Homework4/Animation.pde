void draw(){
  image(img01,0,0); // image, x-loc, y-loc
  if (reset == 1){ resetSketch(); }
  if (animate == 1){ animateSketch(); }
}

void resetSketch(){
  background(0); // important to blank out background else remnants of particles remain
  setup(); // resets to original state 
  reset = 0;
  resetAgeOfPortrait();
  resetParticleAge();  
}

void animateSketch(){
  for (int i=0; i < particleCountCurrent; i++){
    if (currentAge[i] < maxAge[i]){
      polygon(x[i], y[i], radius[i], sideCount[i], 2, particleColor[i]);
      x[i] += speedX[i];
      speedY[i] = speedY[i] + gravity[i];
      y[i] += speedY[i];
      currentAge[i] += 1;
    }
  }
  
  if (particleCountCurrent < particleCount - birthRate){
    particleCountCurrent += birthRate;
  }
  
  updateAgeOfPortrait();  
}


void keyPressed(){
  if (key == 'a' || key == 'A') { // animate
    animate = 1;    
  }
  else if (key == 'p' || key == 'P'){ // pause
    animate = 0;
  }
  else if (key == 'r' || key == 'R'){ // reset
    reset = 1;
  }
  else if (key == 'f' || key == 'F'){ // flip colors
    flip = (flip+1)%2; // toggle flip from 1 to 0 or 0 to 1  
    setupColors();
  }  
  
}
