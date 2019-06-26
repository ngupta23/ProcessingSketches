void loadStartingPrice(){
  // load starting price
  for (int i=0; i<numStocks; i++){
    url[i] = "https://sandbox.iexapis.com/stable/stock/" + tickers[i] + "/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c";
    stockData[i] = loadJSONObject(url[i]);
    startingPrice[i] = stockData[i].getFloat("latestPrice");
  }
}

void getCurrentPrice(){
  // Get the current price
  for (int i=0; i<numStocks; i++){
    stockData[i] = loadJSONObject(url[i]);
    float latestPrice = stockData[i].getFloat("latestPrice");
    percentChange[i] = (latestPrice / startingPrice[i] - 1)*100;
    mappedChange[i] = map(percentChange[i],-5,5,-width/(2*(numStocks)),width/(2*(numStocks)));
    //println(tickers[i] + " >> Latest = " +  latestPrice + " | Starting = " + startingPrice[i] + " | Change = " +percentChange[i]);
    percentChangeHistory[i][currentIndex%numPointMA] = percentChange[i];
  }
  currentIndex++;  
}

void computeMovingAverage(){
  // Compute Moving Average
  if (currentIndex >= numPointMA){ // only when buffer has filled up (dont take MA before that)
    for (int i=0; i<numStocks; i++){
      float sum = 0;
      for (int j=0; j < numPointMA; j++){
        sum += percentChangeHistory[i][j];
      }
      movingAverage[i] = sum/numPointMA;
      mappedMovingAverage[i] = map(movingAverage[i],-5,5,-width/(2*(numStocks)),width/(2*(numStocks)));
      //println("Moving Average " + tickers[i] + " >> " + movingAverage[i]);
    }
  }  
}
