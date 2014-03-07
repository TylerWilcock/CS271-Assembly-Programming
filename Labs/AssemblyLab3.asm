; Author: Tyler Wilcock

; Description: The intention of this program is to use a loop
;              to count the number of one's within the loaded
;              binary value.               


org 100h

MOV CX, 0              ; initialize CX to zero
MOV [0500h], 11010111b ; load binary number into memory location 500h
MOV AX, [0500h]        ; move binary number into register AX

loopOne:   
                       ; begin loop
    SHR AX, 1          ; shift register AX right one space

    JC increment       ; if 1 was shifted off AX, carry flag will be one.  Jump to inc block
    JMP notIncrement   ; if 0 was shifted off, jump to non increment block

    increment:       
        INC CX         ; inc CX register to count 1's shifted off
    notIncrement:
        CMP AX, 0      ; if entire value is 0, comp flag is set to true
        
JNZ loopOne            ; check CMP flag, if set exit the loop     
    
ret