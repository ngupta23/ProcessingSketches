/*
PROBLEM STATEMENT: 
It is hard to compare images after making several independent changes. Usually user has to keep going 
back and forth between images. For example, applying different filters to an image on a phone and 
comparing which one looks best requires user to keep scroling back and forth.

SOLUTION:
This app lets the user make updates to 3 images at a time and simultaneously compare with the original image 

CONTROLS:
(1) Press 1, 2, or 3 to select the image to manipulate
(2) Press r, g, or b to select the color to manipulate
(3) Press + or - to increase or decrease the selected color
(4) Press x to reset images

NOTES: 
(1) Control steps 1, 2 and 3 are additive (i.e. previous image changes are remembered until user resets the sketch)
(2) The code bounds the color components to be between 0 and 255. This will ensure that after the color has 
    reached the max (or min value), any further change in the opposite direction will take effect immediately.
    
Future Enhancements to application:
(1) Add more filter options, including sharpen, blur, etc.
(2) Add ability to just click on the image that needs to be updated instead of selecting with numbers
(3) Add ability to add more images to compare
(4) Add ability to automatically resize the image while loading so it suports images with different sizes
(5) Report back to the user how much cumulative color (and which components) has been added or subtracted from each image
*/

PImage [][] img = new PImage[2][2];
float w;
float h;

void setup() {
  f = createFont("Arial",16,true); 
}

void settings(){
  for (int i=0; i<2; i++){
    for (int j=0; j<2; j++){
      img[i][j] = loadImage("Headshot_resized2.jpg"); // comes from data directory in this sketch 
    }
  }
 
  w = img[0][0].width;
  h = img[0][0].height;
  size(int(w*2),int(h*2.5)); //extra margin for text to be added
  
  resetSelection();
}

void draw(){
  background(0); //<>//
  loadPixels(); 
  
  // Update the Selected Image
  for (int i=0; i < img[0][1].pixels.length; i++){ //<>//
    // Extract the pixel color for the selected image
    float r = red(img[currentSelection/2][currentSelection%2].pixels[i]); // extracts the red compnent of the pixes;
    float g = green(img[currentSelection/2][currentSelection%2].pixels[i]); 
    float b = blue(img[currentSelection/2][currentSelection%2].pixels[i]); 
   
    // Change the color based on user input
    float[] newColor = updateColor(r,g,b);
   
    // Update the pixels of the selected image
    img[currentSelection/2][currentSelection%2].pixels[i] = color(newColor[0],newColor[1],newColor[2]);
  }
  
  currentAction = 'n'; // reset so it does not keep changing the color
    
  // redraw images
  for (int i=0; i<2; i++){
    for (int j=0; j<2; j++){
      img[i][j].updatePixels();
      image(img[i][j],j*img[i][j].width,i*img[i][j].height); // need to redraw the image otherwise we dont see the updates
    }
  }
  
  setImageOrderText();
  setInstructionalText();
}
