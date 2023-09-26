load Abs.asm,
output-file Abs01.out,
compare-to Abs01.cmp,

set RAM[0] 0,   // Set R0
set RAM[1] 0;   // Set R1 to 0

repeat 100 {
  ticktock;    // Run for 100 clock cycles
}

set RAM[1] 0,   // Restore arguments in case program used them

output;        // Output to file