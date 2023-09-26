// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

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

// Initialize R0 to 0
@R0
M=0

// Load R1 into D
@R1
D=M

// Check if R2 is negative
@R2
D;JLT
// If R2 is negative, negate it and set a flag in R3
@R3
M=0
@R2
D=M
@R2
M=-D
@R3
M=1

(STEP)

// If R2 is not zero, add R1 to R0 and decrement R2
@R0
D=M
@R2
D;JNE
// If R2 is zero, check if it was originally negative
@R3
D;JEQ
// If R2 was originally negative, negate the result in R0
@R0
M=-M

(END)
@END
0;JMP