class ViewTimeSeries extends PApplet{
  
  private static final int VIEW_WIDTH = 800;
  private static final int VIEW_HEIGHT = 800;
  
  private Controller controller;
  
  // Constructor
  public ViewTimeSeries(Controller _control){
    controller = _control;
  }
  
  public void settings(){
    this.size(VIEW_WIDTH, VIEW_HEIGHT);
  }
  
  public void draw(){
    
    
  }
  
  void updateView(float[][] priceHistories){
    for (int i=0; i< priceHistories.length; i++){
      if (glDebug >= 2){
        println("Inside ViewTimeSeries >> New Stock Price");
        for (int j=0; j< priceHistories[i].length; j++){
          print(priceHistories[i][j] + " ");  
        }
        println("");
      }
    }
    // Update code to plot the results
    
  }
  
}
