%include "./lib.asm"
section .data
sums dw 0,0,0,0,0,0
res db 10,"Columns sums:",10
lenRes equ $ - res
num_prompt db "Enter number: ",0
len_num_prompt equ $ - num_prompt

section .bss
buf resb 10
len equ $-buf
arr resw 24

section .text
global _start

_start:
mov ecx,24
mov edi,arr

input_loop:
push ecx
push edi
mov eax,4
mov ebx,1
mov ecx,num_prompt
mov edx,len_num_prompt
int 0x80
mov eax,3
mov ebx,0
mov ecx,buf
mov edx,len
int 0x80
mov esi,buf
call StrToInt

pop edi
mov [edi],ax
add edi,2
pop ecx
loop input_loop

mov ecx,4
xor ebx,ebx
cycle1:
push ecx
xor esi,esi
mov ecx,6
cycle2:
mov ax,word[arr+esi+ebx]
push esi
push ecx
push ebx
cwde
mov esi,buf
call IntToStr
mov byte[buf+eax],' '
inc eax
mov edx,eax
mov ecx,buf
mov ebx,1
mov eax,4
int 0x80
pop ebx
pop ecx
pop esi
add esi,2
loop cycle2
push ebx
mov byte[buf],10
mov edx,1
mov ecx,buf
mov ebx,1
mov eax,4
int 0x80
pop ebx
pop ecx
add ebx,12
loop cycle1

mov ecx,6
mov edi,sums
mov ebx,0
calc_sums:
xor eax,eax
mov dx,[arr+ebx]
add ax,dx
mov dx,[arr+ebx+12]
add ax,dx
mov dx,[arr+ebx+24]
add ax,dx
mov dx,[arr+ebx+36]
add ax,dx
mov [edi],ax
add edi,2
add ebx,2
loop calc_sums

mov eax,4
mov ebx,1
mov ecx,res
mov edx,lenRes
int 0x80

mov ecx,6
mov esi,sums
print_sums:
lodsw
push ecx
push esi
mov esi,buf
cwde
call IntToStr
mov byte[buf+eax],' '
inc eax
mov edx,eax
mov ecx,buf
mov ebx,1
mov eax,4
int 0x80
pop esi
pop ecx
loop print_sums

mov byte[buf],10
mov edx,1
mov ecx,buf
mov ebx,1
mov eax,4
int 0x80

mov eax,1
xor ebx,ebx
int 0x80

