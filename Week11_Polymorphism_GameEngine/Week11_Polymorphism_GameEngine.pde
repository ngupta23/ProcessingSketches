Engine e;

void setup(){
  size(400,400);
  
  /* 
  ** Polymorphism ** 
  We instantiate Character class objects, but initialize then as the Elf or Giant Class
  */
    
  Character[] cs = new Character[100]; // this works (can still instantiate an array of that abstract class)
  for(int i=0; i<100; i++){
    if (i%2 == 0){
      cs[i] = new Elf();    
    }
    else{
      cs[i] = new Giant();
    }
  }
  
  e = new Engine(cs);
  
  // new Character(); // This does not work (can not instantiate an object of an abstract class)
  
  Playable p1 = new Elf(); // This is fine.
}
