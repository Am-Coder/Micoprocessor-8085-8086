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
 d1 db "Give String 1 : ","$"
 d2 db "Give String 2 : ","$"
 s1 db 100 dup("$")

 
 .code
 start:	
	mov ax,@data
	mov ds,ax
	
	mov si,offset s1
	print d1
	
	l1:	
		scan 
		cmp al,13
		je ending
		mov [si],al
		inc si
		jmp l1
		
	ending:
		print d2
		l2:	
			scan 
			cmp al,13
			je ending1
			mov [si],al
			inc si
			jmp l2

	ending1:
		print s1
		
		mov ah,4ch
		int 21h
 end start