.model small
.8086
dosseg
 .stack 100h

print macro str
	mov dx, offset str
	mov ah, 09h
	int 21h
endm

scan macro 
	mov ah,01h
	int 21h
endm


.data
arr db 10,9,11,44,19
n db 5
min db ?
max db ?

.code
start:
	mov ax,@data
	mov ds,ax
	
	mov si, offset arr
	mov al,[si]
	mov bh,al
	mov bl,al
	
	xor cx,cx
	mov cl,n
	
	l1:	
		mov al,[si]
	
		cmp bl,al
		jc nm1
		mov bl, al
		
		nm1:
		cmp bh,al
		jnc nm2
		mov bh, al
		
		nm2:
		inc si
	LOOP l1


	
	mov ah,4ch
	int 21h
	
end start