/* 
****************************
** Vizualizing Stock Data **
****************************

Simultaneously visualize stock pice change in multiple stock indices

* VOO (US Large Cap) 
* VEU (Developed International)
* BND (US Bond Market)
* VNQ (US Real Estate Market)

API: https://sandbox.iexapis.com/stable/stock/<Replace Ticker Here>/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c

TODO:
* Add Refresh Frequency (otherwise too fast)
* Add separate color to each point in scatterplot 
* Check that the points are getting mapped correctly
* Fix grid lines (minor)
* Add text labels
* Break code into bite sized functions


*/

int canvasSize = 800;
int numStocks = 4;
int refreshFreq = 2; // in seconds
String[] tickers = {"VOO","VEU","BND","VNQ"};
String[] url = new String[4];
JSONObject[] stockData = new JSONObject[4];
float[] startingPrice = new float[4];
//float[] latestPrice = new float[4];
float[] percentChange = new float[4];
float[] mappedChange = new float[4];
PVector scatter[][] = new PVector[4][4];

void settings()
{
  size(canvasSize, canvasSize);
  
  // load starting price
  for (int i=0; i<numStocks; i++){
    url[i] = "https://sandbox.iexapis.com/stable/stock/" + tickers[i] + "/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c";
    stockData[i] = loadJSONObject(url[i]);
    startingPrice[i] = stockData[i].getFloat("latestPrice");
  }
}

void setup(){
  testMode();  
}

//void draw()
void testMode()
{
  background(0);
   
  /* ************ 
  ** Draw Grid **
  *************** */
  
  // Major Grid
  stroke(255,127,0);
  strokeWeight(4);
  for (int i=1; i<numStocks; i++){
    line(width/(numStocks) * i, 0, width/(numStocks) * i, height);
    line(0, height/(numStocks) * i , width, height/(numStocks) * i);
  }
  
  // Minor Grid
  stroke(255,0,0);
  strokeWeight(1);
  for (int i=0; i<numStocks; i++){
    line(width/(2 * numStocks) * (2*i+1), 0, width/(2 * numStocks) * (2*i+1), height);
    line(0, height/(2 * numStocks) * (2*i+1) , width, height/(2 * numStocks) * (2*i+1));
  }
  noStroke();
  
  // Get the current price
  for (int i=0; i<numStocks; i++){
    stockData[i] = loadJSONObject(url[i]);
    float latestPrice = stockData[i].getFloat("latestPrice");
    percentChange[i] = (latestPrice / startingPrice[i] - 1)*100;
    mappedChange[i] = map(percentChange[i],-5,5,-width/(2*(numStocks)),width/(2*(numStocks)));
    println(tickers[i] + " >> Latest = " +  latestPrice + " | Starting = " + startingPrice[i] + " | Change = " +percentChange[i]);  
  } //<>//
  
  // draw animated scatterplot
  for (int i=1; i<numStocks; i++){
    for (int j=0; j<numStocks-1; j++){
      if (i > j){ // no need to duplicate information on the other half of matrix
        scatter[i][j] = new PVector(mappedChange[i],mappedChange[j]);
        // Note -ve sign below for y since we have to move up for +ve stock change)
        // x still has +ve sign since we are moving in the right direction (+ve stock changes moves to the right) 
        ellipse(width/(2*(numStocks))*(2*i+1) + scatter[i][j].x, height/(2*(numStocks))*(2*j+1) - scatter[i][j].y, 12, 12);
      }
    }
  } //<>//
   
}
