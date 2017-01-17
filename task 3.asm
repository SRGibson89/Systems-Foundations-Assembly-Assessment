.model small

.data
   
   message db 13,10, "Enter a as symbol {,[,( or < $",13,10
   message2 db 13,10, "Enter a number between 1 and 6" , 13,10,"$"
   messagename db  "Steven Gibson$"
   messagecur db "{$"
   messagecurb db "}$"
   messagesqu db "[$"
   messagesqub db "]$"
   messagebra db   "($"
   messagebrab db ")$"
   messagegret db   "<$"
   messagegretb db ">$"
   messageline db 13,10,  "$"
   messagenope db 13,10,  "Not a valid character $"    
   
.code
jmp start
Myname proc near
    

        mov ax, seg messagename
        mov ds, ax
        mov dx,offset messagename
        mov ah,9h
        int 21h
        
      
        ret
endp

number proc near
    
        mov dl,bl
        add dl,48d
        mov ah,2h
        int 21h
         
                 
      
        ret
endp
     
cur proc near
mov bl,al        
mov ch,bl         
        
loop1:
        mov ax, seg messagecur
        mov ds, ax
        mov dx,offset messagecur
        mov ah,9h
        int 21h
        sub cl,1
                   
        jz finish1
        jmp loop1         

finish1:
        ret
endp

curback proc near
    
 mov ch,dh         
        
loop2:
    mov ax, seg messagecurb
        mov ds, ax
        mov dx,offset messagecurb
        mov ah,9h
        int 21h
        sub bl,1
        
                   
        jz finish2
        jmp loop2 
        
finish2:
    ret
endp

squ proc near
    mov bl,al        
    mov ch,bl
             
        
loop3:
    mov ax, seg messagesqu
        mov ds, ax
        mov dx,offset messagesqu
        mov ah,9h
        int 21h
        sub cl,1
                   
        jz finish3
        jmp loop3 
finish3:        
    ret
endp 
   
squback proc near
    mov ch,dh         
        
loop4:
    mov ax, seg messagesqub
        mov ds, ax
        mov dx,offset messagesqub
        mov ah,9h
        int 21h 
        sub bl,1
                   
        jz finish4
        jmp loop4
finish4:        
    ret
endp


bra proc near
    mov bl,al        
    mov ch,bl         
        
loop5:   
    mov ax, seg messagebra
        mov ds, ax
        mov dx,offset messagebra
        mov ah,9h
        int 21h
        sub cl,1
                   
        jz finish5
        jmp loop5 
finish5:        
    ret
endp

braback proc near
    mov ch,dh         
        
loop6:
    mov ax, seg messagebrab
        mov ds, ax
        mov dx,offset messagebrab
        mov ah,9h
        int 21h 
        sub bl,1
                   
        jz finish6
        jmp loop6
finish6:        
    ret
endp

gret proc near 
    mov bl,al        
    mov ch,bl         
        
loop7:
    mov ax, seg messagegret
        mov ds, ax
        mov dx,offset messagegret
        mov ah,9h
        int 21h
        sub cl,1
                   
        jz finish7
        jmp loop7 
finish7:        
    ret
endp

gretback proc near
    mov ch,dh         
        
loop8:

        mov ax, seg messagegretb
        mov ds, ax
        mov dx,offset messagegretb
        mov ah,9h
        int 21h 
        sub bl,1
                   
        jz finish8
        jmp loop8 
finish8:        
    ret
endp

nope proc near
    
    mov ax, seg messagenope
        mov ds, ax
        mov dx,offset messagenope
        mov ah,9h
        int 21h
                        
               
    ret
endp


    main proc
        
start:  
        call Myname    
        ;ask user for symbol
        mov ax, seg message
        mov ds, ax
        mov dx,offset message
        mov ah,9h
        int 21h
        
        mov ah,1h
        int 21h
        
        
        mov bl, al ;move symbol to bl reg
        
        ;ask user for count
        mov ax, seg message2
        mov ds, ax
        mov dx,offset message2
        mov ah, 9h
        int 21h
        
        mov ah, 8h
        int 21h  
        sub al, 48
        mov cl, al ;move counter to cl reg
        mov dl, al
        mov ch, 1h
        mov dh, 1h
        
        cmp bl, 7Bh ; {
        je curle
        
        cmp bl, 5Bh ; [
        jz square
        
        cmp bl, 28h ; (
        jz brack
        
        cmp bl, 3Ch ;<
        jz great
        
        jmp none
        
curle:
    call cur
    call number
    call curback
    jmp Exit

square:
    call squ
    call number
    call squback
    jmp Exit

brack:
    call bra
    call number
    call braback
    jmp Exit

great:
    call gret
    call number
    call gretback
    jmp Exit
    
none:
    call nope
    jmp start
Exit:
    mov ax, 4c00h
        int 21h    
    endp    

end main 
     