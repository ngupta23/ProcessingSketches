void setup(){
 int[] vals; // declare vals array of type int
 vals = new int[45000]; // set length of array
 print(vals); // gives address in memory that vals is referring to (the 1st integer of the array)
 vals[0] = 35;
 println();
 println(vals[0]);
 for(int i = 0; i < vals.length; i++){
   vals[i] = int(random(1000)); //random returns a float, hence we need to type cast
 }
 println(vals[1]);
}
