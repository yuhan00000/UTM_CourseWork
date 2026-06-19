TITLE lab2 q3

; Author: Lim Yu Han
; Date: 03 June 2024


include Irvine32.inc

.data
var1 DWORD 5		; 00000005h
var2 DWORD 10		; 0000000Ah
var3 DWORD 20		; 00000014h
var4 DWORD ?


.code
main proc
		mov eax, var1		; LINE1
		mul var2			; LINE2
		add eax, var3		; LINE3
		dec eax
		mov var4, eax		; LINE4

		call DumpRegs		; display the register
		exit

main ENDP

END main
