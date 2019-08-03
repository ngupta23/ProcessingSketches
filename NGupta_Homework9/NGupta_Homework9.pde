/* *********************
** Vizualizing Assets **
************************

Visualize all assets that you own with this application. Shows the streaming time series data for the asset value over time.

**** Hierarchy of Classes ****

Asset Class (Abstract)
|----> Cash Class
|----> Real Estate Class
|----> Markets Class (Abstract)
      |----> Individual Stock Class
      |----> Mutual Fund Class

** Base Class (Abstract): Asset
  - Contains functionality that is common to all assets such as asset name, current value, starting value, history of asset value etc.
  - Methods that are not common to all asset types are immplemented as abstract methods
  
** Real Estate and Cash Classes inherit the Asset Base Class 
  - Self explanatory - one is for tracking real estate and the other for cash holdings. 
  - Since each has different fields (real estate can have address but cash will not), we need a separate class for each category
  
** Market Class also inherits Abstract Base Class "Asset", but this itself is an Abstract Class 
  - Represents various markets, such as those for trading individual stocks, bonds, mutual funds. 
  - Each needs to be a separate class since they can have different methods such as those to buy stocks, get present values, trading window, etc.
  
** Individual Stock Class and Mutual Fund Class inherit Market Class and have their own method implementations 
  
USAGE NOTES: 
* View upto 7 assets. You can view more, but colors will start to recycle after that.
* API to get Stock and Mutual Fund Information: https://sandbox.iexapis.com/stable/stock/<Replace Ticker Here>/quote?token=Tpk_07127efe1a5a4bd8a02f35c92305bd1c
* Real Estate and Cash values are placeholders, but could be connected to actual API's in the future to get real data
* History gets plotted only after N points have been collected
* User can change the default value of N if desired
 
Future Enhancements
* Add options to buy and sell assets
* Add other custom fields for each asset - such as Address for Real Estate, etc.

*/


/* **************
** User Inputs **
***************** */

private String[] cashAccounts = {"Chase Savings","Chase Checking"}; // Name of Bank Account
private float[] cashAccountsInitValue = {50000,10000}; // Amount in Accounts
private String[] realEstateAccounts = {"Primary Home","Vacation Home"}; // Name of the Real Estate (unique)
private float[] realEstateAccountsInitValue = {500000,100000}; // Amount in Accounts
private String[] mutualFundAccounts = {"OAKIX"}; // must be ticker
private float[] mutualFundAccountsInitNumber = {5000}; // Number of Stocks owned
private String[] indStockAccounts = {"AAPL","AMZN"}; // must be ticker
private float[] indStockAccountsInitNumber = {1000,200}; // Number of Stocks owned
/* To view color recycling */
//private String[] indStockAccounts = {"AAPL","AMZN","TSLA"}; // must be ticker
//private float[] indStockAccountsInitNumber = {1000,200,500}; // Number of Stocks owned

private int refreshFreq = 1; // in seconds
private int numPointsHistory = 10;

/* ****************
** Global Fields **
******************* */

// Color Scheme
static final int RED    = #FF0000;
static final int ORANGE = #FF7F00;
static final int YELLOW = #FFFF00;
static final int GREEN  = #00FF00; 
static final int BLUE   = #0000FF; 
static final int INDIGO_SUB = #FF00B2;  //#4B0082;
static final int VIOLET = #9400D3;
color[] colors = {RED,ORANGE,YELLOW,GREEN,BLUE,INDIGO_SUB,VIOLET};

/* *****************
** Private Fields **
******************** */
private Controller controller;
private int ageOfAnimation = 0;

// For text
private PFont f;
private int fontSize = 20;

/* *************************************
** Settings, Setup and Draw Functions **
**************************************** */
  
void settings(){ size(800,800); }

void setup() {
  background(0);
  f = createFont("Arial",16,true);
  textFont(f,fontSize);
  
  surface.setTitle("Asset Details"); 
  surface.setLocation(0, 0);

  controller = new Controller(this, numPointsHistory
                          , cashAccounts, cashAccountsInitValue
                          , realEstateAccounts, realEstateAccountsInitValue
                          , mutualFundAccounts, mutualFundAccountsInitNumber
                          , indStockAccounts, indStockAccountsInitNumber);
  
  
  displayBasicInfo();
  
  
  
  
}

void draw(){  //<>//
  if (ageOfAnimation % (refreshFreq*60) == 0){
    controller.updateLatestPriceAll();
    controller.updateTimeSeriesViewValues();
  }
       
  ageOfAnimation++;
  
}

void displayBasicInfo(){
  ArrayList<String> myAssetNames = controller.getAllAssetNames();

  int numAssets = myAssetNames.size();
  float yTick = height/(numAssets+1); // + 1 because of header 
  int i;
  
  
  // Column Headers
  // For text
  textAlign(LEFT); 
  fill(255); // White Headers 
  text("Asset Name",0.05*width,(0.5)*yTick);
  text("Purchase Price",0.40*width,(0.5)*yTick);
  text("# Units Owned",0.70*width,(0.5)*yTick);
    
  // Asset Name
  i = 0;
  for (String myAssetName : myAssetNames) {
    // For text
    textAlign(LEFT); 
    fill(colors[i%7]); 
    text(myAssetName,0.05*width,(i+1.5)*yTick);
    i++;
  }
  
  // Asset Initial Value
  ArrayList<Float> myAssetInitValues = controller.getAllAssetInitValues();
  i = 0;
  for (float myAssetInitValue : myAssetInitValues) {
    // For text
    textAlign(LEFT); 
    fill(colors[i%7]); 
    text("$" + myAssetInitValue,0.40*width,(i+1.5)*yTick);
    i++;
  }
  
  // Asset Number of Units owned
  ArrayList<Float> myAssetNumUnits = controller.getAllAssetNumUnits();
  i = 0;
  for (float myAssetNumUnit : myAssetNumUnits) {
    // For text
    textAlign(LEFT); 
    fill(colors[i%7]); 
    text(myAssetNumUnit,0.70*width,(i+1.5)*yTick);
    i++;
  }  
}
