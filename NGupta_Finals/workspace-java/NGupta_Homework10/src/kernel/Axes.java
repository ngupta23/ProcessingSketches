package kernel;
import processing.core.*; 

class Axes{
  
  PApplet pa;
  
  Axes(PApplet pa){
    this.pa = pa;  
  }
  
  public void render(float scaleFactor, float rotate, int textSize){
    int len = 400;
    pa.pushMatrix();
      pa.scale(scaleFactor, scaleFactor, scaleFactor);
      pa.strokeWeight(3);
      pa.stroke(255,0,0);
      pa.line(0,0,0,len,0,0);
      pa.stroke(0,255,0);
      pa.line(0,0,0,0,len,0);
      pa.stroke(0,0,255);
      pa.line(0,0,0,0,0,len);
      pa.strokeWeight(1);
      annotateAxis(rotate, textSize, len);
    pa.popMatrix();    
  }
  
  private void annotateAxis(float rotate, int textSize, int len){
    pa.textSize(textSize);
    pa.pushMatrix();
      pa.rotateX(rotate); // rotate the text so it appears on the XZ plane
      pa.textSize(30);
      pa.text("X",len+25,0,0);
    pa.popMatrix();
    
    pa.pushMatrix();
      pa.translate(0,len+25,0);
      pa.rotateX(-rotate);
      pa.rotateY(rotate*2);
      pa.textSize(18);
      pa.text("Y",0,0,0);
    pa.popMatrix();
    
    pa.pushMatrix();
      pa.translate(-50,0,len+25);
      pa.rotateX(-rotate);
      pa.textSize(30);    
      pa.text("Cost",0,0,0);
    pa.popMatrix();
    
        
      
  }
  
}
