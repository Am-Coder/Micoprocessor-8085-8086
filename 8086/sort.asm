.model small
.8086	
dosseg	
.stack 100h
		
		
.data 	
arr db 11,8,6,12
n db 3	
		
.code	
start:	
		
	mov ax,@data
	mov ds,ax
		
	xor cx,cx
	mov cl,n
	bubble:
		
		xor bx,bx
		mov bl,n
		mov si,0
		l1:	mov al,arr[si+1]
			cmp arr[si],al
			jng noexch
				mov al,arr[si]
				mov ah,arr[si+1]
				mov arr[si+1],al
				mov arr[si],ah
			noexch:
			inc si
			dec bx
		jnz l1
	
	loop bubble
	
	
	mov ah,4ch
	int 21h
end start