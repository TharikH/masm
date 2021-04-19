assume cs:code,ds:data

data segment
string db 'tharikh','$'
data ends

code segment
start: mov ax,data
       mov ds,ax
       mov cx,30h
       mov si,offset string
       mov ax,0000h
again: mov al,[si]
       cmp al,'$'
       je  cont
       cmp al,'a'
       je  vowel
       cmp al,'e'
       je  vowel
       cmp al,'i'
       je  vowel
       cmp al,'o'
       je  vowel
       cmp al,'u'
       je  vowel
       cmp al,'A'
       je  vowel
       cmp al,'E'
       je  vowel
       cmp al,'I'
       je  vowel
       cmp al,'O'
       je  vowel
       cmp al,'U'
       je  vowel
       inc si
       jmp again
vowel: inc cx
       inc si
       jmp again
cont:
       mov dx,cx
       mov ah,02h
       int 21h
       mov ah,4ch
       int 21h
code ends
       end start