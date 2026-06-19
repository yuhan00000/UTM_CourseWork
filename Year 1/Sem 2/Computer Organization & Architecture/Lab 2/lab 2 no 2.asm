TITLE lab2 no2

; Author: Evelyn Goh
; Date: 30 may 2024

include irvine32.inc

.data
Rval DWORD ?
Xval DWORD 26
Yval DWORD 30
Zval DWORD 40


.code
main proc
mov eax, Xval	; LINE1
neg eax			; LINE2
mov ebx, Yval	; LINE3
sub ebx, Zval	; LINE4
add eax, ebx	; LINE5
inc eax			; LINE6
mov Rval, eax	; LINE7
exit
main endp
end main

