class Controller{
  ModelStocks modelStocks;
  private PApplet mainView;
  private ViewScatterPlotter vwScatterPlotter;
  private ViewTimeSeries vwTimeSeries;
  //private ViewStockDetailView vwStockDetails;
  private ViewStockCompare vwStockCompare;
  
  
  /* ***************
  ** Constructors **
  ****************** */
  
  public Controller(PApplet _mainView)
  {
    mainView = _mainView;
    modelStocks = new ModelStocks(this);
       
    drawViews();
    printDiagnostics();
  }
  
  public Controller(PApplet _mainView, String[] _tickers)
  {
    mainView = _mainView;
    modelStocks = new ModelStocks(this, _tickers);
        
    drawViews();
    printDiagnostics();
  }
  
  public Controller(PApplet _mainView, String[] _tickers, int numPointMA)
  {
    mainView = _mainView;
    modelStocks = new ModelStocks(this, _tickers, numPointMA);
            
    drawViews();
    printDiagnostics();
  }
  
  /* **********************
  ** Getters and Setters **
  ************************* */
  String[] getTickers(){ return(modelStocks.getTickers()); }
  int getNumPointMA(){ return(modelStocks.getNumPointMA()); }
 
    
  /* *****************
  ** Public Methods **
  ******************** */
    
  public void updateLatestPriceAll(){
    // Gets the latest stock price for all stocks and updates price history
    modelStocks.updateLatestPriceAll();    
  }
  
  public void updateAllData(){
    // Gets the latest stock data for all stocks and updates price history
    modelStocks.updateAllData();    
  }
  
  public void updateScatterViewValues(boolean[] selectedTickers){
    /* Updates the view with the latest data for all stocks */
    vwScatterPlotter.updateViewValues(selectedTickers, modelStocks.getCurrentPricePercentChangeAll(), modelStocks.getMovingAverageAll());
  }  
    
  public void updateTimeSeriesViewValues(boolean[] selectedTickers){
    /* Updates the view with the latest data for all stocks */
    vwTimeSeries.updateViewValues(selectedTickers, modelStocks.getPriceHistories());    
  }
  
  /*
  public void updateStockDetailViewValues(boolean[] selectedTickers){
    vwStockDetails.updateViewValues(selectedTickers
                                    ,modelStocks.getCompanyNames()
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
  */
  
  public void updateStockCompareViewValues(boolean[] selectedTickers){
    /* Updates the view with the latest data for all stocks */
    vwStockCompare.updateViewValues(selectedTickers
                                    ,modelStocks.getCompanyNames()
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
    vwScatterPlotter = new ViewScatterPlotter(this);
    vwTimeSeries = new ViewTimeSeries(this);
    //vwStockDetails = new ViewStockDetailView(this);
    vwStockCompare = new ViewStockCompare(this);
    
    PApplet.runSketch(new String[]{ "--display=2", "--location=0,0", "Animated Scatter Plot"}, vwScatterPlotter);
    PApplet.runSketch(new String[]{ "--display=2", "--location=810,0", "Time Series Data"}, vwTimeSeries);
    //PApplet.runSketch(new String[]{ "--display=2", "--location=0,850", "Stock Data"}, vwStockDetails);
    PApplet.runSketch(new String[]{ "--display=2", "--location=1220,0", "Stock Comparison"}, vwStockCompare);
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
