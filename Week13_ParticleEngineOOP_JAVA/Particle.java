import processing.core.*; // Brings in everything (almost)


class Particle {
  // Fields
  PVector loc;
  PVector velocity;
  float scl;
  PImage p;
  PApplet pa;
  
  // Constructors
  Particle(){
  }
  
  Particle(PApplet pa, PVector loc, PVector velocity, float scl, String particleURL){
    this.loc = loc;
    this.velocity = velocity;
    this.scl = scl;
    this.pa = pa;
    p = pa.loadImage(particleURL);
  }
  
  void move(){
    loc.add(velocity);
  }
  
  void display(){
    pa.pushMatrix();
      pa.translate(loc.x, loc.y);
      pa.scale(scl);
      if (p != null){
        pa.image(p, p.width/2, p.height/2); // centered
      }
      else{
        pa.ellipse(0,0,1,1);  
      }
    pa.popMatrix();
  }
  
}
