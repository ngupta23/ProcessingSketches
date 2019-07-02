class ViewStockDetailView extends PApplet{
  
  private static final int VIEW_WIDTH = 800;
  private static final int VIEW_HEIGHT = 800;
  
  private Controller controller;
  private String[] tickers;
  private int numPointMA;
  
  // For refreshing
  private int refreshFreq; // in seconds
  private int ageOfAnimation;
  
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
  
  /* ***************
  ** Constructors **
  ****************** */
  
  public ViewStockDetailView(Controller _control)
  {
    controller = _control;
    numPointMA = controller.getNumPointMA();
    tickers = controller.getTickers();
    
    setSomeFields();
  }
  
  /* *************************************
  ** Settings, Setup and Draw Functions **
  **************************************** */
  
  public void settings(){
    this.size(VIEW_WIDTH, VIEW_HEIGHT);
  }
  
  public void draw(){
    background(0);  
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
    //print ("ViewScatterPlotter >> Set Some Fields");
    this.refreshFreq = 1;
    this.ageOfAnimation = 0;
  }
  
}
