class ViewStockCompare extends PApplet{
  
  private static final int VIEW_WIDTH = 700;
  private static final int VIEW_HEIGHT = 800;
  
  private Controller controller;
  private String[] tickers; 
  private int numStocks;
  
  boolean[] selectedTickers;
  
  // Data for plotting
  String[] companyNames;
  float[] openPrices;
  float[] closePrices;
  float[] highPrices;
  float[] lowPrices;
  float[] previousClosePrices;
  float[] changePrices;
  float[] changePercentages;
  float[] week52Highs;
  float[] week52Lows;
  float[] ytdChanges;
  
  // For text
  private PFont f;
  
  /* ***************
  ** Constructors **
  ****************** */
  
  public ViewStockCompare(Controller _control)
  {
    controller = _control;
    tickers = controller.getTickers();
    numStocks = tickers.length;
    
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
     surface.setTitle("Stock Coparison");
  }
  
  public void draw(){
    background(0); 
    int fontSize;
    int numStocks = tickers.length;
    
    fontSize = 80/numStocks;
    textFont(f,fontSize);
    textAlign(RIGHT);
    fill(255);
    int numDataDisplay = 11; // number of data itens displayed, i.e. number of rows of data (including header for tickers)
    float firstColWidth = 1.5; // expressed in terms of a multiplier based on number of stocks, i.e. 1.5 means first column width is same as that taken up by that of 1.5 stocks
    float height_multiplier = height / numDataDisplay;
    
    text("Ticker ",width/(numStocks+1),height_multiplier*0.5);
    text("Open ",width/(numStocks+1),height_multiplier*1.5);
    text("Close ",width/(numStocks+1),height_multiplier*2.5);
    text("High ",width/(numStocks+1),height_multiplier*3.5);
    text("Low ",width/(numStocks+1),height_multiplier*4.5);
    text("Previous Close ",width/(numStocks+1),height_multiplier*5.5);
    text("52 week High ",width/(numStocks+1),height_multiplier*6.5);
    text("52 week Low ",width/(numStocks+1),height_multiplier*7.5);
    text("Change ",width/(numStocks+1),height_multiplier*8.5);
    text("Change % ",width/(numStocks+1),height_multiplier*9.5);
    text("YTD Change ",width/(numStocks+1),height_multiplier*10.5);
    
    for(int i=0; i<numStocks; i++){ // For all stocks
      if (selectedTickers[i]){
        fontSize = 75/numStocks;
        textFont(f,fontSize);
        textAlign(CENTER);
               
        float half_column_width = width/(2*(numStocks+firstColWidth));
        float width_center = half_column_width*(2*(i+1)+firstColWidth); // Starting from center of column 
        float width_left = width_center-half_column_width; // Starting from left of column
        
        fill(colors[i]);
        text(this.tickers[i],width_center,height_multiplier*0.5);
        
        //text(this.companyNames[i],width_center,height_multiplier*0.5); // Future Enhancement (requires wrapping of text)
        
        fill(colors[i]); // stock corresponding color for text
        text(this.openPrices[i],width_center,height_multiplier*1.35);
        text(this.closePrices[i],width_center,height_multiplier*2.35);
        text(this.highPrices[i],width_center,height_multiplier*3.35);
        text(this.lowPrices[i],width_center,height_multiplier*4.35);
        text(this.previousClosePrices[i],width_center,height_multiplier*5.35);
        text(this.week52Highs[i],width_center,height_multiplier*6.35);
        text(this.week52Lows[i],width_center,height_multiplier*7.35);
        text(this.changePrices[i],width_center,height_multiplier*8.35);
        text(this.changePercentages[i],width_center,height_multiplier*9.35);
        text(this.ytdChanges[i],width_center,height_multiplier*10.35);
        
                
        fill(colors[i]); // stock corresponding color for bars
        // Most have origin at left of column since they only have positive values
        // However, when the range is both positive and negative, the origin is shifted to the center of column to allow for positive or negavive values
        rect(width_left,height_multiplier*1.5, mapValuesPosOnly(this.openPrices[i],500),20);
        rect(width_left,height_multiplier*2.5, mapValuesPosOnly(this.closePrices[i],500),20);
        rect(width_left,height_multiplier*3.5, mapValuesPosOnly(this.highPrices[i],500),20);
        rect(width_left,height_multiplier*4.5, mapValuesPosOnly(this.lowPrices[i],500),20);
        rect(width_left,height_multiplier*5.5, mapValuesPosOnly(this.previousClosePrices[i],500),20);
        rect(width_left,height_multiplier*6.5, mapValuesPosOnly(this.week52Highs[i],500),20);
        rect(width_left,height_multiplier*7.5, mapValuesPosOnly(this.week52Lows[i],500),20);
        rect(width_center,height_multiplier*8.5, mapValuesPosOnly(this.changePrices[i],25),20); // origin is center of column 
        rect(width_center,height_multiplier*9.5, mapValuesBidirectional(this.changePercentages[i]*100,5),20); // origin is center of column 
        rect(width_center,height_multiplier*10.5, mapValuesBidirectional(this.ytdChanges[i]*1,5),20); // origin is center of column
        
        stroke(255); // white line to mark the origin of bars
        strokeWeight(3); //
        line(width_left,height_multiplier*1.5-5,width_left,height_multiplier*1.5+25);
        line(width_left,height_multiplier*2.5-5,width_left,height_multiplier*2.5+25);
        line(width_left,height_multiplier*3.5-5,width_left,height_multiplier*3.5+25);
        line(width_left,height_multiplier*4.5-5,width_left,height_multiplier*4.5+25);
        line(width_left,height_multiplier*5.5-5,width_left,height_multiplier*5.5+25);
        line(width_left,height_multiplier*6.5-5,width_left,height_multiplier*6.5+25);
        line(width_left,height_multiplier*7.5-5,width_left,height_multiplier*7.5+25);
        line(width_center,height_multiplier*8.5-5,width_center,height_multiplier*8.5+25);
        line(width_center,height_multiplier*9.5-5,width_center,height_multiplier*9.5+25);
        line(width_center,height_multiplier*10.5-5,width_center,height_multiplier*10.5+25);
        // Reset StrokeWeight
        noStroke();
        strokeWeight(1);
        
      }
    }
  }
  
