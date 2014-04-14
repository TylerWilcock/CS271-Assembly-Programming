org 100h

MOV DI, 0                  ; Initialize DI to 0
LEA BX, message            ; Load the address of string 'message' into BX

loop1:             		   ; We will use this loop to change the change the value of letters in 'message' to capital letters

    MOV CX, [BX+DI]   	   ; Put the current char value into CX
    SUB CX, 32        	   ; Subtract the letter by 32 to turn it into a capital letter
    MOV [BX+DI], CX   	   ; Move the capital letter back into the array
    ADD DI, 1              ; Increment the pointer
    CMP DI, messageSize    ; Check loop condition

JNE loop1

    MOV DI,0      		   ; Reset the pointer variable 
   	MOV DH, 10    		   ; Set where the cursor will start
	MOV DL, 20     	

loop2:                     ; This loop prints out the letters stored in 'message'
	    
	MOV BH, 0      		   ; Set page number
	MOV AH, 2              ; Set interrupt offset
	INT 10h                

	MOV AL, message + DI   ; Move current 'message' element into AL
    MOV BH, 0              ; Set page number
    MOV BL, textColor      ; Set text color
    MOV CX, 1              ; Set the number of times to print the character
	MOV AH, 09h            ; Set interrupt offset
	INT 10h
	
	INC textColor          ; Increment the text color
	INC DI         		   ; Increment the pointer
	INC DL                 ; Increment the writing position
	CMP DI, messageSize    ; Check loop conditions

JNE loop2

    MOV AH, 1              ; Wait for the keystroke
	INT 21h	                

ret

message db "helloworld$" 
messageSize dw 10
textColor db 04
  


