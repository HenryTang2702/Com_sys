// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// R1 contains the address of the first element in the array
// R2 contains the length of the array
// R0 is the output to be set to -1 when the program finishes

// R1 contains the address of the first element in the array
// R2 contains the length of the array
// R0 is the output to be set to -1 when the program finishes

@R2
D=M
@LENGTH
M=D

@R1
D=M
@ARRAYSTART
M=D

(LOOP)
@LENGTH
D=M
@END
D;JLE


@ARRAYSTART
D=M
@I
M=D


@LENGTH
D=M
@J
M=D

(SUBLOOP)
@J
D=M
@ENDSUBLOOP
D;JLE

@I
D=M

@TEMP1
M=D

@I
D=M
@TEMP2
M=D+1



@TEMP1
A=M
D=M
@TEMP3
M=D

@TEMP2
A=M
D=M
@TEMP4
M=D

@TEMP3
D=M
@TEMP4
D=D-M
@SWAP
D;JGT

(NOSWAP)
@I
M=M+1
@J
M=M-1
@SUBLOOP
0;JMP

(SWAP)
@TEMP1
A=M
@TEMP4
D=M
M=D

@TEMP2
A=M
@TEMP3
D=M
M=D

@I
M=M+1

@J
M=M-1

@SUBLOOP
0;JMP

(ENDSUBLOOP)
@ARRAYSTART
M=M+1
@LENGTH
M=M-1
@LOOP
0;JMP

(END)
@R0
M=-1