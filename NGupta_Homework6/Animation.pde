void drawBackground(){
  for (int i=0; i<numStocks; i++){
    for (int j=0; j<numStocks; j++){
      if (i == j){
        fill(0); // no transparency here
      }
      else if (i > j){ // upper diagonal
        fill(255,0,0,alpha);
      }
      else if (i < j){ // lower diagonal
        fill(0,0,255,alpha);
      }
      rect(i*width/numStocks,j*height/numStocks, width/numStocks,height/numStocks);
    }
  }
  fill(255); 
}

void drawGrid(){
  // Minor Grid
  stroke(0,0,0);
  strokeWeight(2);
  for (int i=0; i<numStocks; i++){
    line(width/(2 * numStocks) * (2*i+1), 0, width/(2 * numStocks) * (2*i+1), height);
    line(0, height/(2 * numStocks) * (2*i+1) , width, height/(2 * numStocks) * (2*i+1));
  }
  
  // Major Grid
  stroke(255,255,0);
  strokeWeight(4);
  for (int i=1; i<numStocks; i++){
    line(width/(numStocks) * i, 0, width/(numStocks) * i, height);
    line(0, height/(numStocks) * i , width, height/(numStocks) * i);
  }
  
  noStroke();  
}

void drawAnimatedScatterplot(){
  // Upper Diagonal (Daily Change)
  for (int i=0; i<numStocks; i++){
    for (int j=0; j<numStocks; j++){
      if (i > j){ // upper diagonal
        scatter[i][j] = new PVector(mappedChange[i],mappedChange[j]);
        // Note -ve sign below for y since we have to move up for +ve stock change)
        // x still has +ve sign since we are moving in the right direction (+ve stock changes moves to the right) 
        ellipse(width/(2*(numStocks))*(2*i+1) + scatter[i][j].x, height/(2*(numStocks))*(2*j+1) - scatter[i][j].y, 48/numStocks, 48/numStocks);
      }
    }
  }
  
  // Lower Diagonal (20 point MA) -- useful for Bollinger's band 
  if (currentIndex >= numPointMA){ // only when buffer has filled up (dont plot MA before that)
    for (int i=0; i<numStocks; i++){
      for (int j=0; j<numStocks; j++){
        if (i < j){ // lower diagonal
          scatter[i][j] = new PVector(mappedMovingAverage[i],mappedMovingAverage[j]);
          // Note -ve sign below for y since we have to move up for +ve stock change)
          // x still has +ve sign since we are moving in the right direction (+ve stock changes moves to the right) 
          ellipse(width/(2*(numStocks))*(2*i+1) + scatter[i][j].x, height/(2*(numStocks))*(2*j+1) - scatter[i][j].y, 48/numStocks, 48/numStocks);
        }
      }
    }
  }
}
