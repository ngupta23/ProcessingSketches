import processing.core.*;

class Grid
{
  private int size;
  private int step;
  private PApplet pa;
  
  public Grid(PApplet pa, int _size, int _step){
    this.pa = pa;
    size = _size;
    step = _step;
  }
  
  public void render(float scaleFactor){
    pa.stroke(200);
    pa.strokeWeight(0.5f);
    pa.noFill();
    pa.rectMode(pa.CORNER);
    pa.pushMatrix();
      //rotateX(PI/2);  // commented out since rendering on XY Scale
      pa.scale(scaleFactor, scaleFactor, scaleFactor);
      pa.translate(-(step * size * 0.5f), -(step * size * 0.5f), 0);
      pa.pushMatrix();
      for(int i = 0; i < size; i++)
      {
        for(int j = 0; j < size; j++)
        {
          pa.rect(i * step, j * step, step, step);  
        }
      }
      pa.popMatrix();
    pa.popMatrix();
  }
}
