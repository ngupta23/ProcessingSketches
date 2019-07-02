/* 
Holds Information about a all Stocks that the user is interested in
This serves as the model in the MVC Method
Interfaces with the controller to provide all data updates
*/

class ModelStocks{
  private String[] tickers = {"VOO","VEU","BND","VNQ"}; // default values
  private int numPointMA;
  int numStocks;
  private Stock[] stocks;
  
  private Controller controller;

  /* ***************
  ** Constructors **
  ****************** */
  
  ModelStocks(){
    println("Default Constructor should not be used since the controller needs to be passed to this");
  }
  
  ModelStocks(Controller _control)
  {
    controller = _control;
    // tickers is already defined by default
    this.numPointMA = 20;
    setSomeFields();
  }
  
  ModelStocks(Controller _control, String[] tickers){
    controller = _control;
    this.tickers = tickers;
    this.numPointMA = 20;
    setSomeFields();
  }
  
  ModelStocks(Controller _control, String[] tickers, int numPointMA){
    controller = _control;
    this.tickers = tickers;
    this.numPointMA = numPointMA;
    setSomeFields();
  }
  
  /* ********************** 
  ** Getters and Setters **
  ************************* */
  
  String[] getTickers(){ return (tickers); }
  int getNumPointMA(){ return (numPointMA); }
  
  /* ***************** 
  ** Public Methods **
  ******************** */
  
  void updateLatestPriceAll(){
    for (int i=0; i<numStocks; i++){
      stocks[i].updateAndGetCurrentPrice();
    }
  }
  
  float[][] getPriceHistories(){
    float [][] rvHistories = new float[numStocks][];
    
    for (int i=0; i<numStocks; i++){
      rvHistories[i] = new float[numPointMA];  
      rvHistories[i] = stocks[i].getPriceHistory();  
    }
    
    return(rvHistories);
  }
  
  String[] getCompanyNames(){
    String [] returnValue = new String[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getCompanyName();  
    }
    
    return(returnValue);
  }
  
  float[] getOpenPrices(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getOpenPrice();  
    }
    
    return(returnValue);
  }
  
  float[] getClosePrices(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getClosePrice();  
    }
    
    return(returnValue);
  }
  
  float[] getHighPrices(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getHighPrice();  
    }
    
    return(returnValue);
  }
  
  float[] getLowPrices(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getLowPrice();  
    }
    
    return(returnValue);
  }
  
  float[] getPreviousClosePrices(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getPreviousClosePrice();  
    }
    
    return(returnValue);
  }
  
  float[] getChangePrices(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getChangePrice();  
    }
    
    return(returnValue);
  }
  
  float[] getChangePercentages(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getChangePercent();  
    }
    
    return(returnValue);
  }
  
  float[] getWeek52Highs(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getWeek52High();  
    }
    
    return(returnValue);
  }
  
  float[] getWeek52Lows(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getWeek52Low();  
    }
    
    return(returnValue);
  }
  
  float[] getYtdChanges(){
    float[] returnValue = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      returnValue[i] = stocks[i].getYtdChange();  
    }
    
    return(returnValue);
  }
    
  float[] getMovingAverageAll(){
    float [] rvMovingAverages = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      rvMovingAverages[i] = stocks[i].getMovingAverage();  
    }
    
    return (rvMovingAverages);
  }
  
  float[] getCurrentPricePercentChangeAll(){
    float [] rvCurrentPricePercentChange = new float[numStocks];
    
    for (int i=0; i<numStocks; i++){
      rvCurrentPricePercentChange[i] = stocks[i].getCurrentPricePercentChange();  
    }
    
    return (rvCurrentPricePercentChange);  
  }
  
  
  
  /* ****************** 
  ** Private Methods **
  ********************* */
  
  private void setSomeFields(){
    this.numStocks = this.tickers.length;
            
    // define the stock objects
    this.stocks = new Stock[numStocks];
    for (int i=0; i<numStocks; i++){
      stocks[i] = new Stock(tickers[i]);  
    }  
  }
  
  /* **************** 
  ** Print methods **
  ******************* */  
  
  void printPriceHistories(){
    for (int i=0; i<numStocks; i++){
      stocks[i].printPriceHistory();  
    }    
  }
  
  void printTickers(){
    for (int i=0; i<numStocks; i++){
      stocks[i].printTicker();  
    }    
  }
  
}
