void setupStars(){
  // Setup Variables for Stars
  for (int i = 0; i < numStars; i++){
    translateStarX[i] = int(random(0.05*width,0.95*width));
    translateStarY[i] = int(random(0.05*height,0.10*height));
    starSize[i] = random(12,20);
  }
}

void setupBinaryStars(){
  // Setup Variables for Binary Stars
  for (int i = 0; i < numBinaryStars; i++){
    translateBinaryStarX[i] = int(random(0.05*width,0.95*width));
    translateBinaryStarY[i] = int(random(0.05*height,0.10*height));
    binaryStarSize[i] = random(7,12);
  }
}

void setupShootingStars(){
  // Setup Variables for Shooting Stars
  for (int i = 0; i < numShootingStars; i++){
    xShootingStar[i] = random(-20,width+20);
    yShootingStar[i] = random(0.10*height,0.20*height);
    xShootingStarSpeed[i] = random(-20,20);
    yShootingStarSpeed[i] = random(-5,5);
    shootingStarSize[i] = random(4,8);
    maxAge[i] = random(0,50);
    currentAge[i] = 0;
  }   
}

void drawNightDawnSunRise(){
  noStroke();
  rectMode(CORNER); 
  
  // creating own background with transparency
  if (portraitAge < waitAfterMerge){ // wait for 200 iterations after statue has merged
    // Night to view stars and shooting stars
    fill(0,15); // black with transparency 
    rect(0,0,width,height);
    drawStars();
    drawBinaryStars();
    drawShootingStars();
  }
  else {
    // night transitioning to dawn
    fill(0,15); // black with transparency (night to view stars and shooting stars)
    rect(0,0,width,height);
    
    // dawn ends when transparency goes form 0 to 255 at the speed of dawnAgeSpeed
    fill(255,dawnAge); // white with transparency
    rect(0,0,width,height);
    dawnAge += dawnAgeSpeed;
    
    // sun rise
    sunRise(); 
  }
}

void drawStars(){
 for (int i = 0; i < numStars; i++){
   pushMatrix();
     translate(translateStarX[i],translateStarY[i]);
     rectMode(CENTER);
     if (i % 2 == 0){
       rotate(angle);
     }
     // stars with transparency to mimic flickering
     polygon(0, 0, starSize[i], 3, 2, color(255,random(10))); 
     polygon(0, 0, starSize[i], 3, 2, color(255,random(10)),PI); //overloaded function wih Theta added
     angle += speedRot;
   popMatrix();
 } 
  
}

void drawBinaryStars(){
 for (int i = 0; i < numBinaryStars; i++){
   pushMatrix();
     translate(translateBinaryStarX[i],translateBinaryStarY[i]);
     rectMode(CENTER);
     rotate(binaryAngle);
     // stars with transparency to mimic flickering
     polygon(15, 0, binaryStarSize[i], 360, 2, color(255,random(20)),1); 
     polygon(-15, 0, binaryStarSize[i], 360, 2, color(255,random(20)),1); 
     binaryAngle += binarySpeedRot;
   popMatrix();
 } 
  
}

void drawShootingStars(){
   // Shooting Stars
   for (int i=0; i < shootinStarCountCurrent; i++){
     if (currentAge[i] < maxAge[i]){ 
       polygon(xShootingStar[i], yShootingStar[i], shootingStarSize[i], 360, 2, color(255));
       xShootingStar[i] += xShootingStarSpeed[i];
       yShootingStar[i] += yShootingStarSpeed[i];
       currentAge[i] += 1;
     }
   }
   
   if (shootinStarCountCurrent < numShootingStars - birthRate){
     shootinStarCountCurrent += birthRate;
   }  
}

void updateAgeOfPortrait(){
  if (translation <= 0){ 
    portraitAge += 1;
  }
}

void sunRise(){
  fill(255,255,0);
  ellipse(0.9*width, sunY, 0.3*width,0.3*width);
  if (sunY > 0.1*width){
    sunY -= 0.8* width/(255/dawnAgeSpeed); // Sun rises from start of dawn to end of dawn  
  }  
  
}
