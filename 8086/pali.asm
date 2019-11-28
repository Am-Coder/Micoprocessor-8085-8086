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
s1 db "Give the string ","$"
s2 db 100 dup("$")
tr db " True $"
fa db " False $"


.code 
start:
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	print s1
	
	mov si,offset s2
	mov di,offset s2
	
	l1: 
		scan 
		cmp al,13
		je ending
		mov [si],al
		inc si
	jmp l1
	
	ending:
		dec si
		call palindrome
		
		
mov ah,4ch
int 21h

palindrome proc 
	loop1:
		cmp si,di
		jl op
		mov al,[si]
		mov bl,[di]
		dec si
		inc di
		cmp al,bl		
		je loop1
		
	no:
		print fa
		ret
		
	op:
		print tr
		ret
		
palindrome endp


end start	