public class Controller{
  
  // Fields
  private Pizza p;
  
  // Constructor
  public Controller(){
  }
  
  public Controller(Pizza p){
    this.p = p;  
    // System.out.println(p.price); 
    // Trying to access a private field - will not work; Use getter instead
    System.out.println(p.getPrice()); // works
  }
  
  // Main
  public static void main(String[] args){
    Controller c = new Controller(new Pizza());
  }
    
}
