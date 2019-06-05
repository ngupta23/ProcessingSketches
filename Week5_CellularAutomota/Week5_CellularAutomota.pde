// create states
// short cut to fill 2D array
int[][] states = {
  {0,0,0},
  {0,0,1},
  {0,1,0},
  {0,1,1},
  {1,0,0},
  {1,0,1},
  {1,1,0},
  {1,1,1},
};

// create a off state for 000 and 111, and an on state for all oher bit combinations
int[] rules = {0,1,1,1,1,1,1,0};

void setup(){
 size(800,800);
 background(255);
 
 // 1. initialize source bits
 int[][] srcBits = new int[height][width];
 
 for(int i=0; i<height; i++){
   for(int j=0; j<width; j++){
     if (i == height-1 && j == width/2){
       srcBits[i][j] = 1; // middle bottom
     }
     else{
       srcBits[i][j] = 0;
     }
   }
 }
 
 // 2. Update srcBits based on rules and 1D adjacent neighborhood
 
 // For i
 //   - we only go till row 1 at the end since we will be assigning the values for row 0 based on row 1
 //   - more generally, assigning the values of a ror based on the values of the row below it
 //   - even more generally, assigning the values of a pixel based on the values of the 3 pixels below it
 
 // for j
 //   - starts at 1 since and ending at length -1 since we are passing j-1, j and j+1 in the check function 
 //   - do actual checking of rules
 for(int i = srcBits.length-1; i>0; i--){
   for(int j=1; j<srcBits[i].length-1; j++){ 
     int bit = checkNeighborhood(srcBits[i][j-1],srcBits[i][j],srcBits[i][j+1]);
     srcBits[i-1][j] = bit; 
   }
 }
 
 // 3. Display Bits
 loadPixels();
 for(int i=0; i<height; i++){
   for(int j=0; j<width; j++){
     //Pixels is 1D array and we have 2D array srcBits. How do we use it?
     // Using the k variable
     int k = i * width + j;
     if (srcBits[i][j] == 1){
       pixels[k] = color(0); // assign color black if bit is set to 1
     }
   }
 }
 updatePixels();
 
}
