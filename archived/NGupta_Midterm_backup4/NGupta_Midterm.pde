/* *************************
** Vizualizing Stock Data **
****************************

Simultaneously visualize stock prices for multiple stock indices. 3 views are provided using Live Data from the web

(1) Animated Scatterplot 
    * Top half visualizes scatterplot of percentage daily change in stock price
    * Bottom half visualizes N-point Moving Average of Percentage Daily Change
        - Default N = 20 which is useful for computing the Bollinger's Band (indicator of stock volatility)
(2) Streaming time series data
(3) Stock Data Vizualization 

Stock Indices Chosen (user can change these as needed)
* VOO (US Large Cap) 
* VEU (Developed International)
* BND (US Bond Market)
* VNQ (US Real Estate Market)

API: https://sandbox.iexapis.com/stable/stock/<Replace Ticker Here>/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c

NOTES: 
* N-point Moving Average and Time Series data only gets plotted after N points have been collected
* N-point Moving Average will be less volatile than daily change and this will be clearly visible in the animated scatterplot
* User can change the default value of N if desired
* Scatterplot automatically resizes based on number of stocks picked by user. However fo best use, it is recommended not to visualize more than 4 or 5 stocks at a time.

Future Enhancements
(1) Axis Labels for Time Series
(2) Update View 3 (or add a 4th view) into a visualization instead of text
(3) For current View 3, add Company information (text) with text wrapping

*/


/* **************
** User Inputs **
***************** */

private String[] tickers = {"VOO","VEU","BND","VNQ"};
//private String[] tickers = {"VOO","IVOO","VEU","BND","VNQ"}; // check autoResizing 1
// Not recommended to view more than 5 stocks at a time due to size constraints and overload of information
//private String[] tickers = {"VOO","IVOO","VIOO","VEU","BND","VNQ"}; // check autoResizing 2 
//private String[] tickers = {"VOO","IVOO","VIOO","VEU","VWO","BND","VNQ"}; // check autoResizing 3

private int numPointMA = 20;
private int refreshFreq = 1; // in seconds


/* *******************
** Global Variables **
********************** */

// for debugging program number indicates different levels of verbosity (this is an alternate to using the debug utility which is slower to use)
// 0 = no debug statements
// 1 = basic debug statements (no prints in draw functions)
// 2 = detailed debug statements (may include print statements in draw functions)
// 3 = detailed debug statements (may include print statements in draw functions) - must be careful to use this (useful only when programmed is killed immediately to check the print console)
int glDebug = 0; 

// Global Color Scheme
static final int RED    = #FF0000;
static final int ORANGE = #FF7F00;
static final int YELLOW = #FFFF00;
static final int GREEN  = #00FF00; 
static final int BLUE   = #0000FF; 
static final int INDIGO = #4B0082;
static final int VIOLET = #9400D3;
color[] colors = {RED,ORANGE,YELLOW,GREEN,BLUE,INDIGO,VIOLET};

/* *****************
** Private Fields **
******************** */
private Menu menu;
private Controller control;
private int ageOfAnimation = 0;

/* *************************************
** Settings, Setup and Draw Functions **
**************************************** */
  
void settings(){ size(100*tickers.length,50); }

void setup() {
  surface.setTitle("Filters"); // Main View is the filters for the Stocks
  surface.setLocation(810, 830);

  control = new Controller(this, tickers, numPointMA);
  color[] states = {#FF0000, #00FF00, #FFFF00, #0000FF };  //offState (red), onState (green), overState (yellow), pressState (blue)
  menu = new Menu(Layout.TOP, new Dimension(width, height), tickers, states, ButtonType.RECT);
}

void draw(){  //<>//
   
  menu.display();
  boolean[] selectedButtons = getSelectedTickers();
  
  if (ageOfAnimation % (refreshFreq*60) == 0){
    control.updateLatestPriceAll(); 
    control.updateAllData();
    control.updateScatterViewValues(selectedButtons);
    control.updateTimeSeriesViewValues(selectedButtons);
    control.updateStockDetailViewValues(selectedButtons);
  }
       
  ageOfAnimation++;
} 

/* ****************** 
** Private Methods **
********************* */

private boolean[] getSelectedTickers(){
  return (menu.getSelected()); 
}
