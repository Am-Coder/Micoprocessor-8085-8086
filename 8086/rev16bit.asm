  .model small
 .8086
 dosseg
 .stack 100h
 
 
 .data
 n dw 1234
 
 
 
 .code
start:
	mov ax,@data
	mov ds,ax
	mov cl,4
	mov ax,n
	
	call rev16
	CALL PRINT
	
	mov ah,4ch
	int 21h
	
	rev16 proc near
		
		rol ah,cl
		rol al,cl
		
		ret
	rev16 endp
	
	
	PRINT PROC		 
	
	mov cx,0 
	mov dx,0 
	label1: 
		cmp ax,0 
		je print1	 
		
		mov bx,10		 
		
		div bx				 
		
		push dx			 
		
		inc cx			 
		
		xor dx,dx 
		jmp label1 
	print1: 

		cmp cx,0 
		je exit
		 
		pop dx 
		
		;add 48 so that it 
		;represents the ASCII 
		;value of digits 
		add dx,48 
		
		;interuppt to print a 
		;character 
		mov ah,02h 
		int 21h 
		
		;decrease the count 
		dec cx 
		jmp print1 
	exit: 
	ret 
	PRINT ENDP 
end start