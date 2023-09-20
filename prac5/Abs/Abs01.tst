load Abs.asm,
output-file Abs01.out,
compare-to Abs01.cmp,

set RAM[0] 0,   // Set R0
set RAM[1] -3;   // Set R1 to a negative value

repeat 100 {
  ticktock;    // Run for 100 clock cycles
}

set RAM[1] -3,   // Restore arguments in case program used them
set RAM[0] 0,   // Restore arguments in case program used them

output;        // Output to file