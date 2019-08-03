class Elf extends Character{
  Elf(){
    
  }
  
  Elf(String name, int age, float force){
    this.name = name;
    this.age = age;
    this.force = force;
  }
  
  void fight(){
    println("In Elf.fight");
  }
  
  void setScore(int score){
    println("In Elf.setScore");
  }
  
  void updateInventory(){
    println("In Elf.updateInventory");
  }
  
}
