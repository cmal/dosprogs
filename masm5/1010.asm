assume cs:code
        data segment
        db 'Welcome to masm!',0
        data ends

        code segment
start:  mov dh,8
        mov dl,3
        mov cl,2
        mov ax,data
        mov ds,ax
        mov si,0
        call show_str
        mov ax,4c00h
        int 21h

show_str:       push ax
        push bx
        push cx
        push dx
        push es
        push si

        mov al,dh
        dec al
        mov ah,160
        mul ah
        mov dh,0
        mov bx,ax
        add bx,dx
        add bx,dx
        add bx,0fffeh

draw:   mov cl,[si]
        mov ch,0
        jcxz ok
        mov ax,0b800h
        mov es,ax
        mov ax,ds:[si]
        mov es:[bx],ax
        mov byte ptr es:[bx+1],2

        inc si
        add bx,2
        jmp short draw


ok:     pop si
        pop es
        pop dx
        pop cx
        pop bx
        pop ax
        ret

        code ends
        end start
