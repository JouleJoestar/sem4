%include "lib.asm"

section .bss
buf resb 256
count resd 1
output resb 10

section .text
global _start

_start:
mov eax,3
mov ebx,0
mov ecx, buf
mov edx, 256
int 0x80

mov esi, buf
mov dword[count], 0
xor bl,bl

cycle:
lodsb 
cmp al,10
je check_last
cmp al, '0'
je check_last
cmp al, ' '
je space_found

cmp al, 'a'
je in_word
cmp al, 'e'
je in_word
cmp al, 'i'
je in_word
cmp al, 'o'
je in_word
cmp al, 'u'
je in_word
cmp al, 'y'
je in_word

jmp cycle

in_word:
mov bl,1
jmp cycle

space_found:
cmp bl,0
jz soglasn
jmp glasn

soglasn:
inc dword [count]

glasn:
xor bl,bl
jmp skip_space

skip_space:
lodsb
cmp al, ' '
je skip_space
dec esi
jmp cycle

check_last:
cmp bl,0
jz print_soglasn
jmp print

print_soglasn:
inc dword [count]
jmp print

print:
mov eax,[count]
mov edi, output
call IntToStr

mov edx,eax
mov eax,4
mov ebx,1
mov ecx,output
int 0x80

mov eax,1
xor ebx,ebx
int 0x80

