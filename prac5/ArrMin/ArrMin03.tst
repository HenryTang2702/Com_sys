
load ArrMin.asm,
output-file ArrMin03.out,
compare-to ArrMin03.cmp,
output-list RAM[0]%D2.6.2;

set PC 0,
set RAM[0] 32767, // Set R0
set RAM[1] 20, // Set R1
set RAM[2] 2, // Set R2
set RAM[20] 10; // Set Arr[0]
repeat 300 {
ticktock; // Run for 300 clock cycles
}
set RAM[1] 20, // Restore arguments in case program used them
set RAM[2] 2,
output; // Output to file