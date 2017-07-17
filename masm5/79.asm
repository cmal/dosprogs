        assume cs:codesg,ss:stacksg,ds:datasg

        stacksg segment
        dw 0,0,0,0,0,0,0,0
        stacksg ends

        datasg segment
        db '1. display      '
        db '2. brows        '
        db '3. replace      '
        db '4. modify       '
        datasg ends

        codesg segment
start:  mov ax,datasg
        mov ds,ax
        mov ax,stacksg
        mov ss,ax
        mov sp,16

        mov cx,4
        mov bx,0
l0:     push cx

        mov cx,4
        mov si,3

l1:     mov al,[si][bx]
        and al,11011111b
        mov [si][bx],al

        inc si
        loop l1

        add bx,16
        pop cx
        loop l0

        mov ax,4c00h
        int 21h
        codesg ends

        end start
