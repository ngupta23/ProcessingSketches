int currentSelection;
char currentColor; 
char currentAction; 

void resetSelection(){
  currentSelection = 0; // original image (remains unchanged)
  currentColor = 'n'; // no color selected
  currentAction = 'n'; // no action selected
}

void keyPressed(){
  // which picture to change
  if (key == '1' ) { // Row 1, Column 2
    currentSelection = 1;    
  }
  else if (key == '2'){ // Row 2, Column 1
    currentSelection = 2;
  }
  else if (key == '3'){ // Row 2, Column 2
    currentSelection = 3;
  }
  
  // what color to change
  if (key == 'r' | key == 'R') { // change red
    currentColor = 'r';    
  }
  else if (key == 'g' | key == 'G') { // change green
    currentColor = 'g';    
  }
  else if (key == 'b' | key == 'B') { // change red
    currentColor = 'b';    
  }
  
  // what action to take
  if (key == '+' ) { // increase color
    currentAction = 'p';    
  }
  else if (key == '-'){ // decrease color
    currentAction = 'm';
  }
  
  // reset to original state
  if (key == 'x' | key == 'X'){ 
    settings();
  }
}
