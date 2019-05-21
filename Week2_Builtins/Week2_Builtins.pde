// Scope - Global or Local
float tempToday; // Global variable, accessible everywhere
// Global variables are assigned a 0 value if not initialized
// Local variables are not initialized and will give error if they are accessed without assigning the value

// setup function is called automatically when the program is run
void setup(){
  println(tempToday); // prints 0 since this is a global variable that has not been initialized
}

// 'draw' runs ~ 60 times per second (used to create animation) forever (till the program stops)
void draw(){
  //println(tempToday);
}

int i = 1;

// event functions
// executes when we press the mouse on the drawn window
void mousePressed(){
  println(i);
  i = i + 1 ;
  drawTriangle();
}

void drawTriangle(){
 triangle(random(100),random(100),random(100),random(100),0,50); 
}
