assume ds:data,cs:code

data segment
string db 'hello world','$'
data ends

code segment
    start: mov ax,data
           mov ds,ax
           lea dx,string
           mov ah,09h
           int 21h
           mov ah,4ch
           int 21h
code ends
           end start