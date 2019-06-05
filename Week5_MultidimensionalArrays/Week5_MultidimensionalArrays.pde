int rows = 20;
int cols = 30;
int[][] vals2D = new int[rows][cols];

void setup(){
  size(600,400);
  background(0,200,300);
  int colSpan = width/cols;
  int rowSpan = height/rows;
  
  println(vals2D.length); // accesses 1st index
  println(vals2D[0].length); // accesses second index
  
  for (int i=0; i<vals2D.length; i++){ 
    for (int j=0; j<vals2D[i].length; j++){ 
      fill(random(255));
      rect(colSpan*j,rowSpan*i,colSpan,rowSpan);
    }
  }
}
