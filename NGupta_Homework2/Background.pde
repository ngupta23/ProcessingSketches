void drawRightmostMountain(){
  // Mountain Rightmost
  fill(118,131,163);
  beginShape();
  curveVertex(0.67 * width , 0.1025 * height);
  curveVertex(0.67 * width , 0.1025 * height);
  curveVertex(0.8167 * width , 0.0 * height);
  curveVertex(0.905 * width , 0.0538 * height);
  curveVertex(0.995 * width , 0.0012 * height);
  curveVertex(0.9983 * width , 0.1688 * height);
  curveVertex(0.67 * width , 0.1025 * height);
  curveVertex(0.67 * width , 0.1025 * height);
  endShape();
}

void drawMiddleMountain(){
  // Mountain middle
  stroke(85,100,125);
  strokeWeight(3);
  fill(105,119,146);
  beginShape();
  curveVertex(0.6667 * width , 0.0025 * height);
  curveVertex(0.6667 * width , 0.0025 * height);
  curveVertex(0.8083 * width , 0.1013 * height);
  curveVertex(0.9967 * width , 0.1388 * height);
  curveVertex(0.9983 * width , 0.3113 * height);
  curveVertex(0.0017 * width , 0.3 * height);
  curveVertex(0.0017 * width , 0.0 * height);
  curveVertex(0.0017 * width , 0.0 * height);
  endShape();
  resetStroke();
}

void drawMudslide(){
  // Mudslide
  stroke(100,110,120);
  strokeWeight(2);
  fill(120,127,137);
  beginShape();
  curveVertex(0.7483 * width , 0.1962 * height);
  curveVertex(0.7483 * width , 0.1962 * height);
  curveVertex(0.9933 * width , 0.28 * height);
  curveVertex(0.995 * width , 0.4638 * height);
  curveVertex(0.4283 * width , 0.4625 * height);
  curveVertex(0.6683 * width , 0.2625 * height);
  curveVertex(0.745 * width , 0.1975 * height);
  curveVertex(0.745 * width , 0.1975 * height);
  endShape(); 
  resetStroke();
}

void drawBackTrees(){
  // back trees
  stroke(50,80,75);
  strokeWeight(2);
  fill(69,100,95);
  beginShape();
  curveVertex(0.995 * width , 0.4012 * height);
  curveVertex(0.995 * width , 0.4012 * height);
  curveVertex(0.6017 * width , 0.4112 * height);
  curveVertex(0.7817 * width , 0.3262 * height);
  curveVertex(0.9233 * width , 0.3175 * height);
  curveVertex(0.9967 * width , 0.34 * height);
  curveVertex(0.9967 * width , 0.3988 * height);
  curveVertex(0.9967 * width , 0.3988 * height);
  endShape();
  resetStroke();
}

void drawIce(){
  // ice
  fill(255);
  beginShape();
  curveVertex(0.4867 * width , 0.00 * height);
  curveVertex(0.4867 * width , 0.00 * height);
  curveVertex(0.625 * width , 0.1938 * height);
  curveVertex(0.6067 * width , 0.2188 * height);
  curveVertex(0.5617 * width , 0.2262 * height);
  curveVertex(0.5167 * width , 0.1175 * height);
  curveVertex(0.465 * width , 0.00 * height);
  curveVertex(0.465 * width , 0.00 * height);
  endShape();
}

void drawMountainLeftSecond(){
  // Mountain second from left
  fill(95,89,91);
  beginShape();
  curveVertex(0.18 * width , 0.2 * height);
  curveVertex(0.18 * width , 0.2 * height);
  curveVertex(0.49 * width , 0.4538 * height);
  curveVertex(0.0 * width , 0.4688 * height);
  curveVertex(0.0 * width , 0.00 * height);
  curveVertex(0.0 * width , 0.00 * height);
  endShape();
  resetStroke();
}

