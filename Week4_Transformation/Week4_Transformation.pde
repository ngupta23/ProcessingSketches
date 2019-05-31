void setup(){
 size(600,800);
 background(0);
 // Example 1
 //rect(100,100,100,100);
 //rotate(PI/15); // point of rotation is around its origin
 //rect(100,100,100,100);
 //rotate(PI/7);
 //rect(100,100,100,100);
 
 // Good practice is to draw the object at the origin and 
 // then translate the object to where you want it to be.
 
 // cumulative
 pushMatrix();
   translate(width/2, height/2);
   rect(-50,-50,100,100);
   rotate(PI/360*50); // point of rotation is around its origin //<>//
   rect(-50,-50,100,100);
   rotate(PI/360*50);
   rect(-50,-50,100,100);
 popMatrix();
 
 // Overlapping since we are nesting it in push and popMatrix functions
 pushMatrix();
   translate(width/4, height/4);
   rect(-50,-50,100,100);
   pushMatrix();
   rect(-50,-50,100,100);
     pushMatrix();
       rotate(PI/360*50); // point of rotation is around its origin
       rect(-50,-50,100,100);
     popMatrix();
     pushMatrix();  
       rotate(PI/360*50);
       rect(-50,-50,100,100);
     popMatrix();
 popMatrix();
 
}
