class ViewStockDetailView extends PApplet{
  
  private static final int VIEW_WIDTH = 800;
  private static final int VIEW_HEIGHT = 800;
  
  private Controller controller;
  private String[] tickers; 
  private int numStocks;
  
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
  
  public ViewStockDetailView(Controller _control)
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
  }
  
  public void draw(){
    background(0); 
    int fontSize;
    int numStocks = tickers.length;
    
    fontSize = 80/numStocks;
    textFont(f,fontSize);
    textAlign(RIGHT);
    fill(255);
    float height_multiplier = height / 11;
    
    text("Ticker ",width/(numStocks+1),height_multiplier*0.5);
    text("Open ",width/(numStocks+1),height_multiplier*1.5);
    text("Close ",width/(numStocks+1),height_multiplier*2.5);
    text("High ",width/(numStocks+1),height_multiplier*3.5);
    text("Low ",width/(numStocks+1),height_multiplier*4.5);
    text("Previous Close ",width/(numStocks+1),height_multiplier*5.5);
    text("Change ",width/(numStocks+1),height_multiplier*6.5);
    text("Change % ",width/(numStocks+1),height_multiplier*7.5);
    text("52 week High ",width/(numStocks+1),height_multiplier*8.5);
    text("52 week Low ",width/(numStocks+1),height_multiplier*9.5);
    text("YTD Change ",width/(numStocks+1),height_multiplier*10.5);
    
    for(int i=0; i<numStocks; i++){ // For all stocks
      fontSize = 75/numStocks;
      textFont(f,fontSize);
      textAlign(LEFT); 
      fill(colors[i]); 
      
      float width_val = width/(2*(numStocks+1))*(2*(i+1)+1);
      
      text(this.tickers[i],width_val,height_multiplier*0.5);
      //text(this.companyNames[i],width_val,height_multiplier*0.5); // Future Enhancement (required wrapping of text)
      text(this.openPrices[i],width_val,height_multiplier*1.5);
      text(this.closePrices[i],width_val,height_multiplier*2.5);
      text(this.highPrices[i],width_val,height_multiplier*3.5);
      text(this.lowPrices[i],width_val,height_multiplier*4.5);
      text(this.previousClosePrices[i],width_val,height_multiplier*5.5);
      text(this.changePrices[i],width_val,height_multiplier*6.5);
      text(this.changePercentages[i],width_val,height_multiplier*7.5);
      text(this.week52Highs[i],width_val,height_multiplier*8.5);
      text(this.week52Lows[i],width_val,height_multiplier*9.5);
      text(this.ytdChanges[i],width_val,height_multiplier*10.5);
    }
          
    
  }
  
  void updateViewValues(String[] companyNames
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
    
    // initialize to empty string to handle null values returned from the web
    for (int i=0; i<numStocks; i++){
      companyNames[i] = "";    
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
  
}
