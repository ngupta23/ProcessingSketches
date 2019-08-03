/* Base Class */

abstract class Asset{
  String name;
  float startValue;
  float currentValue;
  float[] valueHistory;
  int numPointsHistory;
  
  Asset(){
  }
  
  Asset(String name, int numPointsHistory){
    this.name = name;
    this.numPointsHistory = numPointsHistory;
    valueHistory = new float[numPointsHistory];
  }
    
  abstract float getCurrentValue();
  
  void updateValueHistory(float currentValue){
    // Shift all left by one
    for (int i = 0; i < numPointsHistory - 1 ; i++){
      valueHistory[i] = valueHistory[i+1];
    }
    
    // append latest price at the end
    valueHistory[numPointsHistory-1] = currentValue;
  }
  
  String getName(){ return (this.name); }
  float[] getValueHistory(){ return (valueHistory); }
  float getInitValue(){ return (round(startValue)); }
   
  
    
}
