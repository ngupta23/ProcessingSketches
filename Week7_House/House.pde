class House{
 // fields
 Door door;
 Door[] doors;
 Staircase stairs;
 Window[] windows;
  
 // Constructor 
 House(){
   door = new Door();
   stairs = new Staircase();
 }
 
 // Overloaded Constructors
 House(Door[] doors, Staircase stairs, Window[] windows){
   this.doors = doors;
   this.stairs = stairs;
   this.windows = windows;
 }
 
 // methods
 void construct(){
   // pseudo code
   // in loop
   // doors[i].construct();
   // stairs.construct();
 }
 
  
}
