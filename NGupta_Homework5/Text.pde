PFont f;  

void setImageOrderText(){
  textAlign(CENTER);
  textFont(f,20);                  
  fill(255,127,0);       
  text("Image Order",width/4,img[0][0].height*2.05);
  textFont(f,16);                  
  fill(255);  
  textAlign(LEFT);
  text("Row 1, Column 1 = Image 0 (Original)",width * 0.025,img[0][0].height*2.10);
  text("Row 1, Column 2 = Image 1",width * 0.025,img[0][0].height*2.15);
  text("Row 2, Column 1 = Image 2",width * 0.025,img[0][0].height*2.20);
  text("Row 2, Column 2 = Image 3",width * 0.025,img[0][0].height*2.25);
}


void setInstructionalText(){
  textAlign(CENTER);
  textFont(f,20);                  
  fill(255,127,0); 
  text("Instructions",width*3/4,img[0][0].height*2.05);
  textAlign(LEFT);
  textFont(f,16);                  
  fill(255);
  textLeading(20);  
  text("(1) Press 1, 2, or 3 to select the image \n      to manipulate\n(2) Press r, g, or b to select the color \n      to manipulate\n(3) Press + or - to increase or \n      decrease the selected color\n(4) Press x to reset images"
  ,width * 0.525,img[0][0].height*2.10);
}
