; Author: Tyler Wilcock

; Description:   The goal of this program is to add the value
;                of each element of the array to register AX,
;                and then move the result to memory location
;                210h.


org 100h
   
MOV AX, 0            
MOV DI, 0                     ; initialize registers to 0
LEA BX, arrayOfNums           ; load address of array into BX

forLoopI:

    ADD AL, [BX+DI]           ; add the value of the array at index DI to register AL
    JC carryBlock             ; if there is a carry resulting from this operation, jump to carry block
    JMP noCarry               ; otherwise if there is no carry, jump to noCarry block
                                     
    carryBlock: ADC AH, 0     ; add carry into 8 bit half of AX
    
    noCarry:
                      
        INC DI
        CMP DI, lengthOfArray ; compare index to the length of the array to set flags
    
JNE forLoopI                  ; jump back to start of for loop if index doesn't match length

MOV [0210h], AX             

ret 
arrayOfNums DB 031h, 032h, 033h, 0A4h
lengthOfArray DW 4