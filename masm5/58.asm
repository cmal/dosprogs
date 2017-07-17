        assume cs:code

        code segment

        mov ax,0ffffh
        mov ds,ax

        mov ax,20h
        mov es,ax

        mov bx,0
        mov cx,6

s:      mov dx,[bx]
        mov es:[bx], dx
        inc bx
        inc bx
        loop s

        mov ax,4c00h
        int 21h

        code ends
        end
