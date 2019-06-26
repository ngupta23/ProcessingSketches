A obj1;
A obj2;

void setup(){
  size(400,400);
  background(255);
  
  obj1 = new A();
  println(obj1);
  
  obj2 = new A();
  println(obj2);
  
  obj1 = obj2;
  println(obj1); // same address as obj2
   
}
