void setup() {
  size(600,800); // original
  //size(300, 400); // scaled aspect ratio 1
  //size(400,533); // scaled aspect ratio 2
  //size(150, 800); //magic mirror (thin)
  //size(800, 800); //magic mirror (fat)
  
  background(255);
  noStroke();
  
  drawBackground();
  drawPerson();
  drawClothes();  
  addSquarePixelation(300,300,40);
}

void drawBackground(){
  drawRightmostMountain();
  drawMiddleMountain();
  drawMudslide();
  drawBackTrees();
  drawIce();
  drawMountainLeftSecond();
  drawMuddyMountainLeftMost();
  drawWaterTop();
  drawWaterBottom();
  drawFrontTrees();
  drawRockTop();
  drawRockMiddle();
  drawRockBottom();
  drawRockBottomShaded();
}

void drawPerson(){
  drawFace();
  drawHair();
  drawLeftEyebrow();
  drawRightEyebrow();
  drawLeftEye();
  drawRightEye();
  drawLeftEyeball();
  drawRightEyeball();
  drawNose();
  drawTeeth();
  drawUpperLip();
  drawLowerLip();
  drawRightEar();
  drawLeftEar();
  drawNeck();
}

void drawClothes(){
  drawLeftShirt();
  drawRightShirt();
  drawRightCollar();
  drawLeftCollar();
  drawStripe1();
  drawStripe2();
  drawStripe3();
  drawButton();
}
