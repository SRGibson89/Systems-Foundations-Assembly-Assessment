TITLE task2.asm
        .MODEL SMALL
        .STACK 100h
        .CODE

Start:
        call disdate
        call question

        mov ah, 8h
        int 21h

        cmp al,3Ah
        jz colon

        cmp al,2Eh
        jz dot

colon:
        call pat1
        call disname
        call pat1
        jmp EXIT

dot:
        call pat2
        call disname
        call pat2
        jmp EXIT

EXIT:
        mov ax, 4C00h
        int 21h

question PROC NEAR
.DATA
        quest db 13,10, "enter : or .",13,10,"$"
.code
        mov ax,@DATA
        mov ds,ax

        mov AH,9h
        mov dx,offset quest
        int 21h

        ret
question ENDP

disdate PROC NEAR

.DATA
    date DB 13,10,"11/05/2016",13,10,"$"
.code
       
              mov ax,@DATA
               mov ds,ax
       
               mov Ah,9h
               mov dx,offset date
               int 21h
       
               ret
       
disdate ENDP

disname PROC NEAR

.DATA
        cMessage DB "Steven Gibson","$"
        .code
        mov ax,@DATA
        mov ds,ax

        mov Ah,9h
        mov dx,offset cMessage
        int 21h

        ret

disname ENDP


pat1 PROC NEAR

        mov cx, 6d

myloop:
        mov dl,3Ah

        mov ah,2h
        int 21h

        mov dl,2Eh

        mov ah,2h
        int 21h

        sub cx,1d
        jz finish

        jmp myloop

finish:
      ret
pat1 ENDP

pat2 PROC NEAR

        mov cx, 6d

myloop1:
        mov dl,2Eh

        mov ah,2h
        int 21h

        mov dl,3Ah

        mov ah,2h
        int 21h

        sub cx,1d
        jz finish1

        jmp myloop1

finish1:
      ret
pat2 ENDP

END Start

