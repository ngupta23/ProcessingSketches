
void drawLeftShirt(){
  // Left Shirt
  fill(61,131,97);
  beginShape();
  curveVertex(0.3617 * width , 0.68 * height);
  curveVertex(0.365 * width , 0.6788 * height);
  curveVertex(0.4567 * width , 0.8525 * height);
  curveVertex(0.3733 * width , 0.9962 * height);
  curveVertex(0.1283 * width , 0.9988 * height);
  curveVertex(0.195 * width , 0.7975 * height);
  curveVertex(0.2467 * width , 0.7588 * height);
  curveVertex(0.365 * width , 0.6788 * height);
  endShape();
}

void drawRightShirt(){
  // right shirt
  fill(61,131,97);
  beginShape();
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.7167 * width , 0.5788 * height);
  curveVertex(0.67 * width , 0.7038 * height);
  curveVertex(0.5533 * width , 0.8 * height);
  curveVertex(0.4617 * width , 0.8525 * height);
  curveVertex(0.4117 * width , 0.9688 * height);
  curveVertex(0.3667 * width , height);
  curveVertex(width , height);
  curveVertex(width , 0.7388 * height);
  curveVertex(0.845 * width , 0.6875 * height);
  curveVertex(0.72 * width , 0.5788 * height);
  curveVertex(0.72 * width , 0.5788 * height);
  endShape();
}

void drawRightCollar(){
  // collar right
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.6583 * width , 0.6962 * height);
  curveVertex(0.5567 * width , 0.8025 * height);
  curveVertex(0.7517 * width , 0.8638 * height);
  curveVertex(0.8117 * width , 0.6762 * height);
  curveVertex(0.7183 * width , 0.575 * height);
  curveVertex(0.7183 * width , 0.575 * height);
  endShape();
  resetStroke();
}

void drawLeftCollar(){
  // collar left
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.365 * width , 0.6812 * height);
  curveVertex(0.365 * width , 0.6812 * height);
  curveVertex(0.3017 * width , 0.7825 * height);
  curveVertex(0.44 * width , 0.8188 * height);
  curveVertex(0.365 * width , 0.68 * height);
  curveVertex(0.365 * width , 0.68 * height);
  endShape();
  resetStroke();
}

void drawStripe1(){
  // stripe 1
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.1633 * width , 0.8638 * height);
  curveVertex(0.1633 * width , 0.8638 * height);
  curveVertex(1 * width , 0.9625 * height);
  curveVertex(1 * width , 0.9688 * height);
  curveVertex(0.1633 * width , 0.8725 * height);
  curveVertex(0.1633 * width , 0.8725 * height);
  endShape();
  resetStroke();
}

void drawStripe2(){
  // stripe 2
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.17 * width , 0.9188 * height);
  curveVertex(0.17 * width , 0.9188 * height);
  curveVertex(0.77 * width , 1 * height);
  curveVertex(0.7283 * width , 1 * height);
  curveVertex(0.17 * width , 0.9275 * height);
  curveVertex(0.17 * width , 0.9188 * height);
  curveVertex(0.17 * width , 0.9188 * height);
  endShape();
  resetStroke();
}

void drawStripe3(){
  // stripe 3
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.145 * width , 0.9612 * height);
  curveVertex(0.145 * width , 0.9612 * height);
  curveVertex(0.4 * width , 0.9975 * height);
  curveVertex(0.3633 * width , 0.9988 * height);
  curveVertex(0.1383 * width , 0.9725 * height);
  curveVertex(0.14 * width , 0.9612 * height);
  curveVertex(0.14 * width , 0.9612 * height);
  endShape();
  resetStroke();
}

void drawButton(){
  // button
  fill(82,76,76);
  ellipse(0.4433 * width, 0.915 * height, 0.0333 * width, 0.025 * height);
  fill(46,65,59);
  ellipse(0.4433 * width, 0.915 * height, 0.0167 * width, 0.0125 * height);
}
