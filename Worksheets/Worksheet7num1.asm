; Author: Tyler Wilcock

; Description:   The goal of this program is to convert the following
; 		 for loop into assembly language.

; 		 Sum = 0
; 		 for(int i = 1; i < 100; i++) {
;   		 	Sum = Sum + 2;
; 		 }

org 100h

MOV AX, 0 ; Initialize our AX register and use it as our sum
MOV CX, 1 ; Use register CX as our 'i', increment and compare to 100

forLoopI:

    ADD AX, 2   ; Add to sum register
    INC CX      ; Increment 'i' counter
    CMP CX, 100 ; Compare 'i' counter flag to 100
    
JNE forLoopI ; if our 'i' does not equal 100, jump back to forLoopI

ret




