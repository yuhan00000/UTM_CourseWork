TITLE lab2 q1

; Author: Lim Yu Han
; Date: 03 June 2024


include Irvine32.inc

.data
var1 word 1     ; 0001h
var2 word 9     ; 0009h


.code
main proc
        mov ax, var1                ; LINE1
        mov bx, var2                ; LINE2
        xchg ax, bx                 ; LINE3
        mov var1, ax                ; LINE4
        mov var2, bx                ; LINE5

        call DumpRegs               ; display the register

    exit

main ENDP

END main
