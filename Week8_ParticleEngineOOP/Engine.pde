class Engine{
  // fields
  Emitter emitter;
  Emitter[] emitters; // not done for now
  float gravity;
  PVector turbulance;
  PVector wind;
  
  // Constructors
  Engine(){ }
  
  Engine(Emitter emitter, float gravity, PVector turbulance, PVector wind){
    this.emitter = emitter;
    this.gravity = gravity;
    this.turbulance = turbulance;
    this.wind = wind;
  }
  
  Engine(Emitter[] emitters){
    this.emitters = emitters;   
  }
  
  void start(){
    emitter.run(gravity, turbulance, wind);
  }
  
  void stop(){  } // not implemented right now
  
}
