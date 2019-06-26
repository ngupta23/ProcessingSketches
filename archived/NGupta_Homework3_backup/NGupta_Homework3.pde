// Notes:
//   (1) Stars:
//          Uses overloaded polygon function to draw 2 triangles with same center and size
//          Added flickering of stars with transparency feature
//   (2) Shooting Stars
//          Each shooting star has a different starting point, direction and speed
//          Each shooting star has a different age (some last for longer and soe for shorter amount of time
//   (3) Binary Star(s) rotating around each other
//   (4) Statue inspired by https://www.youtube.com/watch?v=7mXjePbxTUk
//          Statue has flickering flame (similar to flickering stars)
//   (5) Improvements for next version:
//          (1) Instead of moving each element of the statue, group them as much as possible 
//              and move them by updating only the translation (code is easier to maintain)
          
int canvasWidth = 1000;
int canvasHeight = 1000;

// Statue
float speed1x = 2.5;
float slabHeightPercent = 0.025; 
float slabHeight = slabHeightPercent * canvasWidth;
float bodyWidthIncrementPercent = 0.0025;
float[] x = new float[27]; //position of various components of the statue
float initX0; // for stopping critiria for statue movement
float translation = canvasWidth;
float translateArm = -0.08*canvasWidth;

// Stars
float angle = 0;
float speedRot = PI/600;
int numStars = 10;
float[] starSize = new float[numStars];
int[] translateStarX = new int[numStars];
int[] translateStarY = new int[numStars];

// Binary Stars
float binaryAngle = 0;
float binarySpeedRot = PI/360;
int numBinaryStars = 1;
float[] binaryStarSize = new float[numBinaryStars];
int[] translateBinaryStarX = new int[numBinaryStars];
int[] translateBinaryStarY = new int[numBinaryStars];

// Shooting Stars
int numShootingStars = 10000; 
float birthRate = 0.025;
float shootinStarCountCurrent = 0;
float[] xShootingStar = new float[numShootingStars];
float[] yShootingStar = new float[numShootingStars];
float[] xShootingStarSpeed = new float[numShootingStars];
float[] yShootingStarSpeed= new float[numShootingStars];
float[] shootingStarSize = new float[numShootingStars];
float[] maxAge = new float[numShootingStars];
float[] currentAge = new float[numShootingStars];

void settings()
{
  size(canvasWidth, canvasHeight);
}

void setup(){
  randomSeed(100);
  setupStars();
  setupBinaryStars();
  setupShootingStars();
  setupStatue();  
}

void draw(){
 drawBlurBackground();
 drawStars();
 drawBinaryStars();
 drawShootingStars();
 drawStatue();
 //addSquarePixelation(300,300,40);
 updateXloc();
}
