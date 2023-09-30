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
@R0      // Initialize R0 to 0
M=0
@3
M=0

@R1
D=M
@Positive
D;JGE

@3
M=1
// make R1 to be positive
@R1
M=-M

(Positive)

(LOOP)
    @R1      // If the first number is 0, exit the loop
    M=M-1
    D=M
    @ENDLOOP
    D;JLT

    @R2
    D=M
    @R0
    M=M+D
@LOOP    // Repeat the loop
0;JMP

(ENDLOOP)

@3
D=M
@NoNeedTimesNegative
D;JEQ

@R0
M=-M

(NoNeedTimesNegative)



// Halt the program
@END
0;JMP

(END)
@END
0;JMP
