section .data
    words db "13asdedd", "00dsauda", "77mzyapr", "42bratuh", "43amigos", "01first1", "12banana", "41aloha_"
    word_len equ 8       ; 2 цифры + 6 символов
    words_count equ 8    ; 8 элементов
    newline db 10
    space db " "

section .bss
    sorted_words resb 64 ; 8 слов по 8 символов 
    num1 resb 1
    num2 resb 1

section .text
global _start

_start:
    mov esi, words
    mov edi, sorted_words
    mov ecx, 64
    rep movsb

    ; пузырек
    mov ecx, words_count
    dec ecx

outer_loop:
    push ecx
    mov esi, sorted_words
    mov edi, esi
    add edi, word_len

inner_loop:
    ; Преобразуем первые два символа в число для сравнения
    ; Первое число
    mov al, [esi]        ; первая цифра
    sub al, '0'
    mov bl, [esi+1]      ; вторая цифра
    sub bl, '0'
    mov ah, 10
    mul ah               ; al = 10 * первая цифра
    add al, bl           ; al = полное число (0-99)
    mov [num1], al

    ; Второе число
    mov al, [edi]        ; первая цифра
    sub al, '0'
    mov bl, [edi+1]      ; вторая цифра
    sub bl, '0'
    mov ah, 10
    mul ah               ; al = 10 * первая цифра
    add al, bl           ; al = полное число (0-99)
    mov [num2], al

    ; Сравниваем числа
    mov al, [num1]
    cmp al, [num2]
    jbe no_swap

    ; Обмен словами
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

    ; Вывод отсортированных слов
    mov ecx, words_count
    mov esi, sorted_words

print_loop:
    push ecx
    
    ; Вывод слова
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, word_len
    int 0x80
    
    ; Вывод пробела
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    
    add esi, word_len
    pop ecx
    loop print_loop

    ; Перенос строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
