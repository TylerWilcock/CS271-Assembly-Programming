; Author: Tyler Wilcock

; Description:   The goal of this program is to compute the sum of the
;				 integers between 1 and number (n).  It should look
;				 similar to the following program written in a high 
;				 level language.

;		 		 Sum = 0
;		 		 for(int i = 1; i < number; i++) {
;		   		 	Sum = Sum + number;
; 		 		}

org 100h

MOV AX, numOfIterations ; place our number into 16 bit register AX
MOV BX, 0		 		; initialize 16 bit register BX to 0, this will be the register we store our sum in
MOV CX, 0		 		; initialize 16 bit register CX to 0, this will be the register we use as a counter

forLoopI:

	INC CX       		; increment CX at the beginning of each iteration of the loop
	ADD BX, CX   		; add the current counter (CX) to the sum (BX).  Equal to: Sum = Sum + number;
	CMP CX, AX   		; compare the counter register (CX) to our number (AX) to set flags for our jump statement

JNE forLoopI     		; if the counter (CX) does not equal our number (AX), jump back to the forLoopI codeblock

ret
numOfIterations DB 5    ; declare variable named "number"