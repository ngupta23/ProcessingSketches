abstract class Market extends Asset{
  
  String url; // url gives the link from where we can get real time data
  int marketOpenTime;
  int marketCloseTime;
  float numStocks; // float since we can own partial shared due to dividend repurchases, etc.
  
  Market(){
    setMarketOpenCloseTimes();
  }
  
  Market(String name, float numStocks, int numPointsHistory){
    super(name, numPointsHistory);
    this.numStocks = numStocks;
    setMarketOpenCloseTimes();
  }
  
  abstract float getCurrentValue(); // Different Markets could use different website API's (or another method) to get the Value
  float getNumStocks(){ return numStocks; }
  abstract void setMarketOpenCloseTimes(); // Set the time when the market open and closes for trade (Different Markets can have different trading Windows)
    
  int getTimeInMinutes(int hour, int minute){
    return (hour * 60 + minute);
  }
  
  boolean openForTrade(){
    int currentTime = getTimeInMinutes(hour(), minute());
    if (currentTime > marketOpenTime & currentTime < marketCloseTime){ return true; } 
    else{ return false; }
  }
  
  
 
}
