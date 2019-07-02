class ViewTimeSeries extends PApplet{
  
  private static final int VIEW_WIDTH = 800;
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
  private color[] colors;
   
  /* ***************
  ** Constructors **
  ****************** */
  
  public ViewTimeSeries(Controller _control){
    controller = _control;
    numPointMA = controller.getNumPointMA();
    tickers = controller.getTickers();
    priceHistories = new float[tickers.length][numPointMA];
       
    setColors();
    setSomeFields();
    
    if (glDebug >=2){
      println ("Inside ViewTimeSeries Controller Constructor");
      for (int i=0; i < tickers.length; i++){
        println(tickers[i]);
      }
    }
        
  }
  
  /* *************************************
  ** Settings, Setup and Draw Functions **
  **************************************** */
  
  public void settings(){
    this.size(VIEW_WIDTH, VIEW_HEIGHT);
  }
  
  public void draw(){
    if (ageOfAnimation % (refreshFreq*60) == 0){
    //if(controller.getIsJustUpdated()){
      
      // Step 1: Background and Grid
      drawBackground();
      drawGrid();
      
      /* Plot all Points - Note index goes up to last point */
      if (currentIndex >= numPointMA){ // only when buffer has filled up (dont plot before that)
        for(int i=0; i<priceHistories.length; i++){ // For all stocks 
          for (int j=0; j< priceHistories[i].length; j++){ // Plot all points in the buffer
            fill(colors[i]);
            pushMatrix();
              translate(0.1* width,0.9*height);
              ellipse(j*(0.9*width)/priceHistories[i].length,- mapValuesToYAxis(priceHistories[i][j]),7,7);
            popMatrix();
          }
        }
        
        /* Plot Lines connecting points - Note index goes up to last - 1 point since we are connecting between points */
        for(int i=0; i<priceHistories.length; i++){ 
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
      //println ("*************** Inside Time Series Draw >> Age of Animation : " + ageOfAnimation);
      
    }
    
    //println("Inside Time Series Draw " + controller.getIsJustUpdated());
    ageOfAnimation++;    

    
  }
  
  /* ****************** 
  ** Public Methods **
  ********************* */
  
  void updateViewValues(float[][] priceHistories){
    for (int i=0; i< priceHistories.length; i++){
      if (glDebug >= 2){
        println("Inside ViewTimeSeries >> New Stock Price");
        for (int j=0; j< priceHistories[i].length; j++){
          print(priceHistories[i][j] + " ");  
        }
        println("");
      }
    }
    // Update code to plot the results
    
    this.priceHistories = priceHistories;
    currentIndex ++;
    
  }
  
  /* ****************** 
  ** Private Methods **
  ********************* */
  
  private void setSomeFields(){
    //print ("ViewScatterPlotter >> Set Some Fields");
    this.refreshFreq = 1;
    this.currentIndex = 0;
    this.ageOfAnimation = 0;
  }
  
  private void setColors(){
    colors = new color[tickers.length];
    for(int i=0; i<tickers.length; i++){
        colors[i] = color (random(60,255), random(60,255), random(60,255));  
    }  
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
