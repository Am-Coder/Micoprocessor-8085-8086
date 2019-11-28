dosseg
.model small
.8086

.data
a dw 00992h
b dw 0A129h
c dw ?

.code
mov ax,@data
mov ds,ax

mov ax,a
mov bx,b
sub bx,ax
mov c,ax
mov ax,4c00h
int 21h
end
