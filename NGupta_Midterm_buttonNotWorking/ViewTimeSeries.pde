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
  }
  
  void setup() {
     f = createFont("Arial",16,true);
     surface.setTitle("Streaming Time Series Data");
  }
  
  public void draw(){
    
    if (ageOfAnimation % (refreshFreq*60) == 0){
    //if(controller.getIsJustUpdated()){
      
      // Step 1: Background and Grid
      drawBackground();
      drawGrid();
      
      setLabels();

      
      /* Plot all Points - Note index goes up to last point */
      if (currentIndex >= numPointMA){ // only when buffer has filled up (dont plot before that)
        for(int i=0; i<priceHistories.length; i++){ // For all stocks 
          if (selectedTickers[i]){
            for (int j=0; j< priceHistories[i].length; j++){ // Plot all points in the buffer
              fill(colors[i]);
              pushMatrix();
                translate(0.1* width,0.9*height);
                ellipse(j*(0.9*width)/priceHistories[i].length,- mapValuesToYAxis(priceHistories[i][j]),7,7);
              popMatrix();
            }
          }
        }
        
        /* Plot Lines connecting points - Note index goes up to last - 1 point since we are connecting between points */
        for(int i=0; i<priceHistories.length; i++){ 
          if (selectedTickers[i]){
            for (int j=0; j< priceHistories[i].length-1; j++){  
              pushMatrix();
                translate(0.1* width,0.9*height);
                stroke(colors[i]);
                strokeWeight(3);
                line(j*(0.9*width)/priceHistories[i].length,- mapValuesToYAxis(priceHistories[i][j]),
                     (j+1)*(0.9*width)/priceHistories[i].length,- mapValuesToYAxis(priceHistories[i][j+1])
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
    float mappedVal = map(price,0,500,0,height*0.9);
    return(mappedVal);
    
  }
  
  private void drawBackground(){
    fill(0);
    rect(0,0, width,height);
  }

  private void drawGrid(){
    stroke(255);
    strokeWeight(5);
    
    pushMatrix();
      translate(0.1* width,0.9*height);
      line(0, 0, width, 0); // X-axis
      line(0, 0, 0, -height); // Y-axis
    popMatrix();
    
    // reset for rest of the program
    noStroke();
    strokeWeight(1);
  }
  
}
