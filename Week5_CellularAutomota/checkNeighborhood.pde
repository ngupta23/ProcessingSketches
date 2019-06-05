int checkNeighborhood(int bit0, int bit1, int bit2){
  for (int i=0; i<states.length; i++){
    //if we have a match, return the corresponding rule
    if (states[i][0] == bit0 && states[i][1] == bit1 && states[i][2] == bit2){
      return(rules[i]);
    }
  }
  
  return 0;
}
