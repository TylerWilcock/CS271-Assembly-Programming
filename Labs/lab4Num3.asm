; Author: Tyler Wilcock

; Description: The intention of this program is to copy the values
;              of one 16 bit array to another 16  bit array.

org 100h

LEA BX, arrayToBeCopied ; Load the address of the first array, which will be copied, into 16 register BX
LEA BP, arrayToCopyInto ; Load the address of the second array, which will receive the copied values, into BP
MOV DI, 0				; Initialize value of DI

forLoopI:

    MOV CX, [BX+DI]		; Move the 16 bit value of array "pointer" stored in BX at index DI into 16 bit register CX 
    MOV [BP+DI], CX     ; Move the value just stored in CX to the array "pointer" stored in BP at index DI 
    ADD DI, 2 			
    CMP DI, 10 			; DI must move by 2 because we're working with 16 bits rather than 8 bits
    
JNE forLoopI			; if DI isn't 10, the loop isn't finished

ret
arrayToBeCopied DW 1000h, 2000h, 3000h, 4000h, 5000h
arrayToCopyInto DW 0 DUP(5)



