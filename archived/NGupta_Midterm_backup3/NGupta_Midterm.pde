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


/* 

To Fix 
(1) Moving Average is starting before 20 points (how to synchronize time between windows)

To Add
(1) Axis Labels for Time Series

*/



// for debugging program number indicates different levels of verbosity (this is an alternate to using the debug utility which is slower to use)
// 0 = no debug statements
// 1 = basic debug statements (no prints in draw functions)
// 2 = detailed debug statements (may include print statements in draw functions)
// 3 = detailed debug statements (may include print statements in draw functions) - must be careful to use this (useful only when programmed is killed immediately to check the print console)
int glDebug = 0; 

// User Inputs
int canvasSize = 1000;
//String[] tickers = {"VOO","VEU","BND","VNQ"};
//String[] tickers = {"VOO","IVOO","VEU","BND","VNQ"}; // check autoResizing 1
//String[] tickers = {"VOO","IVOO","VIOO","VEU","BND","VNQ"}; // check autoResizing 2
String[] tickers = {"VOO","IVOO","VIOO","VEU","VWO","BND","VNQ"}; // check autoResizing 3

int numPointMA = 20;
int refreshFreq = 1; // in seconds

int ageOfAnimation = 0;

// Global Color Scheme
static final int RED    = #FF0000;
static final int ORANGE = #FF7F00;
static final int YELLOW = #FFFF00;
static final int GREEN  = #00FF00; 
static final int BLUE   = #0000FF; 
static final int INDIGO = #4B0082;
static final int VIOLET = #9400D3;
color[] colors = {RED,ORANGE,YELLOW,GREEN,BLUE,INDIGO,VIOLET};

Menu menu;
   
Controller control;


void settings(){ size(200,100*tickers.length); }

void setup() {
  surface.setTitle("Filters"); // Main View is the filters for the Stocks
  control = new Controller(this, tickers, numPointMA);
  color[] states = {#FF0000, #00FF00, #FFFF00, #0000FF };  //offState (red), onState (green), overState (yellow), pressState (blue)
  menu = new Menu(Layout.LEFT, new Dimension(width, height), tickers, states, ButtonType.RECT);
}

void draw(){  //<>//
  
  /*
  menu.display();
  
  println("Age of Animation: " + ageOfAnimation);
  for (int i=0; i<tickers.length; i++){
    if (menu.getSelected() == tickers[i]) {
      println("Ticker Selected: " + tickers[i]);     
    }
  }
  */
  
  //if (ageOfAnimation % (refreshFreq*60) == 0){
    
    
    
    control.updateLatestPriceAll(); 
    control.updateAllData();
    
    
    
    //control.setIsJustUpdated(true); // not used since draw functin frequencies dont seem to be synchronized
    //println ("---------------- Inside Main Draw Function: Setting to True ----------------------");
  //}
  //else{
    //control.setIsJustUpdated(false); // not used since draw functin frequencies dont seem to be synchronized
    //println ("---------------- Inside Main Draw Function: Setting to False ----------------------");
  //}
  
  //println("Inside Main View " + control.getIsJustUpdated());
    
    
  control.updateScatterViewValues();
  control.updateTimeSeriesViewValues();
  control.updateStockDetailViewValues();
  
  //println("Main draw " + millis());
  
  ageOfAnimation++;
} 
