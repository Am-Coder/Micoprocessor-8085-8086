.model small
.8086
dosseg
.stack 100h


print macro s
	mov dx,offset s
	mov ah,09h
	int 21h
endm

scan macro 
	mov ah,01h
	int 21h
endm

.data 
s1 db "Give the string:","$"
s2 db 100 dup("$")
tr db "True $"
fa db "False $"
en db "$"

.code
start:
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	
	mov al,en
	xor ah,ah
	push ax
	mov si,offset s2
	mov di,offset s2
	
	print s1
	
	l1: scan
		cmp al,13
		je l2
		mov [si],al
		xor ah,ah
		push ax
		inc si
		
		jmp l1
	
	l2:	pop ax
		cmp al,en
		je yes
		cmp al,[di]
		jne no
		inc di
		
		jmp l2
		
	
	no: print fa
		jmp ending
	
	yes: print tr
		jmp ending
ending:
mov ah,4ch
int 21h

end start
