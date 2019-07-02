// Super Class (Base class)
class Shape{
  // Fields 
  PVector loc;
  color fillCol;
  float radius;
  
  // Constructors
  Shape(){
    println("Inside Shape class default constructor");
  }
  
  Shape(PVector loc, color fillCol, float radius){
    this.loc = loc;
    this.fillCol = fillCol;
    this.radius = radius;
  }
  
  // methods
  
  void construct(){
    println("In Shape construct method. This will be completed in the sub class");
  }
  
  void move(){
    println("In Shape move method");
  }
  
  void display(){
    println("In Shape display method");
  }
  
  
}
