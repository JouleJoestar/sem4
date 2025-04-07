%include "lib.asm"
section .data

    ; "13asdedd 00dsauda 77mzyapr 42bratuh 43amigos 01first1 12banana 41aloha_"

    word_len equ 8       ; 2 цифры + 6 символов
    words_count equ 8    ; 8 элементов
    space db " "
    newline db 10

section .bss
    sorted_words resb 256 
    words resb 256
    num1 resb 1
    num2 resb 1

section .text
global _start

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, words
    mov edx, 72 ; 8 слов*8 символов + 7 пробелов + 0
    int 0x80

    mov esi, words
    mov edi, sorted_words
    mov ecx, words_count

parse:
    push ecx
    mov ecx, word_len
    rep movsb
    pop ecx

    cmp ecx, 1
    je done
    inc esi
    loop parse

done:
    ; пузырек
    mov ecx, words_count
    dec ecx

outer_loop:
    push ecx
    mov esi, sorted_words
    mov edi, esi
    add edi, word_len

inner_loop:
    mov al, [esi]       
    sub al, '0'
    mov bl, [esi+1]      
    sub bl, '0'
    mov ah, 10
    mul ah              
    add al, bl          
    mov [num1], al

    mov al, [edi]        
    sub al, '0'
    mov bl, [edi+1]     
    sub bl, '0'
    mov ah, 10
    mul ah              
    add al, bl           
    mov [num2], al

    ; num1>num2?
    mov al, [num1]
    cmp al, [num2]
    jbe no_swap
    
    push ecx
    mov ecx, word_len

swap_loop:
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    inc edi
    loop swap_loop
    pop ecx

    sub esi, word_len
    sub edi, word_len

no_swap:
    add esi, word_len
    add edi, word_len
    loop inner_loop
    pop ecx
    loop outer_loop
    mov ecx, words_count
    mov esi, sorted_words

print:
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, word_len
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    
    add esi, word_len
    pop ecx
    loop print
    mov eax, 1
    xor ebx, ebx
    int 0x80
