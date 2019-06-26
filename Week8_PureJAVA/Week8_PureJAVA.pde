// Must be named <class_name>.JAVA in JAVA

public class Pizza {  // inclusion of the word public is required for JAVA (not required in Processing)

  /* Fields
  - Convention is to make the fields private and methods public (unless just used internally)
  */
  
  private String[] toppings;
  private float diameter;
  private float price;
  
  // constructors
  public Pizza(){
      //println("What's up everybody!"); // processing
      System.out.println("What's up everybody!"); // JAVA
      // System is the name of a class; out is an OutputStream object
  }
  
  public Pizza( String[] toppings, float diameter, float price){
      System.out.println("In overloaded constructor"); // JAVA
  }
  
  /* Methods */
  public void assemble(){
    
  }
  
  /* Getters and Setters */
  public void setPrice(float price){
    if (price > 0 && price < 50){  
      this.price = price;
    }
  }
  
  public float getPrice(){
    return price;
  }
    
  /* ***************
  ** MAIN Methods **
  ****************** 
  
  - In JAVA, main method must also be included
  - Processing automatically adds a main method for us
  
  - Main method is automatically invoked when one execites the JAVA program
  - Can have multiple main methods in the program
  
  - Static means all instances of that class have the same value for that variable/method
  - We do not need to create unique copies of that method in each object
   
  */
  public static void main(String[] args){
    Pizza p = new Pizza();
  }
  
}
