dosseg
.model small
.8086

.data
a dw 0ab02h
b dw 0a009h
c dw ?

.code
mov ax,@data
mov ds,ax

mov ax,a
mov bx,b
add ax,bx
mov c,ax
mov ax,4c00h
int 21h
end
