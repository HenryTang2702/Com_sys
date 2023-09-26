// // This file is based on part of www.nand2tetris.org
// // and the book "The Elements of Computing Systems"
// // by Nisan and Schocken, MIT Press.
// // File name: Mult.asm

// // Multiplies R1 and R2 and stores the result in R0.
// // (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// // Put your code here.

// @R0
// M=0

// @R1
// D=M
// @STEP
// D;JGT


// @END
// 0;JMP


// (STEP)

// @R0
// D=M

// @R2
// D=D+M

// @R0
// M=D

// @R1
// D=M-1
// M=D

// @STEP
// D;JGT

// (END)
// @END
// 0;JMP


// Start R2 at 0.
@R2
M=0

// Jump into the first STEP if R0 > 0.
@R0
D=M
@STEP
D;JGT

// If it didn't jump, go to END.
@END
0;JMP

// Adds R1 to R2 and removes 1 from R0.
// If R0 is more than 0 we step again.
(STEP)
    // Get R2.
    @R2
    D=M

    // Add R1 to it.
    @R1
    D=D+M

    // And write the result back to R2.
    @R2
    M=D

    // Reduce R0 by 1.
    @R0
    D=M-1
    M=D

    // If R0 is still > 0 then loop.
    @STEP
    D;JGT

(END)
    @END
    0;JMP