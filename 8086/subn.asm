.model small
.stack 100h
.8086
dosseg


print macro str
	mov dx, offset str
	mov ah,09h
	int 21h
endm


.data
so db "Overflow $"
arr dw 211,11,1,1,1,1
n dw 6
.code

start:
	mov ax,@data
	mov ds,ax
	
	mov si,0
	mov cx,n
	xor ax,ax
	mov ax,arr[si]
	inc si
	inc si
	dec cx
	clc
	
	l1:
		sbb ax,arr[si]
		jo next
		inc si
		inc si 
	loop l1
	jmp ending
	
	next:
		print so
	
	ending:
	
	mov ah,4ch
	int 21h
	
end start 