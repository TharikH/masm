assume cs:code,ds:data

data segment
num db 0ah,02h,07h,05h
len dw 0004h
space db ' $'
data ends

code segment
start: mov ax,data
       mov ds,ax
       mov dx,len
       dec dx
       mov ax,0000h
again1: mov cx,dx
       mov si,offset num
again: mov al,[si]
       cmp al,[si + 1]
       jl cont
       xchg [si + 1],al
       mov [si],al
cont:  inc si
       loop again
       dec dx
       jnz again1
       mov si,offset num
       mov di,len
print: mov al,[si]
       call display
       lea dx,space
       mov ah,09h
       int 21h
       inc si
       dec di
       mov ah,00h
       jnz print
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
