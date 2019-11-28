.model medium
.stack 100h
print macro s1
mov dx,offset s1
int ah,09h
int 21h
endm

scan macro
mov ah,01h
int 21h
endm

.data
n1 db 14h
n2 db 08h
n3 db ?
n4 db ?
.code
start:
mov ax,@data
mov ds,ax
mov al,n1
mov bl,n2
call gcd
mov n3,cl
mov al,n1
mov bl,n2
mul bl
div cl
mov n4,al

mov ah,4ch
int 21h


gcd proc near
    cmp bl,0
    jne continue
    mov cl,al
    ret

    continue:
    xor ah,ah
    div bl
    mov al,bl
    mov bl,ah
    call gcd
    ret
    gcd endp
end start

    

