void setup(){
 size(800,800);
 background(255); 
 ellipse(width/2,height/2,5,5);
 createArcs();
 testArgs(2); //passing integer, but expecting float. 
 // This is called casting 
 // Java compiler will convert it to float
 // The other way around does not work.
 
}

void createArcs(){
  arc(width/2,height/2,100,100,0,PI/2); // moves in clockwise direction
}

void testArgs(float val1){
  
}
