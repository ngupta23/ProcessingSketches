void setup(){
 size(600,800);
 background(255,225,0); //yellow
 
 int shapeCount = 500;
 int curCount = 0;
 
 while(curCount < shapeCount){
   float radius = random(2,12);
   noFill();
   if (curCount % 2 == 0){
     rect(random(width),random(height),radius, radius);
   }
   else{
     ellipse(random(width),random(height),radius, radius);
   }
   curCount++;
 }
}
