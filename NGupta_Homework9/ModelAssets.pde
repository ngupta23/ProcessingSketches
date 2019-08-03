/* 
Holds Information about a all Assets that the user owns
This serves as the model in the MVC Method
Interfaces with the controller to provide all data updates
*/

class ModelAssets{
  private int numPointsHistory;
  private ArrayList<Asset> myAssets;
  private ArrayList<String> myAssetNames;
    
  private Controller controller;

  /* ***************
  ** Constructors **
  ****************** */
  
  ModelAssets(){
    println("Default Constructor should not be used since the controller needs to be passed to this");
  }
  
  ModelAssets(Controller _control)
  {
    controller = _control;
    this.numPointsHistory = 20;
  }
  
  ModelAssets(Controller _control, int numPointsHistory
              , String[] cashAccounts, float[] cashAccountsInitValue
              , String[] realEstateAccounts, float[] realEstateAccountsInitValue
              , String[] mutualFundAccounts, float[] mutualFundAccountsInitNumber
              , String[] indStockAccounts, float[] indStockAccountsInitNumber){
    controller = _control;
    this.numPointsHistory = numPointsHistory;
    
    myAssets = new ArrayList<Asset>();
    myAssetNames = new ArrayList<String>();

    for (int i=0; i<cashAccounts.length; i++){
      addCashAccount(cashAccounts[i],cashAccountsInitValue[i], numPointsHistory);
      myAssetNames.add(cashAccounts[i]);
    }
  
    for (int i=0; i<realEstateAccounts.length; i++){
      buyRealEstate(realEstateAccounts[i],realEstateAccountsInitValue[i], numPointsHistory);
      myAssetNames.add(realEstateAccounts[i]);
    }
  
    for (int i=0; i<mutualFundAccounts.length; i++){
      buyMutualFund(mutualFundAccounts[i],mutualFundAccountsInitNumber[i], numPointsHistory);
      myAssetNames.add(mutualFundAccounts[i]);
    }
    
    for (int i=0; i<indStockAccounts.length; i++){
      buyIndStock(indStockAccounts[i],indStockAccountsInitNumber[i], numPointsHistory);
      myAssetNames.add(indStockAccounts[i]);
    }
}
  
  
  
  /* ********************** 
  ** Getters and Setters **
  ************************* */
  
  //String[] getTickers(){ return (tickers); }
  int getNumPointsHistory(){ return (numPointsHistory); }
  
  ArrayList getAllAssets() { return (myAssets); }
  
  ArrayList getAllAssetNames() { return (myAssetNames); }
  
  ArrayList getAllAssetInitValues() {
    ArrayList<Float> myAssetInitValues;
    myAssetInitValues = new ArrayList<Float>();
    for (Asset myAsset : myAssets) {
      myAssetInitValues.add(myAsset.getInitValue());
    }    
    return(myAssetInitValues); 
  }
  
  ArrayList getAllAssetNumUnits() {
    ArrayList<Float> myAssetNumUnits;
    myAssetNumUnits = new ArrayList<Float>();
    for (Asset myAsset : myAssets) {
      if (myAsset instanceof Cash | myAsset instanceof RealEstate){
        myAssetNumUnits.add(1.0);
      }
      else if (myAsset instanceof Market){
        myAssetNumUnits.add(((Market)myAsset).getNumStocks());
      }
      else {
        // Default Value 1
        println("WARNING: Type not known. Please check code. Substituting numUnits as 1 for now"); 
        myAssetNumUnits.add(1.0);
      }
    }
    return(myAssetNumUnits); 
  }
  
   
  
  /* ***************** 
  ** Public Methods **
  ******************** */
  
  void updateLatestPriceAll(){
    for (Asset myAsset : myAssets) {
      /*
      if (myAsset instanceof RealEstate){
        print("Real Estate Asset");
      }
      else if (myAsset instanceof Cash){
        print("Cash Asset");
      }
      else if (myAsset instanceof IndividualStock){
        print("Individual Stock Asset");
        print("Open for trade: " + ((Market)myAsset).openForTrade() + " ");
      } 
      else if (myAsset instanceof MutualFund){
        print("Mutual Fund Asset");
        print("Open for trade: " + ((Market)myAsset).openForTrade() + " ");
      } 
      else{
        print("Another type of Asset");
      }
      print (" : " + myAsset.getName()); 
      */
      
      float currentValue = myAsset.getCurrentValue();    
      //println(" >> Value = " + currentValue);
      
    }
  }
  
  ArrayList getPriceHistories(){
    ArrayList<float[]> rvHistories = new ArrayList<float[]>();
        
    for (Asset myAsset : myAssets) {
      rvHistories.add(myAsset.getValueHistory());
    }
    
    return(rvHistories);
  }
  
  void buyRealEstate(String name, float initValue, int numPointsHistory){
    myAssets.add(new RealEstate(name, initValue, numPointsHistory));  
  }
  
  void addCashAccount(String name, float initValue, int numPointsHistory){
    myAssets.add(new Cash(name, initValue, numPointsHistory));  
  }
  
  void buyIndStock(String ticker, float initNumStocks, int numPointsHistory){
    myAssets.add(new IndividualStock(ticker, initNumStocks, numPointsHistory));  
  }
  
  void buyMutualFund(String ticker, float initNumStocks, int numPointsHistory){
    myAssets.add(new MutualFund(ticker, initNumStocks, numPointsHistory));  
  }
  
}
