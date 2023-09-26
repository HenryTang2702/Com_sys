load Abs.asm,
output-file Abs01.out,
compare-to Abs01.cmp,

set RAM[1] -3;   // Set R1 to a negative value

// Run the program
output;

// Check the result in R0 (should be 3, the absolute value of -3)
compare RAM[0] 3,

// Restore arguments in case program used them
set RAM[1] -3,
set RAM[0] 0,

output;        // Output to file