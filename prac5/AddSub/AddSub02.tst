load AddSub.asm,
output-file AddSub02.out,
compare-to AddSub02.cmp,

set RAM[1] -1,  // Set R1
set RAM[2] 11,   // Set R2
set RAM[3] 1;    // Set R3

repeat 100 {
  ticktock;    // Run for 100 clock cycles
}

output;        // Output to file
