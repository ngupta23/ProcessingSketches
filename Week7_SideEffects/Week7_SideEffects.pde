Pizza pizza;  // global variable, stays in memory for the entire lifetime of the program

void setup(){
  int x = 0; // assigned in stack memory
  pizza = new Pizza(); // new() will assign memory in heap for the global variable pizza
  Pizza pizza2 = new Pizza(); // new() will assign memory in heap for the local variable pizza2
  
  // (1) If we add the line below, then the heap memory for pizza2 will not be Garbage collected 
  //     since we have a global variable pointing to that location as well.
  // (2) Without this line, since pizza2 is a local variable, the heap memory will be 
  //     garbage collected at the end of the local setup block 
  pizza = pizza2; 
}
