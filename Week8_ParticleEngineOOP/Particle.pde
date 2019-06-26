class Particle {
  // Fields
  PVector loc;
  PVector velocity;
  float scl;
  PImage p;
  
  // Constructors
  Particle(){
  }
  
  Particle(PVector loc, PVector velocity, float scl, String particleURL){
    this.loc = loc;
    this.velocity = velocity;
    this.scl = scl;
    p = loadImage(particleURL);
  }
  
  void move(){
    loc.add(velocity);
  }
  
  void display(){
    pushMatrix();
      translate(loc.x, loc.y);
      scale(scl);
      if (p != null){
        image(p, p.width/2, p.height/2); // centered
      }
      else{
        ellipse(0,0,1,1);  
      }
    popMatrix();
  }
  
}
