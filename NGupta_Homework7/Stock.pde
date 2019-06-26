class Stock{
  /* ********* 
  ** Fields **
  ************ */
  
  private String ticker;
  private String url;
  
  private float startingPrice;
  private float percentChange;
  private JSONObject stockData;
  
  // For Moving Average
  private int currentIndex;
  private int numPointMA;
  private float[] percentChangeHistory;
  private float movingAverage;
  
  /* *************** 
  ** Constructors **
  ****************** */
  Stock(){
    this.ticker = "VOO"; // Large Cap US Stock index (default)
    this.numPointMA = 20; // 20 point MA is used most often for Bollinger's Band calculation, hence using as default
    this.currentIndex = 0;
    this.percentChangeHistory = new float[numPointMA];
    loadStartingPrice();
  }
  
  Stock(String ticker){
    this.ticker = ticker;
    this.numPointMA = 20; // 20 point MA is used most often for Bollinger's Band calculation, hence using as default
    this.currentIndex = 0;
    this.percentChangeHistory = new float[numPointMA];
    loadStartingPrice();
  }
  
  Stock(String ticker, int numPointMA){
    this.ticker = ticker;
    this.numPointMA = numPointMA;
    this.currentIndex = 0;
    this.percentChangeHistory = new float[numPointMA];
    loadStartingPrice();
  }
  
  /* ********************** 
  ** Getters and Setters **
  ************************* */
  
  int getNumPointMA(){ return this.numPointMA; }
  void setNumPointMA(int numPointMA) { this.numPointMA = numPointMA; }
    
  /* ********** 
  ** Methods **
  ************* */
  
  void loadStartingPrice(){
    // load starting price
    url = "https://sandbox.iexapis.com/stable/stock/" + ticker + "/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c";
    stockData = loadJSONObject(url);
    startingPrice = stockData.getFloat("latestPrice");
  }

  float getCurrentPricePercentChange(){
    // Get the current price
    stockData = loadJSONObject(url);
    float latestPrice = stockData.getFloat("latestPrice");
    percentChange = (latestPrice / startingPrice - 1)*100;
    percentChangeHistory[currentIndex%numPointMA] = percentChange;
    
    currentIndex++;
    
    return (percentChange);
  }
  
  float getMovingAverage(){
    if (currentIndex >= numPointMA){ // only when buffer has filled up (dont take MA before that)
      // Compute Moving Average
      float sum = 0;
      for (int i=0; i < numPointMA; i++){
        sum += percentChangeHistory[i];
      }
      movingAverage = sum/numPointMA;
    }  
    return(movingAverage);
  }

  
  
}
