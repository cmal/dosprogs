assume cs:codesg

        codesg segment
start:  mov ax,0
        mov bx,0
        add ax,1
s:      inc ax
        inc ax
        jmp short s

        mov ax,4c00h
        int 21h
        codesg ends
        end start
