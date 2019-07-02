class Controller{
  ModelStocks modelStocks;
  private PApplet mainView;
  private ViewScatterPlotter vwScatterPlotter;
  private ViewTimeSeries vwTimeSeries;  
  
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
  
  public void updateScatterViewValues(){
    vwScatterPlotter.updateViewValues(modelStocks.getCurrentPricePercentChangeAll(), modelStocks.getMovingAverageAll());  
  }  
    
  public void updateTimeSeriesViewValues(){
    /* Updates the view with the latest data for all stocks */
    vwTimeSeries.updateViewValues(modelStocks.getPriceHistories());    
  }
  
  /* ******************
  ** Private Methods **
  ********************* */
  
  private void drawViews(){
    vwScatterPlotter = new ViewScatterPlotter(this, this.getNumPointMA());  
    vwTimeSeries = new ViewTimeSeries(this);
    
    PApplet.runSketch(new String[]{"Animated Scatter Plot"}, vwScatterPlotter);
    PApplet.runSketch(new String[]{"Time Series Data"}, vwTimeSeries);
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
