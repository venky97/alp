.model tiny
.data
disp1 db 'Enter User Name: $'
disp2 db 'Enter Password: $'
usr_dict db 'himynameis', 'pointlessb' , 'adirasamam' , 'beddingisl'
pass_dict db 'firstpas' , 'secondpa' , 'thirdpas' , 'fourthpa'
inp1 db 0ah dup('$')
inp2 db 08h dup('$')
cmd db 0ah,0dh,'$'
ast db 2ah,'$'
.code
.startup
	lea dx,disp1
	mov ah,09h
	int 21h
	lea dx,cmd
	mov AH,09h
	int 21h
	cld
	mov cx,0ah
	lea di,inp1
x1:	MOV AH, 01h; AH -01 parameter for INT 21h
	INT 21h
	stosb
	loop x1
	mov bx,04h
	lea ax,inp1
	lea di,usr_dict
x2:	mov cx,0ah
	cld
	repe scasb
	cmp cx,0
	jz x3
	dec bx
	jnz x2
	jmp xn
x3:	lea dx,cmd
	mov AH,09h
	int 21h
	mov cx,08h
	lea di,inp2
	lea dx,disp2
	mov ah,09h
	int 21h
	lea dx,cmd
	mov AH,09h
	int 21h
x4: MOV AH, 08h; AH -01 parameter for INT 21h
	INT 21h
	lea dx,ast
	mov ah,09h
	int 21h
	stosb
	loop x4	
xn:
.exit 
end