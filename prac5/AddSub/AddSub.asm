// Calculates R1 + R2 - R3 and stores the result in R0.
// (R0, R1, R2, R3 refer to RAM[0], RAM[1], RAM[2], and RAM[3], respectively.)

// Put your code here.

// R1 -> memory 16
@R1
D=M

@16
M=D


// R2 -> memory 16
@R2
D=M

@17
M=D

// R3 -> memory 18
@R3
D=M

@18
M=D

// R1+R2 -> R0
@16
D=M
@17
D=D+M
@0
M=D

// R0-R3 ->R3
@18
D=M
@0
M=M-D


(END)
@END
0;JMP