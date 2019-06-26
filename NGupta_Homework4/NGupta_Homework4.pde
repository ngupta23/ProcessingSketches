//   TITLE: "Celebrating 50 years of LGBTQ+ history"
//
//   Animation Controls:
//     Press 'a' to start the particle animation
//     Press 'p' to pause particle animation (press 'a' again to re-start)
//     Press 'r' to reset to original state
//     Press 'f' to flip colors (red becomed violet, orange becomes indigo, etc). Note this is only for new particles getting ejected. Particles already in the air dont change color.

// NOTES:
//   Particles are affected by gravity
//   Particles have different ages (some last for longer than others) 

PImage img01;
float w;
float h;

float portraitAge = 0; // age after animation starts

void settings(){
  // image taken from https://pride.google/ 
  // (specifically: https://lh3.googleusercontent.com/IkZeIu9cMDBDsiRqREYVucPnwR161PR_SRXKfQkQ8pcyK0_ISDLk--Asmw-n-We8t5y1145mdEIlC1Widl9R2WDpvchBcKSR3AJzyg=w0)
  loadNewImage();
  w = img01.width ;
  h = img01.height;
  size(int(w),int(h));
}

void setup(){
  // add transparency to the image before displaying
  loadPixels();
  for (int i=0; i <img01.pixels.length; i++){
    float r = red(img01.pixels[i]); 
    float g = green(img01.pixels[i]); 
    float b = blue(img01.pixels[i]); 
    img01.pixels[i] = color(r,g,b,10); // Add transparency
  
  }
  updatePixels();
  image(img01,0,0); 
  
  setupParticles();
  
  animate = 0;
  reset = 0;
  particleCountCurrent = 0;
  flip = 0;
}

void loadNewImage(){ img01 = loadImage("LGBTQ.jpg"); }
