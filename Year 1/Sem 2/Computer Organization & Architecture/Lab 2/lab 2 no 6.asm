TITLE lab2 no6

; Author: Evelyn Goh
; Date: 30 May 2024

include Irvine32.inc

.code
main proc
MOV DX, 0		; Clear DX to form the 16 - bit dividend in DX : AX
MOV AX, 803h	; Load the dividend (803h) into AX
MOV BX, 10h		; Load the divisor (10h) into BX
DIV BX			; Divide DX : AX by BX, whereby AX = quotient & DX = remainder

call DumpRegs	; display the register
exit
main ENDP
END main
