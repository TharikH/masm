assume cs:code,ds:data

data segment
num dw 000fh
next dw 0000h
cur dw 0000h
prev dw 0001h
space db ' $'
data ends

code segment
start: mov ax,data
       mov ds,ax
       mov si,num
       mov ax,cur
       mov di,prev
again: call display
       lea dx,space
       mov ah,09h
       int 21h
       mov ax,cur
       mov ax,next
       add ax,di
       mov di,next
       mov next,ax
       mov cur,ax
       dec si
       jnz again
       mov ah,4ch
       int 21h
display proc
     mov cx,0000h
     mov bx,000ah
up1: mov dx,0000h
     div bx
     add dx,0030h
     push dx
     inc cx
     cmp ax,0000h
     jnz up1
up2: pop dx
     mov ah,02h
     int 21h
     loop up2
     ret
display endp
code ends
     end start