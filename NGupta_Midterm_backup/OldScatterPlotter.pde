class OldScatterPlotter{
  /* ********* 
  ** Fields **
  ************ */
  
  // Data to be ploted
  private String[] tickers = {"VOO","VEU","BND","VNQ"}; // default values
  private int numPointMA;
  private int numStocks;
  private float[] mappedChange;
  private float[] mappedMovingAverage;
  private OldStock[] stocks;
  
  // For Plotting
  private PVector scatter[][];
  private int currentIndex;

  // For refreshing
  private int refreshFreq; // in seconds
  private int ageOfAnimation;
  private int alpha;
  
  private Controller controller;
  
  /* ***************
  ** Constructors **
  ****************** */
  
  OldScatterPlotter(){
    // tickers is already defined by default
    this.numPointMA = 20;
    setSomeFields();
  }
  
  OldScatterPlotter(String[] tickers){
    this.tickers = tickers;
    this.numPointMA = 20;
    setSomeFields();
  }
  
  OldScatterPlotter(String[] tickers, int numPointMA){
    this.tickers = tickers;
    this.numPointMA = numPointMA;
    setSomeFields();
  }
  
  OldScatterPlotter(Controller _control)
  {
    controller = _control;
  }
  
  
  /* ********** 
  ** Methods **
  ************* */
  
  private void setSomeFields(){
    this.refreshFreq = 1;
    this.numStocks = this.tickers.length;
    this.mappedChange = new float[numStocks];
    this.mappedMovingAverage = new float[numStocks];
    this.scatter = new PVector[numStocks][numStocks];
    this.currentIndex = 0;
    this.ageOfAnimation = 0;
    this.alpha = 25;
    
    // define the stock objects
    this.stocks = new OldStock[numStocks];
    for (int i=0; i<numStocks; i++){
      stocks[i] = new OldStock(tickers[i]);  
    }  
  }
  
  void drawAnimation(){
    if (ageOfAnimation % (refreshFreq*60) == 0){
      // Step 1: Background and Grid
      drawBackground();
      drawGrid();    
      
      // Step 2: Stock Price Related
      for (int i=0; i<numStocks; i++){
        float percentChange = stocks[i].getCurrentPricePercentChange();
        mappedChange[i] = map(percentChange,-5,5,-width/(2*(numStocks)),width/(2*(numStocks)));
               
        float movingAverage = stocks[i].getMovingAverage();
        mappedMovingAverage[i] = map(movingAverage,-5,5,-width/(2*(numStocks)),width/(2*(numStocks)));
      }
      currentIndex ++;
      
      // Step 3: Animation
      drawAnimatedScatterplot();
      setTicketText();
    }
  
    ageOfAnimation++;  
  }
  
  
  private void drawBackground(){
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

  private void drawGrid(){
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
  
  private void drawAnimatedScatterplot(){
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
  
  private void setTicketText(){
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
  
  
}
