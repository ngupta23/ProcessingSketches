class Cat {
  // properties or attributes or fields
  float wt;
  String breed;
  boolean isLongHaired;
  int age;
  
  // default constructor (no parameters)
  Cat(){
    
  }
  
  // overloaded constructors
  // note no return time.
  Cat(float wt, String breed){
    this.wt = wt;
    this.breed = breed;
  }
  
  Cat(float wt, String breed, boolean isLongHaired, int age){
    this.wt = wt;
    this.breed = breed;
    this.isLongHaired = isLongHaired;
    this.age = age;
  }
  
  // general methods 
  void move(){
   
  }
  
  void eat(){
    
  }
  
  void speak(){
    
  }
  
  // getters and setters
  void setWt(float wt){
    this.wt = wt;  
  }
  
  float getWt(){ 
    return (this.wt);
  }
}
