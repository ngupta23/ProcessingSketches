/* 2nd degree polynomial
y = 2x2 -3x + 19;
curve fits within the display window
*/

size(200,200);
background(255);
strokeWeight(3);
float x=0, y=0;
int loopLimit=100;

/* 
for scaling the curve to the window, we use ratio
ratio is calculated based on the maximum value that the curve can take based on loopLimit
*/
float ratio = height/(2*pow(loopLimit-1,2) - 3*loopLimit-1 + 19); 
for (int i=0; i<loopLimit; i++){
  x = i;
  y = 2 * pow(x,2) - 3*x + 19;
  point(x,y*ratio); // point implementation instead of line so we dont get a smooth line
}
