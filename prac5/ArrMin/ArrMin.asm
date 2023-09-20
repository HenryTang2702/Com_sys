// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R1
D=M
@R3
M=D

@R2
D=M
@R4
M=D

@R3
A=M
D=M
@R0
M=D

@R3
M=M+1
@R4
M=M-1

(LOOP)
@R4
D=M
@END
D;JEQ

@R3
A=M
D=M

@R0
D=D-M
@SKIP
D;JGE

@R3
A=M
D=M
@R0
M=D

(SKIP)
@R3
M=M+1
@R4
M=M-1
@LOOP
0;JMP

(END)
@END
0;JMP
