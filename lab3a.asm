.model tiny
.data
max1 db 14h
act1 db ?
inp1 db 14h dup('$')
cmd db 0ah,0dh,'$'

.code
.startup
LEA  DX,max1
MOV  AH, 0Ah
INT  21h
lea dx,cmd
mov AH,09h
int 21h
lea dx,inp1
mov ah,09h
int 21h
.exit
end