PFont f;  

void setTicketText(){
  int fontSize;
  
  fill(255);       
  
  for (int i=0; i<numStocks; i++){
    for (int j=0; j<numStocks; j++){
      if (i == j){
        fontSize = 250/numStocks;
        textFont(f,fontSize);
        
        textAlign(CENTER);
        text(tickers[i],width/(2*numStocks)*(2*i+1),height/(2*numStocks)*(2*j+1)+fontSize/2.5);
        
        fontSize = 80/numStocks;
        textFont(f,fontSize);
        
        textAlign(RIGHT);
        text("% Change",width/(numStocks)*(i+1)-10,height/(numStocks)*(j)+20);
        
        textAlign(LEFT);
        text(numPointMA + " point MA",width/(numStocks)*(i)+10,height/(numStocks)*(j+1)-10);
      }
    }
  }
}
