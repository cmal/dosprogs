assume cs:codesg,ss:stacksg,ds:table
        stacksg segment
        dw 0,0,0
        stacksg ends

        data segment
        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
        db '1993','1994', '1995'
        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
        dd 345980,590827,803530,1183000,1843000,2759000,3753000,464900,5937000
        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800
        data ends

        table segment
        db 21 dup ('year summ ne ?? ')
        table ends

        codesg segment
start:  mov ax,stacksg
        mov ss,ax
        mov sp,0

        mov bx,0
        mov cx,21

        mov ax,0
        mov ss:[0],ax
        mov ax,84
        mov ss:[2],ax
        mov ax,168
        mov ss:[4],ax

l0:     mov ax,data
        mov es,ax
        ;; 年份
        mov ax,table
        mov ds,ax
        mov si,ss:[0]

        mov di,es:[si+0]
        mov ds:[bx+0],di

        mov di,es:[si+2]
        mov ds:[bx+2],di

        add si,4
        mov ss:[0],si

        ;; 收入
        mov si,ss:[2]

        mov di,es:[si+0]
        mov ds:[bx+5],di

        mov ax,di

        mov di,es:[si+2]
        mov ds:[bx+7],di

        mov dx,di

        add si,4
        mov ss:[2],si

        ;; 雇员数
        mov si,ss:[4]

        mov di,es:[si+0]
        mov ds:[bx+10],di

        add si,2
        mov ss:[4],si

        ;; 人均收入
        div di
        mov ds:[bx+13],ax

        add bx,16
        loop l0

        mov ax,4c00h
        int 21h
        codesg ends

        end start
