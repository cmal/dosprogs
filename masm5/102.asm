assume cs:code,ss:stack

        stack segment
        db 16 dup (0)
        stack ends

        code segment
start:
        mov ax,stack
        mov ss,ax
        mov sp,16

        mov ax,4240h
        mov dx,000fh
        mov cx,0ah
        call divdw
        mov ax,4c00h
        int 21h

divdw:  push bx
        push dx                 ;ss:[0ah]
        push ax                 ;ss:[08h]

        mov ax,dx               ;ax=0fh
        mov dx,0                ;dx=0
        div cx                  ;ax=1,dx=5
        push ax                 ;1, quot, should be dx when ret, as the high 16 bit of result
        ;; use dx=5 and 4240h to do div
        mov ax,ss:[08h]         ;ax=4240h.  rem, only need dx of last result, use low 16bit of dividend, ie. ax, as ax
        div cx                  ;ax=86a0h,dx=0h

        ;ax already is low 16bits of quot
        mov cx,dx               ;rem, store in cx
        pop dx                  ;1, high 16 bits of quot

        pop bx                  ;discard original ax
        pop bx                  ;discard original dx
        pop bx                  ;recover original bx
        ret


        code ends
        end start
