Engine engine;

void setup(){
  size(800,800);  
  // Emitter(PVector loc, int particleCount,  float particleBirthRate, PVector sprayVector, float sprayRadius, boolean isInfinite, String particleURL, float particleScale)
  Emitter emitter = new Emitter(new PVector(width/2, 200), 300, 1, new PVector(0.01,-10.2), 1.25, true, "particleImage.jpg",0.00001);
  
  // Engine(Emitter emitter, float gravity, PVector turbulance, PVector wind)
  engine  = new Engine(emitter, 1.15, new PVector(0.5,0.5), new PVector(0.002, -0.7));
}

void draw(){
  fill(255,175);
  rect(-1,-1,width+1,height+1);
  engine.start();
}
