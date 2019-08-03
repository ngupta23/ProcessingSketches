package kernel;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class NGupta_Finals extends PApplet {

/*

Application to Visualize the Cost matrix of an optimization algorithm vs. 2 other variables
Visualization shows the minimum point in the cost matrix and the points at which the minimum occurs

Controls:
RIGHT, LEFT arrow keys  =  Rotate along X-axis
   UP, DOWN arrow keys  =  Rotate along Y-axis
                     +  =  Zoom In
                     -  =  Zoom Out
                     f  =  Move away from the sceen towards the user
                     b  =  Move into the screen away from the user
                     g  =  Toggle Grid
             SPACE BAR  =  Reset Plot
*/

Table table;
Grid grid;
Axes axes;

float rotateX;
float rotateY;
float rotateZ;
float rotationStep;
float scaleFactor;
float scaleStep;
int zDepth;

// Color Scheme
static final int RED    = 0xffFF0000;
static final int ORANGE = 0xffFF7F00;
static final int YELLOW = 0xffFFFF00;
static final int GREEN  = 0xff00FF00; 
static final int BLUE   = 0xff0000FF; 
static final int INDIGO_SUB = 0xffFF00B2;  //#4B0082;
static final int VIOLET = 0xff9400D3;
int[] colors = {RED,ORANGE,YELLOW,GREEN,BLUE,INDIGO_SUB,VIOLET};


float maxCost = -10000000; // low value
float maxXYMag = -10000000; // low value
float minCost = 10000000; // high value
float minCostX;
float minCostY;
float colorSpacing;
int gridOn;
int gridSize = 20;

public void settings(){
  size(600,600,P3D); 
}

public void setup(){
  noStroke(); // If we add noStroke for 3D it turns off lighting as well, hence we need to add lighting effects manually otherwise it is all white (if background id white)
  
  //InputStream input = getClass().getResourceAsStream("cost.csv");
  //println(input);
  
  File directory = new File(".");
  String full_path = directory.getAbsolutePath() + "\\src\\kernel\\cost.csv";
  //System.out.println(directory.getAbsolutePath());
  //println(full_path);
    
  table = loadTable(full_path, "header");
  
  for (TableRow row : table.rows()) {
    float x = row.getFloat("X");
    float y = row.getFloat("Y");
    float z = row.getFloat("Cost");
    
    // Max Cost needed for Colorbar
    if (z > maxCost){ maxCost = z; }
    
    // Min Cost is what user is interested in
    if (z < minCost){ minCostX = x; minCostY = y; minCost = z; }
    
    // Required for sizing the Axes
    if (abs(x) > maxXYMag){ maxXYMag = abs(x); }
    if (abs(y) > maxXYMag){ maxXYMag = abs(y); }
  }
  
  grid = new Grid(this, 2*(ceil(maxXYMag)+1), gridSize);
  axes = new Axes(this);
  
  colorSpacing = maxCost/(colors.length); 
  resetRotationAndZoom();
}

public void draw(){
  background(0);
  lights();
  
  // Static hence placed before translation
  writeTitleAndInfo();
  plotColorBarWithLabels();
  
  translate(width*0.25f, height*0.9f, zDepth);
  plotGridAndAxis();
  plotDataPoints(); 
}

public void keyPressed()
{
  if (key == CODED) {
    if(keyCode == LEFT)  { rotateX = rotateX - rotationStep; }
    else if(keyCode == RIGHT) { rotateX = rotateX + rotationStep; }
    else if(keyCode == UP) { rotateY = rotateY - rotationStep; }
    else if(keyCode == DOWN) { rotateY = rotateY + rotationStep; }
  }

  if(key == '+') { scaleFactor = scaleFactor + scaleStep; } // zoom in 
  else if(key == '-') { scaleFactor = scaleFactor - scaleStep; } // zoom out
  else if(key == ' ') { resetRotationAndZoom(); }
  else if(key == 'g') {gridOn = (gridOn + 1)%2; }
  else if(key == 'b') {zDepth = zDepth - 50; }
  else if(key == 'f') {zDepth = zDepth + 50; }
}

public void plotColorBarWithLabels(){
  int boxWidth = 25;
  plotColorBar(boxWidth);
  plotColorBarLabels(boxWidth);
}


public void plotDataPoints(){
  // Plot Data Points 
  for (TableRow row : table.rows()) {
    float x = row.getFloat("X");
    float y = row.getFloat("Y");
    float z = row.getFloat("Cost");

    int colorOption = PApplet.parseInt(z/colorSpacing) - 1 ;
    noStroke();
    
    // Decide Color
    if (z == minCost){ 
      fill(255);
    } else { 
      fill(colors[colorOption]);
    }
    
    plot3DScatterPlot(x,y,z);
    plotXYContour(x,y,z); //z is still needed to check against MinCost
  }  
}

public void plot3DScatterPlot(float x, float y, float z){
  pushMatrix();
    rotateVariable();
    scale(scaleFactor,scaleFactor,scaleFactor);
    translate(x*gridSize,y*gridSize,z*gridSize); // set default zoom levels (may not be same for all axes)
    if (z == minCost){ 
      sphere(7);
    } else { 
      sphere(3);
    }
  popMatrix();  
}

public void plotXYContour(float x, float y, float z){
  pushMatrix();
    rotateVariable();
    scale(scaleFactor,scaleFactor,scaleFactor);
    translate(x*gridSize,y*gridSize); // set default zoom levels (may not be same for all axes)
    
    if (z == minCost){ 
        ellipse(0,0,15,15);
      } else { 
        ellipse(0,0,5,5);
      }
  popMatrix();  
}

public void writeTitleAndInfo(){
  // Title
  fill(255);
  textAlign(CENTER);
  textSize(24);
  text("3D Scatter Plot and Modified 2D Contour Plot",0.5f* width, 0.05f * height);
  textSize(18);
  text("Min Cost = " + minCost + " @ X = " + minCostX + " and Y = " + minCostY,0.5f* width, 0.95f * height);
}

public void plotGridAndAxis(){
  pushMatrix();
    rotateVariable();
    axes.render(scaleFactor,PI/2,25);
    if (gridOn == 1){
      grid.render(scaleFactor);
    }
  popMatrix();
}


public void plotColorBar(int boxWidth){
  pushMatrix();
    rotateFixed();
    //translate(600,0,150);
    //translate(600,-1600,150);
    translate(width*0.8f,0,-height*0.6f);
   
    for (int i=0; i<colors.length; i++){
      pushMatrix();
        fill(colors[i]);
        box(boxWidth);
      popMatrix();
      translate(0,0,boxWidth);
    }
  popMatrix();
  
  
}

public void plotColorBarLabels(int boxWidth){
  pushMatrix();
    rotateFixed();
    
    textAlign(LEFT);
    translate(width*0.8f,0,-height*0.6f);
    //Color Bar label
    for (int i=0; i<=colors.length; i++){  // <= here since we need an extra text value
      pushMatrix();
        rotateX(-PI/2); // rotate the text so it appears on the XZ plane
        textSize(15);
        fill(255);
        text(i*round(colorSpacing),25,15,00);
      popMatrix();
      translate(0,0,boxWidth);
    }
  popMatrix();    
}

public void resetRotationAndZoom(){
  rotateX = PI/2;
  rotateY = -PI/2;
  rotateZ = PI/2;
  rotationStep = PI/20;
  scaleFactor = 1;
  scaleStep = 0.05f;
  gridOn = 0;
  zDepth = -500;
}

private void rotateFixed(){
  rotateZ(PI/2);
  rotateX(PI/2);
  rotateY(-PI/2);  
}

private void rotateVariable(){
  rotateZ(rotateZ);
  rotateX(rotateX);
  rotateY(rotateY);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "kernel.NGupta_Finals" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
