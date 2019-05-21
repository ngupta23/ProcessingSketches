void setup(){
 size(600,800);
 background(255,225,255); //pink
 
 int ellipseCount = 400;
 float radius = 30;
 float weight = 1;
 for (int i = 0; i < ellipseCount; i++){
   weight = random(1,5); // random integer from 1 to 5
   strokeWeight(weight);
   noFill();
   float dim = random(radius*2); // local variable to the for loop
   ellipse(random(width), random(height), dim, dim);
   println(dim); // local variable is visible here
 }
 
 // can we see dim here -- no
 //println(dim);
}
