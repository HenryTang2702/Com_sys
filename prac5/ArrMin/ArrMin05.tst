
load ArrMin.asm,
output-file ArrMin05.out,
compare-to ArrMin05.cmp,
output-list RAM[0]%D2.6.2;

set PC 0,
set RAM[0] 32767, // Set R0
set RAM[1] 20, // Set R1
set RAM[2] 5, // Set R2
set RAM[20] 7, // Set Arr[0]
set RAM[21] 3, // Set Arr[1]
set RAM[22] 2, // Set Arr[2]
set RAM[23] 7, // Set Arr[3]
set RAM[24] 3; // Set Arr[4]
repeat 300 {
ticktock; // Run for 300 clock cycles
}
set RAM[1] 20, // Restore arguments in case program used them
set RAM[2] 5,
output; // Output to file