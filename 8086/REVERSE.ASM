.model small
.8086
.stack 100h
dosseg

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
s3 db 100 dup("$")

.code
start:
	mov ax, @data
	mov ds, ax
	mov cl,00h
	
	print s1
	mov si,offset s2
	mov di,offset s3
	loop1:
		scan
                cmp al,13
		je ending
                mov [si],al
		inc si
		inc cl
	jmp loop1
       
	ending:
                dec si
		loop2:
                        mov al,[si]
                        mov [di],al
			inc di
			dec si
			dec cl
		jnz loop2
	
	print s3
	mov ah,4ch
	int 21h
end start
