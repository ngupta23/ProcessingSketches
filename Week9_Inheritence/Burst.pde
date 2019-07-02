// Burst is the subclass (since it extends a base class)
class Burst extends Shape{ // Inheritence
  // Fields
  // Has access to all the public and protected fields in the base class. i.e. PVector loc, color fillCol and float radius
  
  float pointRadius; // specific field in the Burst Class only
  
  // Constructor
  Burst(){
    // super class constructor is automatically called (no need to mention it below)
    // But good practice is to make it explicit
    super();
    println("Inside Burst class default constructor");

  }
  
  Burst(PVector loc, color fillCol, float radius, float pointRadius){
    // nothing can be done before super class has been called
    super(loc,fillCol,radius); // calls the super class constructor (must be a constructor in the super class with this signature)
    this.pointRadius = pointRadius;
  }
  
  // methods
  
  // Overrides super class method (since the signature is the same)
  void construct(){
    println("In Burst construct method");
  }
  
}
