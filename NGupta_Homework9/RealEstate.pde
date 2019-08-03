
class RealEstate extends Asset{
    
  /* Fields >> Add Address -- for future enhancement */
    
  RealEstate(){
  }
  
  RealEstate(String name, float startValue, int numPointsHistory){
    super(name, numPointsHistory);
    this.startValue = startValue;
    this.currentValue = startValue;
  }
  
  float getCurrentValue(){
    // Placeholder for now, future enhancement is to pull from actual API sich as Zillow, etc.
    currentValue = currentValue * random(0.98, 1.02); // Increase or decrease account by upto 2% as a placeholder 
    updateValueHistory(currentValue);
    return (currentValue);
  }  
  
  
 
}
