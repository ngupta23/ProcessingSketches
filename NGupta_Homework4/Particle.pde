int particleCount = 10000;
int[] sideCount = new int[particleCount];
float birthRate = 0.5;
float particleCountCurrent;
float[] x = new float[particleCount];
float[] y = new float[particleCount];
float[] speedX = new float[particleCount];
float[] speedY= new float[particleCount]; 
float[] gravity = new float[particleCount];
float[] radius = new float[particleCount];
float[] maxAge = new float[particleCount];
float[] currentAge = new float[particleCount];

color[] particleColor = new color[particleCount];

static final int RED    = #FF0000;
static final int ORANGE = #FF7F00;
static final int YELLOW = #FFFF00;
static final int GREEN  = #00FF00; 
static final int BLUE   = #0000FF; 
static final int INDIGO = #4B0082;
static final int VIOLET = #9400D3;

int animate;
int reset;
int flip;

void setupParticles(){
  
 for (int i = 0; i < particleCount; i++){
   sideCount[i] = 360;
   x[i] = width/2;
   y[i] = height*0.825;
   
   speedY[i] = -11; 
   radius[i] = random(1,4);
   gravity[i] = 0.09;
   
   if (i%7 == 0){
     speedX[i] = random(-3.5,-2.5);
   }
   else if (i%7 == 1){
     speedX[i] = random(-2.5,-1.5);
   }
   else if (i%7 == 2){
     speedX[i] = random(-1.5,-0.5);
   }
   else if (i%7 == 3){
     speedX[i] = random(-0.5,0.5);
   } 
   else if (i%7 == 4){
     speedX[i] = random(0.5,1.5);
   }
   else if (i%7 == 5){
     speedX[i] = random(1.5,2.5);
   }
   else if (i%7 == 6){
     speedX[i] = random(2.5,3.5);
   }
 }
 
 setupColors();
 resetParticleAge();
 
}  
  
void setupColors(){
  for (int i = int(particleCountCurrent); i < particleCount; i++){ // flip color of only new particles (not ones that are already in the air)
    if (i%7 == 0){
      if (flip == 0){
        particleColor[i] = RED;
      }
      else if (flip == 1){
        particleColor[i] = VIOLET;
      }
    }
    else if (i%7 == 1){
      if (flip == 0){
        particleColor[i] = ORANGE;
      }
      else if (flip == 1){
        particleColor[i] = INDIGO;
      }
    }
    else if (i%7 == 2){
      if (flip == 0){
        particleColor[i] = YELLOW;
      }
      else if (flip == 1){
        particleColor[i] = BLUE;
      }
    }
    else if (i%7 == 3){
      if (flip == 0){
        particleColor[i] = GREEN;
      }
      else if (flip == 1){
        particleColor[i] = GREEN;
      }
    } 
    else if (i%7 == 4){
      if (flip == 0){
        particleColor[i] = BLUE;
      }
      else if (flip == 1){
        particleColor[i] = YELLOW;
      }
    }
    else if (i%7 == 5){
      if (flip == 0){
        particleColor[i] = INDIGO;
      }
      else if (flip == 1){
        particleColor[i] = ORANGE;
      }
    }
    else if (i%7 == 6){
      if (flip == 0){
        particleColor[i] = VIOLET;
      }
      else if (flip == 1){
        particleColor[i] = RED;
      }
    }
  }
  
}

void updateAgeOfPortrait(){ portraitAge += 1; }

void resetAgeOfPortrait(){ portraitAge = 0; }

void resetParticleAge(){
  for (int i = 0; i < particleCount; i++){
    maxAge[i] = random(0,200);
    currentAge[i] = 0;
  }   
}
