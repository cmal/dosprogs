assume cs:code,ds:data,ss:stack
        data segment
        db 'welcome to masm!'
        db 2h,24h,71h
        dw 780h,820h,8c0h
        data ends

        stack segment
        dw 0,0,0,0,0,0,0,0
        stack ends

        code segment
start:  mov cx,3
        mov ax,data
        mov ds,ax
        mov bp,16
        mov di,19

        mov ax,stack
        mov ss,ax
        mov sp,16
        mov ax,0b800h
        mov es,ax

l0:     push cx
        mov cx,16
        mov bx,0

        mov si,[di]
        add si,40h

l1:     mov al,[bx]
        mov ah,ds:[bp]
        mov es:[si],ax
        add si,2
        inc bx
        loop l1

        inc bp
        add di,2
        pop cx
        loop l0

        mov ax,4c00h
        int 21h

        code ends
        end start
