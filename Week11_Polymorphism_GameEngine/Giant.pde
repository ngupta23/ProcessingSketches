class Giant extends Character{
  Giant(){
    
  }
  
  Giant(String name, int age, float force){
    /*
    this.name = name;
    this.age = age;
    this.force = force;
    */
  }
  
  void fight(){
    println("In Giant.fight");
  }
  
  void setScore(int score){
    println("In Giant.setScore");
  }
  
  void updateInventory(){
    println("In Giant.updateInventory");
  }
  
}
