; Author: Tyler Wilcock

; Description:   The goal of this program is to add the value
;                of the 3 numbers, and store the result in
;                offset 210h.

org 100h

MOV AX, 0            ; initialize register AX to 0    

ADD AX, variableNum1    
ADD AX, variableNum2 
ADD AX, variableNum3 ; add the three values to 16 bit register AX

MOV [0210h], AX      ; move the total value from AX to location 0210h

ret 
variableNum1 DW 1000h 
variableNum2 DW 2000h
variableNum3 DW 3000h ; declare the 3 variables requested by the assignment