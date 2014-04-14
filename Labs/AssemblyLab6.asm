; Author: Tyler Wilcock
; Date: Wednesday, April 2, 2014
; The purpose of this program is to use interrupts to display Hello World.

org 100h
       
MOV AL, 0h         ; set number of lines to scroll to 0

MOV BH, 70h        ; write 70 blank lines at bottom of window

MOV CX, 0000h      ; set row and column of window's upper left corner to 0

MOV DX, 184Fh      ; set row of window's lower right corner to 18h and column of window's lower right corner to 4Fh

MOV AH, 06h        ; set interrupt offset; 06h scrolls window up
INT 10h            
 
; ------------- 

MOV DH, 10         ; set row to 10
MOV DL, 20         ; set column to 20
MOV BH, 0          ; set page number to 0

MOV AH, 02         ; set interrupt offset to 02, which sets the cursor position
INT 10h

; -------------

MOV DX, OFFSET msg ; move the memory address of our message into 16 bit register DX

MOV AH, 09         ; set interrupt offset to 09, which displays the string from DX
INT 21h            

ret
   
msg DB "HELLO WORLD$"



