class IndividualStock extends Market{
  
  private JSONObject stockData;

  IndividualStock(){
  }

  IndividualStock(String ticker, float initNumStocks, int numPointsHistory){
    super(ticker, initNumStocks, numPointsHistory);
    this.url = "https://sandbox.iexapis.com/stable/stock/" + ticker + "/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c";
    this.startValue = getCurrentValue();
  }
  
  float getCurrentValue(){
    stockData = loadJSONObject(url);
    currentValue = numStocks * stockData.getFloat("latestPrice");
    updateValueHistory(currentValue);
    return (currentValue);
  }
  
  void setMarketOpenCloseTimes(){
    marketOpenTime = getTimeInMinutes(8,30);
    marketCloseTime = getTimeInMinutes(15,0);  
  }
  
   
}
