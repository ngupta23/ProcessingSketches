final int x = 4; // final means that we can not change it (like a constant but symbolic constant)
// x = 5; will give error
print (x*2);

int y;
y = 3;

int z = y;
print (z);

float w = 3.4;
print ("\n" + w);

// We need static typing (have to specify what the datatype is for each variable)

// Good Naming Convention
float a = 3.5;
// float 3x = 3.5; // Will not work, have to start with letter or _

// always begin naming with lowercase letters
// Use CamelCase 
// Note string keyword starts with capital S 
String largeCat = "Felix";


// Statements, Expressions, Order of Operations and Blocks
int _var1;
//println(_var1); // _var1 is a local variable and by just declaring, it is not initialized so it gives error
_var1 = 3;
print ("\n" + _var1);
