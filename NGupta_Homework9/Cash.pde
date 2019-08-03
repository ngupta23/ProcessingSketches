class Cash extends Asset{

  Cash(){
  }
  
  Cash(String name, float startValue, int numPointsHistory){
    super(name, numPointsHistory);
    this.startValue = startValue;
    this.currentValue = startValue;
  }

    
  float getCurrentValue(){
    // Placeholder for now, future enhancement is to pull from actual API from a Bank.
    currentValue = currentValue * random(0.995, 1.005); // Increase or decrease account by upto 0.5% as a placeholder
    updateValueHistory(currentValue);
    return (currentValue);
  }
  
  
  
}
