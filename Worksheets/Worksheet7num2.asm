; Author: Tyler Wilcock

; Description: The intention of this program is to convert the
;              following program to assembly language.

;	       a = 10;
; 	       b = 1;
; 	       if((a > 0) && (b >= 0))
; 	       {
;	       	   c = a;
; 	       }  

org 100h       
         
CMP a, 0   ; use CMP to set flags
JLE end    ; in above if statement, "a" must not be less than or equal to zero.  Therefore, we use JLE (Jump if less than or equal to) to jump to end if that is the case

CMP b, 0   ; use CMP to set flags
JNGE end   ; in above if statement, "b" must be greater than or equal to 0.  Therefore, we use JNGE (Jump if not greater than or equal to) to jump to end if that is the case

MOV AL, a  ; if we make it to this instruction, both conditions were met
MOV c, AL  ; most value of variable "a" to variable "c"

end

ret
a DB 10 ; declare variables, a = 10, b = 1, c = 0
b DB 1
c DB 0



