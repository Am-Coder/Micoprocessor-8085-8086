dosseg
.model small
.8086

.data
a db 02h
b db 09h
c db ?

.code
mov ax,@data
mov ds,ax

mov al,a
mov bl,b
add al,bl
mov c,al
mov ax,4c00h
int 21h
end
