

void setup(){
  size(400,400); // Increase from the default sixe of 100x100
  background(160); // GreyScale represented with 1 8 bit number - 0 represents black, 255 is white 
  background(200,100,0); // RGB represented with 3 values
    
  //basicRect();  
  //skewedRect();
  randonRect();
}

void basicRect(){
  rect(10,10,80,80); // Black edge (stroke), White Fill (Default)
  rect(100,100,250,250); 
}
 

void skewedRect(){
  for (int i = 0; i < 50; i++){
    rect(150+i, 150+i,100,100);
  }
}

void randonRect(){
  for (int i = 0; i < 50; i++){
    fill(random(255),random(255),random(255));
    rect(random(300), random(300),random(100),random(100));
  }
}
