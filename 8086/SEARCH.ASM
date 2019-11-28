.model small
dosseg
.8086
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
s1 db "Give the string: $" 
s2 db 100 dup("$")
s3 db "Give the number: $"
tr db " True $"
fa db " False $"
n db ?	
		
.code 	
start:	
	mov ax,@data
	mov ds, ax
	mov cl, 00h	
	print s1
	mov si, offset s2
	l1:	
		scan 
		cmp al,13
		je ending
		mov [si], al
		inc si
		inc cl
	jmp l1
	dec si
	ending:
		print s3
		scan 
		mov n,al
		
	L2:
		mov al,[si]
		cmp n,al
		je yes
		dec si
		dec cl		
		jnz L2

		jmp no
	yes:
		print tr
		jmp fin
	
	no:
		print fa
		
	fin:
		mov ah,4ch
		int 21h
end start
