class Controller{
  ModelStocks modelStocks;
  private PApplet mainView;
  private ViewScatterPlotter vwScatterPlotter;
  private ViewTimeSeries vwTimeSeries;
  private ViewStockDetailView vwStockDetails;
  
  Boolean isJustUpdated;
  
  /* ***************
  ** Constructors **
  ****************** */
  
  public Controller(PApplet _mainView)
  {
    mainView = _mainView;
    modelStocks = new ModelStocks(this);
    isJustUpdated = false;
       
    drawViews();
    printDiagnostics();
  }
  
  public Controller(PApplet _mainView, String[] _tickers)
  {
    mainView = _mainView;
    modelStocks = new ModelStocks(this, _tickers);
    isJustUpdated = false;
        
    drawViews();
    printDiagnostics();
  }
  
  public Controller(PApplet _mainView, String[] _tickers, int numPointMA)
  {
    mainView = _mainView;
    modelStocks = new ModelStocks(this, _tickers, numPointMA);
    isJustUpdated = false;
            
    drawViews();
    printDiagnostics();
  }
  
  /* **********************
  ** Getters and Setters **
  ************************* */
  String[] getTickers(){ return(modelStocks.getTickers()); }
  int getNumPointMA(){ return(modelStocks.getNumPointMA()); }
  Boolean getIsJustUpdated() { return(isJustUpdated); }
  void setIsJustUpdated(Boolean value){ isJustUpdated = value; }
    
  /* *****************
  ** Public Methods **
  ******************** */
    
  public void updateLatestPriceAll(){
    // Gets the latest stock price for all stocks and updates price history
    modelStocks.updateLatestPriceAll();    
    
  }
  
  public void updateAllData(){
    // Gets the latest stock price for all stocks and updates price history
    modelStocks.updateAllData();    
    
  }
  
  public void updateScatterViewValues(){
    vwScatterPlotter.updateViewValues(modelStocks.getCurrentPricePercentChangeAll(), modelStocks.getMovingAverageAll());  
  }  
    
  public void updateTimeSeriesViewValues(){
    /* Updates the view with the latest data for all stocks */
    vwTimeSeries.updateViewValues(modelStocks.getPriceHistories());    
  }
  
  public void updateStockDetailViewValues(){
    /* Updates the view with the latest data for all stocks */
    vwStockDetails.updateViewValues(modelStocks.getCompanyNames()
                                    ,modelStocks.getOpenPrices()
                                    ,modelStocks.getClosePrices()
                                    ,modelStocks.getHighPrices()
                                    ,modelStocks.getLowPrices()
                                    ,modelStocks.getPreviousClosePrices()
                                    ,modelStocks.getChangePrices()
                                    ,modelStocks.getChangePercentages()
                                    ,modelStocks.getWeek52Highs()
                                    ,modelStocks.getWeek52Lows()
                                    ,modelStocks.getYtdChanges()
                                   );
  }
  
  /* ******************
  ** Private Methods **
  ********************* */
  
  private void drawViews(){
    vwScatterPlotter = new ViewScatterPlotter(this, this.getNumPointMA());  
    vwTimeSeries = new ViewTimeSeries(this);
    vwStockDetails = new ViewStockDetailView(this);
    
    PApplet.runSketch(new String[]{ "--display=2", "--location=0,0", "Animated Scatter Plot"}, vwScatterPlotter);
    PApplet.runSketch(new String[]{ "--display=2", "--location=200,200", "Time Series Data"}, vwTimeSeries);
    PApplet.runSketch(new String[]{ "--display=2", "--location=400,400", "Stock Data"}, vwStockDetails);
  }
  
  /* ****************
  ** Print Methods **
  ******************* */
  
  void printDiagnostics(){
    if (glDebug >= 1){
      println("Printing Diagnostics from Controller");
      modelStocks.printTickers();
      modelStocks.printPriceHistories();
    }
  }
 
  

  
  
}
