; Author: Tyler Wilcock

; Description: The intention of this program is to convert the
;              for loop below into assembly language.
                                            
; 	       Sum = 0;
; 	       Array = {0, 1, 2, 3, 4, 5, 6};
; 	       for(int i = 0; i < 6; i++) {
;	            Sum = Sum + Arr[i];
; 	       }                                     
                                     
org 100h

MOV DI, 0      ; set Destination Index register to 0
LEA BX, Array  ; load the memory address of Array into 16 bit register BX
MOV AL, 0      ; initialize Sum variable

forLoopI:

	ADD AL, Array[DI] ; Add the previous sum to the value of Array at subscript DI.  Alternate instruction would be [BX + DI].
			  ; Just on a sidenote for my own personal reasons and understanding, this assembly program and instruction
			  ; [BX + DI] would be equivalent to something like this in C++:
			  ;
			  ; int arrayOfNums[6] = {0, 1, 2, 3, 4, 5, 6}; 
			  ; int *arrayPtr;
			  ; p = numbers; // p now points to first address in "arrayOfNums", which is the value of 0
			  ; p++;         // p now points to value of 1 in "arrayOfNums"
	INC DI
	CMP DI, 6

JL forLoopI
	
ret
Array DB 0, 1, 2, 3, 4, 5 ; creates an array of numbers, using bytes and not "words"



