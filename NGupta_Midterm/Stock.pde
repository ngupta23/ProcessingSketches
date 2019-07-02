/* Holds Information about a Single Stock */

class Stock{
  /* ********* 
  ** Fields **
  ************ */
  
  private String ticker;
  private String url;
  
  private float startingPrice;
  private float percentChange;
  private JSONObject stockData;
  
  private String companyName;
  private float openPrice;
  private float closePrice;
  private float highPrice;
  private float lowPrice;
  private float previousClosePrice;
  private float changePrice;
  private float changePercent;
  private float week52High;
  private float week52Low;
  private float ytdChange;
    
  // For Moving Average
  private int currentIndex;
  private int numPointMA;
  private float[] priceHistory;
  private float[] percentChangeHistory;
  private float movingAverage;
  
  /* *************** 
  ** Constructors **
  ****************** */
  Stock(){
    this.ticker = "VOO"; // Large Cap US Stock index (default)
    this.numPointMA = 20; // 20 point MA is used most often for Bollinger's Band calculation, hence using as default
    this.currentIndex = 0;
    this.priceHistory = new float[numPointMA];
    this.percentChangeHistory = new float[numPointMA];
    this.url = "https://sandbox.iexapis.com/stable/stock/" + ticker + "/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c";
    loadAllData();
  }
  
  Stock(String ticker){
    this.ticker = ticker;
    this.numPointMA = 20; // 20 point MA is used most often for Bollinger's Band calculation, hence using as default
    this.currentIndex = 0;
    this.priceHistory = new float[numPointMA];
    this.percentChangeHistory = new float[numPointMA];
    this.url = "https://sandbox.iexapis.com/stable/stock/" + ticker + "/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c";
    loadAllData();
  }
  
  Stock(String ticker, int numPointMA){
    this.ticker = ticker;
    this.numPointMA = numPointMA;
    this.currentIndex = 0;
    this.priceHistory = new float[numPointMA];
    this.percentChangeHistory = new float[numPointMA];
    this.url = "https://sandbox.iexapis.com/stable/stock/" + ticker + "/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c";
    loadAllData();
  }
  
  /* ********************** 
  ** Getters and Setters **
  ************************* */
  
  int getNumPointMA(){ return this.numPointMA; }
  void setNumPointMA(int numPointMA) { this.numPointMA = numPointMA; }
  
  float[] getPriceHistory(){ return (priceHistory); }
   
  String getCompanyName (){ return(companyName); }
  void setCompanyName(String value) { companyName = value; }
  
  float getOpenPrice (){ return(openPrice); }
  void setOpenPrice(float value) { openPrice = value; }
   
  float getClosePrice (){ return(closePrice); }
  void setClosePrice(float value) { closePrice = value; }
  
  float getHighPrice (){ return(highPrice); }
  void setHighPrice(float value) { highPrice = value; }
  
  float getLowPrice (){ return(lowPrice); }
  void setLowPrice(float value) { lowPrice = value; }
  
  float getPreviousClosePrice (){ return(previousClosePrice); }
  void setPreviousClosePrice(float value) { previousClosePrice = value; }
  
  float getChangePrice (){ return(changePrice); }
  void setChangePrice(float value) { changePrice = value; }
  
  float getChangePercent (){ return(changePercent); }
  void setChangePercent(float value) { changePercent = value; }
  
  float getWeek52High (){ return(week52High); }
  void setWeek52High(float value) { week52High = value; }
  
  float getWeek52Low (){ return(week52Low); }
  void setWeek52Low(float value) { week52Low = value; }
  
  float getYtdChange (){ return(ytdChange); }
  void setYtdChange(float value) { ytdChange = value; }
  
  /* ***************** 
  ** Public Methods **
  ******************** */
   
  void loadAllData(){
    // load starting price
    
    stockData = loadJSONObject(url);
    startingPrice = stockData.getFloat("latestPrice");
    
    // Default Value (in case value is not returned by JSON Object) is what is stored already (previously)
    setCompanyName(stockData.getString("companyName",getCompanyName()));
    setOpenPrice(stockData.getFloat("open",getOpenPrice()));
    setClosePrice(stockData.getFloat("close",getClosePrice()));
    setHighPrice(stockData.getFloat("high",getHighPrice())); 
    setLowPrice(stockData.getFloat("low",getLowPrice()));
    setPreviousClosePrice(stockData.getFloat("previousClose",getPreviousClosePrice()));
    setChangePrice(stockData.getFloat("change",getChangePrice()));
    setChangePercent(stockData.getFloat("changePercent",getChangePercent()));
    setWeek52High(stockData.getFloat("week52High",getWeek52High()));
    setWeek52Low(stockData.getFloat("week52Low",getWeek52Low()));
    setYtdChange(stockData.getFloat("ytdChange",getYtdChange()));
  }
  
  float updateAndGetCurrentPrice(){
    stockData = loadJSONObject(url);
    float latestPrice = stockData.getFloat("latestPrice");
    
    // Also update history when you get the current price
    updatePriceHistory(latestPrice);
    currentIndex++;
   
    return(latestPrice);    
  }
    
  float getCurrentPricePercentChange(){
    // Get the current price
    float latestPrice = updateAndGetCurrentPrice();
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

  
  /* ****************** 
  ** Private Methods **
  ********************* */
  
  private void updatePriceHistory(float latestPrice){
    if (glDebug >= 2){
      println("Inside Stock Class updatePriceHistory function >> " + ticker + " >> Latest Price: " + latestPrice);
    }
    // TODO: Add code to update history
    // Shift all left by one
    for (int i = 0; i < numPointMA - 1 ; i++){
      priceHistory[i] = priceHistory[i+1];
    }
    
    // append latest price at the end
    priceHistory[numPointMA-1] = latestPrice;
  }


  /* **************** 
  ** Print methods **
  ******************* */  
  
  void printTicker(){
    println(ticker);  
  }
    
  void printPriceHistory(){
    println("Price history for " + ticker + ": ");
    for (int i = 0; i < numPointMA ; i++){
      print(priceHistory[i], " ");
    }
    println();
  }  
  
}
