void updateXloc(){
  // only update till the statue merges correctly
  if (x[0] <= translation + initX0 - speed1x){
    for (int i=0; i<5; i+=2){
      x[i] += speed1x;
    }
    for (int i=1; i<5; i+=2){
      x[i] -= speed1x;
    }
    
    for (int i=1; i < 20; i++){
      if (i < 8){
        x[4+i] -= speed1x;
      }
      else{
        x[4+i] += speed1x;
      }
    }
    
    x[25] += speed1x; // left face
    x[26] -= speed1x; // right face
    translateArm += speed1x;
  }  
}
