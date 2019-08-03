class Controller{
  ModelAssets modelAssets;
  private PApplet mainView;
  private ViewTimeSeries vwTimeSeries;
   
  
  /* ***************
  ** Constructors **
  ****************** */
  
  public Controller(PApplet _mainView, int numPointsHistory
                          , String[] cashAccounts, float[] cashAccountsInitValue
                          , String[]realEstateAccounts, float[] realEstateAccountsInitValue
                          , String[]mutualFundAccounts, float[] mutualFundAccountsInitNumber
                          , String[] indStockAccounts, float[] indStockAccountsInitNumber){
    mainView = _mainView;
    modelAssets = new ModelAssets(this, numPointsHistory
                                  , cashAccounts, cashAccountsInitValue
                                  , realEstateAccounts, realEstateAccountsInitValue
                                  , mutualFundAccounts, mutualFundAccountsInitNumber
                                  , indStockAccounts, indStockAccountsInitNumber);        
    drawViews();                          
  }
  
  /* **********************
  ** Getters and Setters **
  ************************* */
  ArrayList getAllAssetNames(){ return(modelAssets.getAllAssetNames()); }
  ArrayList getAllAssetInitValues(){ return(modelAssets.getAllAssetInitValues()); }
  int getnumPointsHistory(){ return(modelAssets.getNumPointsHistory()); }
  ArrayList getAllAssetNumUnits(){ return modelAssets.getAllAssetNumUnits(); }
     
   
 
 
    
  /* *****************
  ** Public Methods **
  ******************** */
    
  public void updateLatestPriceAll(){
    // Gets the latest stock price for all stocks and updates price history
    modelAssets.updateLatestPriceAll();    
  }
 
  public void updateTimeSeriesViewValues(){
    /* Updates the view with the latest data for all stocks */
    vwTimeSeries.updateViewValues(modelAssets.getPriceHistories());
  }
  
  
  /* ******************
  ** Private Methods **
  ********************* */
  
  private void drawViews(){
    vwTimeSeries = new ViewTimeSeries(this);
    PApplet.runSketch(new String[]{ "--display=2", "--location=810,0", "Time Series Data"}, vwTimeSeries);
  }
  
   
}