  void updateViewValues(boolean[] selectedTickers
                        ,String[] companyNames
                        , float[] openPrices
                        , float[] closePrices
                        , float[] highPrices
                        , float[] lowPrices
                        , float[] previousClosePrices
                        , float[] changePrices
                        , float[] changePercentages
                        , float[] week52Highs
                        , float[] week52Lows
                        , float[] ytdChanges
                        ){
    this.selectedTickers = selectedTickers;
    this.companyNames = companyNames;
    this.openPrices = openPrices;
    this.closePrices = closePrices;
    this.highPrices = highPrices;
    this.lowPrices = lowPrices;
    this.previousClosePrices = previousClosePrices;
    this.changePrices = changePrices;
    this.changePercentages = changePercentages;
    this.week52Highs = week52Highs;
    this.week52Lows = week52Lows;
    this.ytdChanges = ytdChanges;
                          
  }
    
    
    
    
                              
  
  /* ****************** 
  ** Private Methods **
  ********************* */
  
  private void setSomeFields(){
    this.companyNames = new String[numStocks];
    this.selectedTickers = new boolean[numStocks];
    
    // initialize to empty string to handle null values returned from the web
    // also select all tickers by default
    for (int i=0; i<numStocks; i++){
      companyNames[i] = ""; 
      selectedTickers[i] = true;
    }
    
    this.openPrices = new float[numStocks];
    this.closePrices = new float[numStocks];
    this.highPrices = new float[numStocks];
    this.lowPrices = new float[numStocks];
    this.previousClosePrices = new float[numStocks];
    this.changePrices = new float[numStocks];
    this.changePercentages = new float[numStocks];
    this.week52Highs = new float[numStocks];
    this.week52Lows = new float[numStocks];
    this.ytdChanges = new float[numStocks];
    
  }
  
  private float mapValuesPosOnly(float value, float range){
    float newRange = width/(float(numStocks + 1)); 
    float mappedVal = map(value,0,range,0,newRange);
    return(mappedVal);
  }
  
  private float mapValuesBidirectional(float value, float range){
    float newRange = width/(float(numStocks + 1)); 
    float mappedVal = map(value,-range,range,-newRange/2,newRange/2);
    return(mappedVal);
  }

  
}
