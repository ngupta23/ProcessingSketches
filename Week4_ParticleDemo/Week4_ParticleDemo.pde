int particleCount = 10000;
int[] sideCount = new int[particleCount];
float birthRate = 0.4;
float particleCountCurrent = 0;
float[] x = new float[particleCount];
float[] y = new float[particleCount];
float[] speedX = new float[particleCount];
float[] speedY= new float[particleCount]; 
float[] gravity = new float[particleCount];
float[] radius = new float[particleCount];
float[] damping = new float[particleCount]; // when it hits the ground
float[] friction = new float[particleCount]; // when it is rolling on the ground

void setup(){
 size(1000,800);
 for (int i = 0; i < particleCount; i++){
   sideCount[i] = int(random(3,10));
   //x[i] = random(100,width-100);
   x[i] = width/2;
   //y[i] = random(100,height-100);
   y[i] = 250;
   speedX[i] = random(-2.2,2.2);
   speedY[i] = random(-4,-10);
   radius[i] = random(1,4);
   gravity[i] = 0.09;
   damping[i] = 0.77;
   friction[i] = 0.925;
 }
}

void draw(){
 //background(0);
 // creating our own background with transparency
 fill(0,15); // black with transparency
 noStroke();
 rect(0,0,width,height);
 for (int i=0; i < particleCountCurrent; i++){
   polygon(x[i], y[i], radius[i], sideCount[i], 2, color(65,43,21));
   //polygon(x[i], y[i], radius[i], sideCount[i], 2, color(random(255),random(255),random(255)));
   x[i] += speedX[i];
   speedY[i] = speedY[i] + gravity[i];
   y[i] += speedY[i];
   checkCollisions(i);
 }
 
 if (particleCountCurrent < particleCount - birthRate){
   particleCountCurrent += birthRate;
 }
 
}

void checkCollisions(int i){
  // when you reach with a radius of the edge, you check for collision
  // also when you are drawing, you are shifting by a radius 
  // so it looks like the other edge is hitting the boundary
  if (x[i] > width - radius[i]){
    x[i] = width - radius[i];
    speedX[i] = -speedX[i]; // reverse speed  
  }
  if (x[i] < 0 + radius[i]){
    x[i] = radius[i];
    speedX[i] = -speedX[i]; // reverse speed  
  }
  if (y[i] >= height -radius[i]){
    // to prevent it from falling off 
    // (if it exceeds the height - radius and before it can reverse and come back, 
    // we check again, it will reverse again)
    y[i] = height - radius[i];
    speedY[i] = -speedY[i]; // reverse speed
    speedY[i] *= damping[i]; // take out some energy each time you hit the ground
    speedX[i] *= friction[i]; // when the particle is rolling on the ground
  }
  if (y[i] <= 0 + radius[i]){
    y[i] = radius[i];
    speedY[i] = -speedY[i]; // reverse speed  
  }
}
