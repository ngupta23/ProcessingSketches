class ViewTimeSeries extends PApplet{
  
  private static final int VIEW_WIDTH = 400;
  private static final int VIEW_HEIGHT = 800;
  
  private Controller controller;
  private String[] tickers;
  private int numPointMA;
  private float[][] priceHistories;
  
  // For refreshing
  private int refreshFreq; // in seconds
  private int ageOfAnimation;
    
  // For plotting
  private int currentIndex;
  
  private int numStocks;
  boolean[] selectedTickers;
  
  // For text
  private PFont f;
  
  // For translating the grid and plots
  float translateY = 0.9*height;
  float translateX = 0.15*width;
  
  /* ***************
  ** Constructors **
  ****************** */
  
  public ViewTimeSeries(Controller _control){
    controller = _control;
    numPointMA = controller.getNumPointMA();
    tickers = controller.getTickers();
    numStocks = tickers.length;
    priceHistories = new float[numStocks][numPointMA];
       
    setSomeFields();
           
  }
  
  /* *************************************
  ** Settings, Setup and Draw Functions **
  **************************************** */
  
  public void settings(){
    this.size(VIEW_WIDTH, VIEW_HEIGHT);
    this.translateY = 0.9*height;
    this.translateX = 0.15*width;
  }
  
  void setup() {
     f = createFont("Arial",16,true);
     surface.setTitle("Streaming Time Series Data");
  }
  
  public void draw(){
    
    if (ageOfAnimation % (refreshFreq*60) == 0){
      // Step 1: Background and Grid
      drawBackground();
      drawGrid();
      setLabels();
      
      // Step 2: Draw Time Series
      drawTimeSeries();
      
    }
    
    ageOfAnimation++;    

    
  }
  
  /* ****************** 
  ** Public Methods **
  ********************* */
  
  void updateViewValues(boolean[] selectedTickers, float[][] priceHistories){
    for (int i=0; i< priceHistories.length; i++){
      if (glDebug >= 2){
        println("Inside ViewTimeSeries >> New Stock Price");
        for (int j=0; j< priceHistories[i].length; j++){
          print(priceHistories[i][j] + " ");  
        }
        println("");
      }
    }
   
    this.selectedTickers = selectedTickers;
    this.priceHistories = priceHistories;
    currentIndex ++;
    
  }
  
  /* ****************** 
  ** Private Methods **
  ********************* */
  
  private void setSomeFields(){
    this.refreshFreq = 1;
    this.currentIndex = 0;
    this.ageOfAnimation = 0;
    
       
    this.selectedTickers = new boolean[numStocks];
    
    // Select all tickers by default
    for (int i=0; i<numStocks; i++){
      selectedTickers[i] = true;
    }
  }
  
  private void setLabels(){
    int fontSize = 80/numStocks;
    textFont(f,fontSize);
    
    pushMatrix();
      translate(0.75*width,0.05*height); // right corner
      for(int i=0; i<numStocks; i++){
        if (selectedTickers[i]){
          // For line
          stroke(colors[i]); 
          strokeWeight(5); 
          line(10,20*i,30,20*i);
          
          // For text
          textAlign(LEFT); 
          fill(colors[i]); 
          text(tickers[i],40,20*i); 
        }
      }
    popMatrix();
    
    // reset for rest of the program
    noStroke();
    strokeWeight(1);
   
  }
  
  private float mapValuesToYAxis(float price){
    float mappedVal = map(price,0,500,0,translateY);
    return(mappedVal);
  }
  
  private void drawBackground(){
    fill(0);
    rect(0,0, width,height);
  }

  private void drawGrid(){
    stroke(255);
    strokeWeight(5);
    
    int fontSize = 80/numStocks;
    textFont(f,fontSize);
    fill(255); 
    
    // For Grid
    int yRange = 500;
    int xRange = numPointMA;
      
    float majorYGridInterval = translateY/10; // fixed to 10 major ticks
    float majorXGridInterval = (width - translateX)/xRange; // based on number of MA points
       
    pushMatrix();
      translate(translateX,translateY);
      line(0, 0, width, 0); // X-axis
      line(0, 0, 0, -height); // Y-axis
      text("Time ",(width-2*translateX)/2, (height-translateY)*3/4);
      
      // Major ticks Y-axis
      for (int i=0; i<10; i++){
        ellipse(0, -i*majorYGridInterval, 5, 5);
        textAlign(RIGHT);
        text(i*yRange/10,-width/20, -i*majorYGridInterval);
      }
      
      // Major ticks X-axis
      for (int i=0; i<xRange; i++){
        ellipse(i*majorXGridInterval, 0, 5, 5);
        textAlign(LEFT);
        if (i < xRange -1){
          text((i+1-xRange), (i-0.5)*majorXGridInterval,(height - translateY)*2/5);
        }
        else{
          //last entry
          text("Now", (i-0.5)*majorXGridInterval,(height - translateY)*2/5);
        }  
      }
    popMatrix();
    
    // reset for rest of the program
    noStroke();
    strokeWeight(1);
  }
  
  private void drawTimeSeries(){
    /* Plot all Points - Note index goes up to last point */
    if (currentIndex >= numPointMA){ // only when buffer has filled up (dont plot before that)
      for(int i=0; i<priceHistories.length; i++){ // For all stocks 
        if (selectedTickers[i]){
          for (int j=0; j< priceHistories[i].length; j++){ // Plot all points in the buffer
            fill(colors[i]);
            pushMatrix();
              translate(translateX,translateY);
              ellipse(j*(width-translateX)/priceHistories[i].length,- mapValuesToYAxis(priceHistories[i][j]),7,7);
            popMatrix();
          }
        }
      }
      
      /* Plot Lines connecting points - Note index goes up to last - 1 point since we are connecting between points */
      for(int i=0; i<priceHistories.length; i++){ 
        if (selectedTickers[i]){
          for (int j=0; j< priceHistories[i].length-1; j++){  
            pushMatrix();
              translate(translateX,translateY);
              stroke(colors[i]);
              strokeWeight(3);
              line(j*(width-translateX)/priceHistories[i].length,- mapValuesToYAxis(priceHistories[i][j]),
                   (j+1)*(width-translateX)/priceHistories[i].length,- mapValuesToYAxis(priceHistories[i][j+1])
                  );
              // Reset Stroke 
              strokeWeight(1);
              noStroke();
              
            popMatrix();
          }
        }
      }
    }  
  }
  
   
}
