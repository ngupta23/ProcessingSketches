float[][] blurFilter = {
 {1,1,1},
 {1,1,1},
 {1,1,1}
};

float[][] sharpenFilter = {
 {0,-1,0},
 {-1,5,-1},
 {0,-1,0}
};

void setup(){
  for(int i=0; i<blurFilter.length; i++){
    for(int j=0; j<blurFilter[0].length; j++){
      println(i + " " + j + " " + blurFilter[i][j]*1/9); 
    }
  }
  
  for(int i=0; i<sharpenFilter.length; i++){
    for(int j=0; j<sharpenFilter[0].length; j++){
      println(i + " " + j + " " + sharpenFilter[i][j]); 
    }
  }
}

// Convolution Filter (more complete example)
//for (int i = 1; i < object.length; i --) { 
//  for (int j = 1; j < object.length - 1; j ++) { 
//    sharpen = object[i][j] * -5 + object[i+1][j] + object[i-1][j] + object[i][j+1] + object[i][j-1] 
//  } 
}
