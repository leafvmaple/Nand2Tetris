// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
@I
M=0
@BASE
M=0
(ROW_LOOP)
@J
M=0
(COLUM_LOOP)
@BASE
D=M
@J
D=D+M
@SCREEN
D=D+A
@INDEX
M=D
@KBD
D=M
@WHITE
D;JEQ
D=-1
@DEFAULT
0;JMP
(WHITE)
D=0
(DEFAULT)
@INDEX
A=M
M=D
@J
D=M+1
M=D
@32
D=A-D
@COLUM_LOOP
D;JGT
@BASE
D=M
@32
D=D+A
@BASE
M=D
@I
D=M+1
M=D
@256
D=A-D
@ROW_LOOP
D;JGT
@LOOP
0;JMP