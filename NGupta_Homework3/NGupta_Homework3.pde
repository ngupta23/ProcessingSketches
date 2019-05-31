// Notes:
//   (1) Stars:
//          Uses overloaded polygon function to draw 2 triangles with same center and size
//          Added flickering of stars with transparency feature
//   (2) Shooting Stars
//          Each shooting star has a different starting point, direction and speed
//          Each shooting star has a different age (some last for longer and soe for shorter amount of time
//   (3) Binary Star(s) rotating around each other
//   (4) Spinning stars
//   (5) Statue inspired by https://www.youtube.com/watch?v=7mXjePbxTUk
//          Statue has flickering flame (similar to flickering stars)
//   (6) Dawn and Sunrise after statue has merged
          
int canvasWidth = 1000;
int canvasHeight = 1000;

float portraitAge = 0; // age after statue merges
float waitAfterMerge = 1000; //500; // how long to wait after statue merges to start the dawn
float dawnAge = 0;
float dawnAgeSpeed = 0.25; // How fast does the dawn get over

// Statue
float speed1x = 2.5;
float slabHeightPercent = 0.025; 
float slabHeight = slabHeightPercent * canvasHeight;
float bodyWidthIncrementPercent = 0.0025;
float translation = canvasWidth;

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
int numShootingStars = 100; 
float birthRate = 0.025;
float shootinStarCountCurrent = 0;
float[] xShootingStar = new float[numShootingStars];
float[] yShootingStar = new float[numShootingStars];
float[] xShootingStarSpeed = new float[numShootingStars];
float[] yShootingStarSpeed= new float[numShootingStars];
float[] shootingStarSize = new float[numShootingStars];
float[] maxAge = new float[numShootingStars];
float[] currentAge = new float[numShootingStars];

// Sun
float sunY = 0.9*canvasHeight;

void settings()
{
  size(canvasWidth, canvasHeight);
}

void setup(){
  randomSeed(100);
  setupStars();
  setupBinaryStars();
  setupShootingStars();
}

void draw(){
 drawNightDawnSunRise();
 drawStatue();
 updateXloc();
 updateAgeOfPortrait();
}
