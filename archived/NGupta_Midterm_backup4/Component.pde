abstract class Component {
  PVector position;
  Dimension dimension;
  String label;
  color labelCol, labelTextCol;
  color offState, onState, overState, pressState;
  color[] states = {
    offState, onState, overState, pressState
  };
  boolean hasBorder = false;
  boolean isSelected = true; // default is selected
  int mouseClickCount=0;

  Component() {
  }

  Component(PVector position, Dimension dimension, 
  String label, color[] states) {
    this.position = position;
    this.dimension = dimension;
    this.label = label;
    labelCol = states[1]; // on by default
    labelTextCol = #000000; // black only
    offState = states[0];
    onState = states[1];
    overState = states[2];
    pressState = states[3];
    this.states = states;
  }
  
  //concrete method
  void setHasBorder(boolean hasBorder){
    this.hasBorder = hasBorder;
  }

  // implement in subclasses
  abstract boolean isHit();
  abstract void display();
}
