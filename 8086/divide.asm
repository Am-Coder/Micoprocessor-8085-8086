.model small
dosseg
.stack 100h

print macro str
	mov dx, offset str
	mov ah,09h
	int 21h
endm

.data 
s1 db " Division by zero is not defined $"
a db 40
b db 4

.code
start:
	mov ax,@data
	mov ds,ax
	
	cmp b,0
	jne next
	print s1
	jmp ending
	next:
	xor ah,ah
	mov al,a
	div b
	
	ending:
mov ah,4ch
int 21h
end start