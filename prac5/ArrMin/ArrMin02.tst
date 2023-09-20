load ArrMin.asm,
output-file ArrMin02.out,
compare-to ArrMin02.cmp,
output-list RAM[0]%D2.6.2;

set PC 0,
set RAM[0] 32767, // Set R0
set RAM[1] 20, // Set R1
set RAM[2] 6, // Set R2
set RAM[20] -5, // Set Arr[0]
set RAM[21] -3, // Set Arr[1]
set RAM[22] -10, // Set Arr[2]
set RAM[23] -1, // Set Arr[3]
set RAM[24] -8, // Set Arr[4]
set RAM[25] -2; // Set Arr[5]
repeat 300 {
ticktock; // Run for 300 clock cycles
}
set RAM[1] 20, // Restore arguments in case program used them
set RAM[2] 6,
output; // Output to file