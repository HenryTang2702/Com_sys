// Calculates the absolute value of R1 and stores the result in R0.
// (R0, R1 refer to RAM[0], and RAM[1], respectively.)

// Put your code here.

// Store input -> R0
@R1
D=M

@R0
M=D

// If value is negative, negate it
@R0
D=M

@NEGATIVE
M=D

@R0
D=M

@END
D;JGE

@R0
M=-M
@END
// End of program
(NEGATIVE)
@END

(END)
@END
0;JMP