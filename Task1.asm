TITLE task1.asm
	.MODEL SMALL
	.STACK 100h
	.CODE

Start:
        call disdate
        call dispattern
        call disname
        call dispattern

Exit:
	mov ax, 4c00h
	int 21h

disdate PROC NEAR

.DATA
       date DB 13,10,"11 May 2016",13,10,"$"
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
        cMessage DB 13,10,"Steven Gibson",13,10,"$"
.code
        mov ax,@DATA
        mov ds,ax

        mov Ah,9h
        mov dx,offset cMessage
        int 21h

        ret

disname ENDP

dispattern PROC NEAR

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
dispattern ENDP

END start
