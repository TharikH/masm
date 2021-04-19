assume cs:code,ds:data
data segment
string db 'malayalam','$'
pall db 'It is pallindrome','$'
notpal db 'It is not pallindrome','$'
data ends
code segment
    start: mov ax,data
           mov ds,ax
           mov si,offset string
           mov di,si
    iter:  mov al,[si]
           cmp al,'$'
           je  check
           inc si
           inc cx
           jmp iter
    check: dec si
    again: mov al,[si]
           cmp al,[di]
           jne wrong
           inc di
           dec si
           cmp di,si
           jl again
           lea dx,pall
           jmp cont
    wrong: lea dx,notpal
    cont:  mov ah,09h
           int 21h
           mov ah,4ch
           int 21h
code ends
           end start