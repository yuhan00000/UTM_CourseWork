TITLE lab2 q5

; Author: Lim Yu Han
; Date: 03 June 2024


include Irvine32.inc

.code
main proc
    MOV DX, 0           ; Clear DX
    MOV AX, 1000h       ; Load 1000h into AX (4096d)
    MOV CX, 25h         ; Load 25h into CX   (37d)
    MUL CX              ; Multiply AX by CX, storing the result in DX : AX  (151552d = 00025000h)

    call DumpRegs       ; display the register
    exit

main ENDP
END main
