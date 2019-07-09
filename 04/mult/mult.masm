// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2
M=0
@I
M=1
(LOOP)
@R0
D=M
@I
D=M&D
@NOT_ADD
D;JEQ
@R1
D=M
@R2
M=M+D
(NOT_ADD)
@R1
D=M
M=M+D
@I
D=M
M=M+D
D=M
@R0
D=M-D
@LOOP
D;JGE
(END)
@END
0;JMP
