// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// set i to 0, R2 to 0

// start loop
// if loop equal to R1, jump to end
// else
	// add R2 and R0

@i
M=0

@R2
M=0


(LOOP)
	// if (i == R1) go to END
	@i
	D=M
	@R1
	D=M-D
	@END
	D;JEQ

	// add R0 to R2
	@R2
	D=M
	@R0
	D=D+M
	@R2
	M=D

	@i
	M=M+1

	@LOOP
	0;JMP

(END)
	@END
	0;JMP
