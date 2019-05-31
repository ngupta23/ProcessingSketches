int x = 5;
int y = x;
y = 3;
println(x);

int[] vals1 = {3,4,6,78,9};
int[] vals2 = {-13,409,556,-278,81};
vals1 = vals2; 
// vals1 is only assigned the reference of vals2 so 
// it points to where vals2 points in memory
// it is not given the values in vals2
vals1[0] = 777;

println(vals1[0]);
println(vals2[0]);
