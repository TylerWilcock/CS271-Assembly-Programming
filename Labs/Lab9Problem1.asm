org 100h

MOV CL, 10110010b          ; move initial binary value into function
MOV DI, 0                  ; set loop iterator value to 0

forLoopI:

    SHL CL, 1              ; shift one bit off into the carry flag

    JC printOne            ; if the MSB was a 1, jump to printOne codeblock
    JNC printZero          ; if the MSB was a 0, jump to printZero codeblock

    printOne:

        MOV DL, '1'        ; move character to be printed into DL
        MOV AH, 05h        ; set interrupt offset
        INT 21h
        
        INC DI             ; increment loop iterator value
        CMP DI, 8          ; set flags to check for completion
        JNE forLoopI       ; if loop hasn't executed 8 times, jump back to the top

    printZero:

        MOV DL, '0'        ; move character to be printed into DL
        MOV AH, 05h        ; set interrupt offset
        INT 21h
        
        INC DI             ; increment loop iterator value        
        CMP DI, 8          ; set flags to check for completion
        JNE DI forLoopI    ; if loop hasn't executed 8 times, jump back to the top

ret




