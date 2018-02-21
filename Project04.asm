TITLE Program Template     (Project04.asm)

; Author: Ryan Wallerius
; Course / Project ID   CS 271              Date: 5/12/17
; Description: This program is going to take user input, validate it and once it is validated
; it will display all of the composite numbers up to the number specified and be displayed in 
; a certain format

INCLUDE Irvine32.inc

UPPERLIMIT  = 400;

.data

titleprog			BYTE	"Composite Numbers				By Ryan Wallerius ", 0
instructions		BYTE	"This program will have you enter the number of composite numbers you want to be dispalyed! ", 0
instructions1		BYTE	"The range you are allowed is [1, 400]", 0
instructions2		BYTE	"Please enter the number of numbers you wish to be displayed: ", 0	
composite			DWORD	? 
numberComposite		DWORD	?
temp				DWORD	?
error				BYTE	"The number you entered is out of range. You will have to enter again!", 0
displayComposite	BYTE	"Composite Numbers: ", 0
displayComposite1	BYTE	"You want me to show you ", 0
displayComposite2	BYTE	" composite numbers ", 0
spaces				BYTE	"     ", 0
conclusion				BYTE	"Sorry I couldn't figure this out. Thanks for using my program!", 0



.code
main PROC

call intro
call getUserData
call ShowComposite
call goodbye

	exit	; exit to operating system
main ENDP

intro	PROC

	mov edx, OFFSET titleprog
	call WriteString
	call CrLf
	call CrLf
	call CrLf
	mov edx, OFFSET instructions
	call WriteString
	call CrLf
	mov edx, OFFSET instructions1
	call WriteString
	call CrLf
	call CrLf
	call CrLf

		ret
 intro	ENDP

 getUserData	PROC

	mov edx, OFFSET instructions2
	call WriteString
	call ReadDec
	call validate

		ret

getUserData		ENDP

 validate	PROC

 mov numberComposite, eax
 cmp eax, UPPERLIMIT
 JG	 invalid
 cmp eax, 1
 JL  invalid
 ret

 invalid: 
 mov edx, OFFSET error
 call WriteString
 call CrLf
 jmp getUserData

	ret
 validate	ENDP

 ShowComposite	PROC

	call CrLf
	mov edx, OFFSET displayComposite1
	call WriteString
	mov	eax, numberComposite
	call WriteDec
	mov edx, OFFSET displayComposite2
	call WriteString
	call CrLf
	mov edx, OFFSET displayComposite
	call WriteString
	call CrLf

	mov ecx, numberComposite
	mov composite, 1
	mov eax, composite
	top:
	mov edx, OFFSET spaces
	call WriteString
	call WriteDec
	inc numberComposite
	add eax, 1
	loop top

		ret
	ShowComposite ENDP

goodbye	PROC
	call CrLf
	mov edx, OFFSET conclusion
	call WriteString
	call CrLf
	ret
goodbye ENDP

END main
