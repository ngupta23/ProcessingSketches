/* *************************
** Vizualizing Stock Data **
****************************

Simultaneously visualize stock price change in multiple stock indices using animated scatterplots.

* Top half visualizes scatterplot of percentage daily change in stock price
* Bottom half visualizes N-point Moving Average of Percentage Daily Change
    - Default N = 20 which is useful for computing the Bollinger's Band (indicator of stock volatility)

Stock Indices Chosen (user can change these as needed)
* VOO (US Large Cap) 
* VEU (Developed International)
* BND (US Bond Market)
* VNQ (US Real Estate Market)

API: https://sandbox.iexapis.com/stable/stock/<Replace Ticker Here>/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c

NOTES: 
* N-point Moving Average only gets plotted after N points have been collected
* N-point Moving Average will be less volatile than daily change and this will be clearly visible in the animated scatterplot
* User can change the default value of N if desired
* Scatterplot automatically resizes based on number of stocks picked by user
* User can update the frequency of refresh for the data

*/

// User Inputs
int canvasSize = 1000;
int refreshFreq = 1; // in seconds
String[] tickers = {"VOO","VEU","BND","VNQ"};
//String[] tickers = {"VOO","IVOO","VEU","BND","VNQ"}; // check autoResizing 1
//String[] tickers = {"VOO","IVOO","VIOO","VEU","BND","VNQ"}; // check autoResizing 2
//String[] tickers = {"VOO","IVOO","VIOO","VEU","VWO","BND","VNQ"}; // check autoResizing 3
int numPointMA = 20;



// For Stock Price
int numStocks = tickers.length;
String[] url = new String[numStocks];
JSONObject[] stockData = new JSONObject[numStocks];
float[] startingPrice = new float[numStocks];
float[] percentChange = new float[numStocks];
float[] mappedChange = new float[numStocks];

// For Moving Average
int currentIndex = 0;
float[][] percentChangeHistory = new float[numStocks][numPointMA];
float[] movingAverage = new float[numStocks];
float[] mappedMovingAverage = new float[numStocks];

// For Plotting
PVector scatter[][] = new PVector[numStocks][numStocks];

// For refreshing
int ageOfAnimation = 0;
int alpha = 25;

void settings(){ size(canvasSize, canvasSize); }

void setup() {
  f = createFont("Arial",16,true); 
  loadStartingPrice();
}

void draw(){
  if (ageOfAnimation % (refreshFreq*60) == 0){
    
    // Step 1: Background and Grid
    drawBackground();
    drawGrid();    
    
    // Step 2: Stock Price Related
    getCurrentPrice();
    computeMovingAverage();
    
    // Step 3: Animation //<>//
    drawAnimatedScatterplot();
    setTicketText(); //<>//
  }
  
  ageOfAnimation++;
 
}
