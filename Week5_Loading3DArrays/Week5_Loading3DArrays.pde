void setup(){
 size(800,800);
 background(255);
 
 int[][] array2D = new int[height][width];
 int[][][] array3D = new int[20][30][10];
 
 
 for(int i=0; i<height; i++){
   for(int j=0; j<width; j++){
     array2D[i][j] = int(random(1000)); 
   }
 }
 
 //println (array3D.length);
 //println (array3D[0].length);
 //println (array3D[0][0].length);
  
 for(int i=0; i<array3D.length; i++){
   for(int j=0; j<array3D[0].length; j++){
     for(int k=0; k<array3D[0][0].length; k++){ 
       array3D[i][j][k] = int(random(1000));
       //println("i: " + i + " j: " + j + " k: " + k + " Value: " + array3D[i][j][k]);
     }
   }
 }
 
}
