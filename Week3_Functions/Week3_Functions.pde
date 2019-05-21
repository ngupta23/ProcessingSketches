void setup(){
 size(400,400);
 background(50,25,5); //brown (sort of orange with small amount of blue
 ellipse(50,50,100,100);
 rect(200,200,100,100); //actually ellipse (our custom function)
 println(getArea(10,20.5));
}

//overrides the default definition in Processing
// void does not return a value
void rect(float x, float y, float w, float h){
  ellipse(x,y,w,h);
}

// must return a value
float getArea(float w, float h){
 return(w * h); 
}