void drawMuddyMountainLeftMost(){
  // Muddy mountain left most
  stroke(125,110,110);
  strokeWeight(18);
  fill(143,132,130);
  beginShape();
  curveVertex(0.4033 * width , 0.445 * height);
  curveVertex(0.4033 * width , 0.445 * height);
  curveVertex(0.0033 * width , 0.2675 * height);
  curveVertex(0.0017 * width , 0.47 * height);
  curveVertex(0.3983 * width , 0.4438 * height);
  curveVertex(0.3983 * width , 0.4438 * height);
  endShape();  
  resetStroke();
}

void drawWaterTop(){
  // water background top
  fill(149,185,201);
  beginShape();
  curveVertex(0.0 * width , 0.4175 * height);
  curveVertex(0.0 * width , 0.4175 * height);
  curveVertex(0.5383 * width , 0.4 * height);
  curveVertex(1 * width , 0.4012 * height);
  curveVertex(1 * width , 1 * height);
  curveVertex(0.0 * width , 1 * height);
  curveVertex(0.0 * width , 1 * height);
  endShape();
}

void drawWaterBottom(){
  // water background bottom
  fill(107,158,180);
  beginShape();
  curveVertex(0.4967 * width , 0.4262 * height);
  curveVertex(0.4967 * width , 0.4262 * height);
  curveVertex(0.9933 * width , 0.435 * height);
  curveVertex(0.9933 * width , 0.9862 * height);
  curveVertex(0.0117 * width , 0.9888 * height);
  curveVertex(0.0017 * width , 0.45 * height);
  curveVertex(0.0017 * width , 0.45 * height);
  endShape();
}


void drawFrontTrees(){
  // front trees
  fill(13,15,14);
  beginShape();
  curveVertex(1 * width , 0.355 * height);
  curveVertex(1 * width , 0.355 * height);
  curveVertex(0.8767 * width , 0.4325 * height);
  curveVertex(1 * width , 0.4725 * height);
  curveVertex(1 * width , 0.4725 * height);
  endShape();
}

void drawRockTop(){
 // rock top
  fill(223,215,212);
  beginShape();
  curveVertex(0.0 * width , 0.7125 * height);
  curveVertex(0.0 * width , 0.7125 * height);
  curveVertex(0.1683 * width , 0.7012 * height);
  curveVertex(0.605 * width , 0.7338 * height);
  curveVertex(0.6033 * width , 0.7738 * height);
  curveVertex(0.1333 * width , 0.7312 * height);
  curveVertex(0.0017 * width , 0.74 * height);
  curveVertex(0.0017 * width , 0.74 * height);
  endShape(); 
}

void drawRockMiddle(){
  // rock middle
  fill(60,46,45);
  beginShape();
  curveVertex(0.00 * width , 0.7325 * height);
  curveVertex(0.00 * width , 0.7325 * height);
  curveVertex(0.0833 * width , 0.7238 * height);
  curveVertex(0.4633 * width , 0.765 * height);
  curveVertex(0.3433 * width , 0.9425 * height);
  curveVertex(0.0 * width , 0.9388 * height);
  curveVertex(0.0 * width , 0.9388 * height);
  endShape();
}

void drawRockBottom(){
  // rock bottom
  fill(151,138,130);
  beginShape();
  curveVertex(0.1083 * width , 0.7875 * height);
  curveVertex(0.1083 * width , 0.7875 * height);
  curveVertex(0.245 * width , 0.875 * height);
  curveVertex(0.22 * width , 1 * height);
  curveVertex(0.00 * width , 1 * height);
  curveVertex(0.00 * width , 0.8188 * height);
  curveVertex(0.00 * width , 0.8188 * height);
  endShape();
}

void drawRockBottomShaded(){
  // rock bottom shaded
  fill(100,89,83);
  beginShape();
  curveVertex(0.2317 * width , 0.8725 * height);
  curveVertex(0.2317 * width , 0.8725 * height);
  curveVertex(0.09 * width , 0.9312 * height);
  curveVertex(0.03 * width , 1 * height);
  curveVertex(0.1817 * width , 1 * height);
  curveVertex(0.2317 * width , 0.875 * height);
  curveVertex(0.2317 * width , 0.875 * height);
  endShape();
}
