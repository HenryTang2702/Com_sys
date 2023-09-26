// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// R1 contains the address of the first element in the array
// R2 contains the length of the array
// R0 is the output to be set to -1 when the program finishes

// R1 contains the address of the first element in the array
// R2 contains the length of the array
// R0 is the output to be set to -1 when the program finishes

// ArrSort.asm
// Sorts an array in-place in ascending order using Bubble Sort.
// Inputs:
// - R1: RAM address of the first element in the array
// - R2: Length of the array
// Outputs:
// - R0: True (-1) when the program finishes

// Initialize R0 to True (-1)
@R0
M=-1

// Load the array address into a pointer (R3)
@R1
D=M
@R3
M=D

// Outer loop: iterate through the array
(OUTER_LOOP)
    // Set a flag to track if any swaps were made in this pass
    @0
    D=A
    @SWAP_FLAG
    M=D

    // Inner loop: compare and swap adjacent elements
    (INNER_LOOP)
        // Load the current element (R3 points to it)
        @R3
        D=M
        // Load the next element (R3+1 points to it)
        @R3
        A=M+1
        D=D-M
        // If D is positive or zero, no swap is needed, go to next iteration
        @NO_SWAP
        D;JGE

        // Swap the elements
        @R3
        D=M
        @R3
        A=M+1
        M=D
        @R3
        D=A
        @R3
        A=M+1
        M=D

        // Set the swap flag to True (1)
        @1
        D=A
        @SWAP_FLAG
        M=D

    (NO_SWAP)
        // Move to the next pair of elements
        @R3
        M=M+1
        // Check if we've reached the end of the array
        @R2
        D=M
        @R3
        D=D-A
        // If we haven't reached the end, continue the inner loop
        @INNER_LOOP
        D;JNE

    // If no swaps were made in this pass, the array is sorted
    @SWAP_FLAG
    D=M
    @OUTER_LOOP
    D;JEQ

// End of the program
@END
0;JMP