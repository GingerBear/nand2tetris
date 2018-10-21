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


// set column length
@8191
D=A
@n
M=D

// set black or white, 0 is white, -1 is black
@bow
M=0

// set key press 
@k
M=0

(RESET)
	// set row index
	@i
	M=0

	// set base screen
	@SCREEN
	D=A
	@address
	M=D

(LOOP)
	// if i > n, jump to end
	@i
	D=M
	@n
	D=D-M
	@LOOPKBD
	D;JGT

	// set row to black or white
	@bow
	D=M
	@address
	A=M
	M=D

	// i=i+1, address=address+1
	@i
	M=M+1
	@address
	M=M+1

	@LOOP
	0;JMP

(LOOPKBD)
	// reset if not equal
	@k
	D=M
	@KBD
	D=M-D

	@SETBLACK
	D;JGT

	@SETWHITE
	D;JLT

	@LOOPKBD
	0;JMP

(SETWHITE)
	// set new @k value
	@KBD
	D=M
	@k
	M=D

	// set color flag white
	@bow
	M=0

	@RESET
	0;JMP

(SETBLACK)
	// set new @k value
	@KBD
	D=M
	@k
	M=D

	// set color flag black
	@bow
	M=-1

	@RESET
	0;JMP