int changeAmount = 10;

float[] updateColor(float r, float g, float b){
   // if user requests color to be incremented  
   if (currentAction == 'p'){
     if (currentColor == 'r'){
       r += changeAmount;  
     }
     else if (currentColor == 'g'){
       g += changeAmount;  
     }
     else if (currentColor == 'b'){
       b += changeAmount;  
     }
   }
   
   // if user requests color to be decremented
   if (currentAction == 'm'){
     if (currentColor == 'r'){
       r -= changeAmount;  
     }
     else if (currentColor == 'g'){
       g -= changeAmount;  
     }
     else if (currentColor == 'b'){
       b -= changeAmount;  
     }
   }
   
   // Bound updated values to be between 0 and 255
   // This will ensure that after the color has reached the max (or min value), 
   // any further change in the opposite direction will take effect immediately.
   r = constrain(r, 0, 255);
   g = constrain(g, 0, 255);
   b = constrain(b, 0, 255);
      
   float[] retVal = {r,g,b};
   return (retVal);
}
