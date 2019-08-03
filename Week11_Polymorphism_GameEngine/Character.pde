/* Base Class */

abstract class Character implements Playable {
  String name;
  int age;
  float force;
  
  Character(){
  }
  
  Character(String name, int age, float force){
    this.name = name;
    this.age = age;
    this.force = force;
  }
  
  abstract void setScore(int score);
  abstract void updateInventory();
  
  abstract void fight();
  
  String[] getInventory(){
    String[] a = {"empty"};
    return(a);
  }
  
  void beReborn(){
    
  }
  
}
