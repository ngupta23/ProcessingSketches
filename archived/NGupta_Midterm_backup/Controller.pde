class Controller{
  ModelStocks modelStocks;
  private PApplet mainView;
  private ViewScatterPlotter vwScatterPlotter;
  private ViewTimeSeries vwTimeSeries;  
  
  // Constructors
  public Controller(PApplet _mainView)
  {
    mainView = _mainView;
    vwScatterPlotter = new ViewScatterPlotter(this);
    vwTimeSeries = new ViewTimeSeries(this);
    modelStocks = new ModelStocks(this);
       
    drawViews();
    printDiagnostics();
    
  }
  
  public Controller(PApplet _mainView, String[] _tickers)
  {
    mainView = _mainView;
    vwScatterPlotter = new ViewScatterPlotter(this);
    vwTimeSeries = new ViewTimeSeries(this);
    modelStocks = new ModelStocks(this, _tickers);
    
    drawViews();
    printDiagnostics();
    
    updateTimeSeries();
    
  }
  
  // Methods
  void drawViews(){
    PApplet.runSketch(new String[]{"Animated Scatter Plot"}, vwScatterPlotter);
    PApplet.runSketch(new String[]{"Time Series Data"}, vwTimeSeries);
  }
  
  void printDiagnostics(){
    if (glDebug >= 1){
      println("Printing Diagnostics from Controller");
      modelStocks.printTickers();
      modelStocks.printPriceHistories();
    }
  }
  
  public void updateTimeSeries(){
    /* Updates the view with the latest data for all stocks */
    vwTimeSeries.updateView(modelStocks.getPriceHistories());    
    
  }
  
  public void updateScatterView(){
    
  }
 
  public void updateLatestPriceAll(){
    // Gets the latest stock price for all stocks and updates price history
    modelStocks.updateLatestPriceAll();    
    
  }

  
  
}
