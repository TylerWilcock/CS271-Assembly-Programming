; Author: Tyler Wilcock
; Date Monday, April 14, 2014
; The purpose of this program is to apply an exponent to the number in CL using only shift instructions, and display the result.
; I was not able to finish this program in class, but I hope to get to it soon.

org 100h

MOV CL, 6          ; set number to be multiplied
MOV DI, 0          ; set loop iterator value

forLoopI:

   MOV AL, CL      ; store number to be multiplied in AL
   SHL AL, 2       ; shift number 2 bits
   SHL CL, 1       ; shift number 1 bit
   ADD CL, AL      ; add both of the previous shifts together
   
   INC DI          ; increment loop iterator value
   CMP DI, exponentMinusOne ; check to see if loop has executed correct number of times
 
JNE forLoopI

MOV DL, CL  
MOV AH, 05h
INT 21h      ; my attempt at displaying the number, this currently doesn't work properly

ret
exponentMinusOne DW 0



