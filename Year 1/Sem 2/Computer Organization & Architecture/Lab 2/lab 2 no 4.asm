TITLE lab2 no4

; Author: Evelyn Goh
; Date: 30 May 2024

include irvine32.inc

.data
var1 WORD 40
var2 WORD 10
var4 WORD ?

.code
main proc
mov ax, var1	; LINE1
mov bx, 5		; LINE2
mul bx			; LINE3
mov bx, var2	; LINE4
sub bx, 3		; LINE5
div bx			; LINE6
mov var4, ax	; LINE7
exit
main endp
end main

