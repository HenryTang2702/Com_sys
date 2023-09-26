// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Mult.asm - Multiply two numbers and store the result in R0

// Initialize R0 to 0
@R0
M=0

// Load the first number into D (R1)
@R1
D=M

// Load the second number into R2
@R2
M=D

// Initialize a counter (R3) to the second number
@R3
M=0

(LOOP)
   // Check if the counter (R3) is equal to the second number
@R3
D=M
@R2
D=D-M
@END
D;JEQ

// Add the first number (R1) to the result (R0)
@R0
D=M
@R1
D=D+M
@R0
M=D

   // Increment the counter (R3) by 1
@R3
M=M+1

// Repeat the loop
@LOOP
0;JMP

(END)
// End of program
@END
0;JMP
