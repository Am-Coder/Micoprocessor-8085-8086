dosseg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
.model small                                      
.8086
.stack 10h

print macro msg
        mov dx, offset msg
        mov ah,09h
        int 21h
        endm

scan macro
        mov ah,01h
        int 21h
        sub al,30h
        endm

.data
ipmsg1 db "Give first number$"
ipmsg2 db "Give second number$"
opmsg db "Answer is:$"
p1 dw 123
p2 dw 12


.code
start:
        mov ax,@data
        mov ds,ax

  
        mov ax,p1
		mul p2;result in [dx ax]
		
		
        MOV ax,4c00H
        INT 21H
END start

                 
