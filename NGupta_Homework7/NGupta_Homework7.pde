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

*/

// User Inputs
int canvasSize = 1000;
String[] tickers = {"VOO","VEU","BND","VNQ"};
//String[] tickers = {"VOO","IVOO","VEU","BND","VNQ"}; // check autoResizing 1
//String[] tickers = {"VOO","IVOO","VIOO","VEU","BND","VNQ"}; // check autoResizing 2
//String[] tickers = {"VOO","IVOO","VIOO","VEU","VWO","BND","VNQ"}; // check autoResizing 3


// For Plotting
//ScatterPlotter scatterPlotter = new ScatterPlotter(); // Does not work if new is defined here (comment out to make it work)
ScatterPlotter scatterPlotter; // Works (must define new inside setup as shown below) (uncomment to make it work)

// For text
PFont f;
    
void settings(){ size(canvasSize, canvasSize); }

void setup() {
  f = createFont("Arial",16,true); 
  scatterPlotter = new  ScatterPlotter(tickers); // new has to be mentioned here (not outside), otherwise JSONObject does not get loaded and gives an error
}

void draw(){ scatterPlotter.drawAnimation(); } //<>// //<>//
