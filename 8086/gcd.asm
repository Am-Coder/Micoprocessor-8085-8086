.model medium
dosseg
.stack 100h
.8086

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
s1 db "Give number $"
n1 db ?
n2 db ?
s2 db "gcd is $"


.code 
start:
	mov ax, @data
	mov ds, ax
	
	print s1
	scan
	mov n1,al
	
	print s1
	scan
	mov n2,al
	
	mov bl,n1
	
	CALL GCD

	print s2
	add cl,30h
	mov n1,cl
	print n1
mov ah,4ch
int 21h

GCD PROC NEAR 

	
	cmp bl,0
	jne continue
	
	mov cl,al
	ret
	
	continue:
		xor ah,ah
		div bl
		mov al,bl
		mov bl,ah ;Remainder in ah
	call gcd
	ret
GCD ENDP
end start


		