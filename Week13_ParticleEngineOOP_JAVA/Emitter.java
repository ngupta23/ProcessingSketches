/* Added since we changes the Processing class to a JAVA class */

import processing.core.*; // Brings in everyrhing (almost)


class Emitter{
  // Fields
  PVector loc;
  int particleCount;
  float particleBirthRate;
  PVector sprayVector;
  float sprayRadius;
  boolean isInfinite = false;
  
  // 
  Particle[] particles;
  float currentParticleCount = 0;
  String particleURL;
  float particleScale = 1;
  PApplet p;
  
  // Constructors
  Emitter(){
  }
  
  Emitter(PVector loc, int particleCount,  float particleBirthRate, PVector sprayVector, float sprayRadius, boolean isInfinite){
    this.loc = loc;  
    this.particleCount = particleCount;
    this.particleBirthRate = particleBirthRate;
    this.sprayVector = sprayVector;
    this.sprayRadius = sprayRadius;
    this.isInfinite = isInfinite;
    
    particles = new Particle[particleCount];
    init();
  }
  
  Emitter(PApplet p, PVector loc, int particleCount,  float particleBirthRate, PVector sprayVector, float sprayRadius, boolean isInfinite,
    String particleURL, float particleScale){

    this.loc = loc;
    this.p = p;
    this.particleCount = particleCount;
    this.particleBirthRate = particleBirthRate;
    this.sprayVector = sprayVector;
    this.sprayRadius = sprayRadius;
    this.isInfinite = isInfinite;
    this.particleURL = particleURL;
    this.particleScale = particleScale;
    
    particles = new Particle[particleCount];
    init();
  }
  
  void init(){
    for (int i=0; i < particles.length; i++){
      float scl = p.random(1,particleScale);
      //Particle(PVector loc, PVector velocity, float scl, String particleURL) // signature
      PVector vel = new PVector(sprayVector.x + p.random(-sprayRadius, sprayRadius), 
                                sprayVector.y + p.random(-sprayRadius, sprayRadius));  
      particles[i] = new Particle(p, new PVector(loc.x, loc.y), vel, scl, particleURL);
      // Important to note that for loc argument, we are not passing loc directly since it would be the memory location to the loc variable.
      // Instead we are creating a new object each time so we dont use meory of loc variable each time
    }
  }
  
  void run(float gravity, PVector turbulance, PVector wind){
    for (int i=0; i<currentParticleCount; i++){
      particles[i].velocity.y += gravity;
      particles[i].velocity.add(new PVector(p.random(-turbulance.x, turbulance.x), p.random(-turbulance.y, turbulance.y))); 
      // again new PVector above since we dont want to share the turbulance between particles (that will happen if we pass turbulance directly)
      particles[i].velocity.add(wind);
      particles[i].move();
      particles[i].display();
      
      // reset particles
      if (isInfinite){
        if (particles[i].loc.y > p.height || particles[i].loc.x > p.width || particles[i].loc.x < 0){
          particles[i].loc = new PVector(loc.x,loc.y); // original nozzle
          particles[i].velocity = new PVector(sprayVector.x + p.random(-sprayRadius, sprayRadius),
                                              sprayVector.x + p.random(-sprayRadius, sprayRadius));  
        }
      }
    }
    if (currentParticleCount <particleCount-particleBirthRate){
      currentParticleCount += particleBirthRate;  
    }
  }
  
  

}
