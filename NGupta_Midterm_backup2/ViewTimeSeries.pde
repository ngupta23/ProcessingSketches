class ViewTimeSeries extends PApplet{
  
  private static final int VIEW_WIDTH = 800;
  private static final int VIEW_HEIGHT = 800;
  
  private Controller controller;
  private String[] tickers;
  private int numPointMA;
  private float[][] priceHistories;
  
  //float[][] priceHistory = new float[][];
  
  /* ***************
  ** Constructors **
  ****************** */
  
  public ViewTimeSeries(Controller _control){
    controller = _control;
    numPointMA = controller.getNumPointMA();
    tickers = controller.getTickers();
    priceHistories = new float[tickers.length][numPointMA];
    
    if (glDebug >=2){
      println ("Inside ViewTimeSeries Controller Constructor");
      for (int i=0; i < tickers.length; i++){
        println(tickers[i]);
      }
    }
        
  }
  
  public void settings(){
    this.size(VIEW_WIDTH, VIEW_HEIGHT);
  }
  
  public void draw(){
    for(int i=0; i<priceHistories.length; i++){
      fill(i*50);
      for (int j=0; j< priceHistories[i].length; j++){
        println(j);
        ellipse(j*20,priceHistories[i][j],10,10);
      }
    } 
  }
  
  void updateViewValues(float[][] priceHistories){
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
    
    this.priceHistories = priceHistories;
    
  }
  
}
