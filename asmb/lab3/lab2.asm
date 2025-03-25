ection .data 
    prompt_a db "Enter a: ", 0
    prompt_g db "Enter g: ", 0
    prompt_c db "Enter c: ", 0
    prompt_k db "Enter k: ", 0
    prompt_m db "Enter m: ", 0
    res db "Result: ", 0
    lenRes equ $-res
    exep db "Zero exeption!", 10
    lenExep equ $-exep

section .bss
    input_buffer resb 10 
    output_buffer resb 10
    a resd 1
    g resd 1
    c resd 1
    k resd 1
    m resd 1
    f resd 1

section .text
    global _start

%include "./lib.asm" ;` либа с преобразованиями

_start:
    ; Ввод значения a
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_a
    mov edx, 9
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    mov esi, input_buffer
    call StrToInt
    mov [a], eax

    cmp dword[a],0 ; проверка a на ноль
    jne inputs ; если не ноль, продолжаем

    ; Вывод сообщения об ошибке
    mov eax, 4
    mov ebx, 1
    mov ecx, exep
    mov edx, lenExep
    int 0x80
    
    ; Завершение программы с ошибкой
    mov eax, 1
    mov ebx, 1
    int 0x80

inputs: ;продолжаем ввод
    ; Ввод значения g
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_g
    mov edx, 9
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    mov esi, input_buffer
    call StrToInt
    mov [g], eax

    ; Ввод значения c
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_c
    mov edx, 9
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    mov esi, input_buffer
    call StrToInt
    mov [c], eax

     ; Ввод значения k
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_k
    mov edx, 9
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    mov esi, input_buffer
    call StrToInt
    mov [k], eax

 ; Ввод значения m
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_m
    mov edx, 9
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    mov esi, input_buffer
    call StrToInt
    mov [m], eax

    ;цикл
    mov eax, [g]
    cmp eax, [m]
    je con ; метка если m=g
    mov eax, [m]
    sub eax, [g]
   
    jmp short continue ;безусловный переход

    con: 
    sub eax,[c] 
    cdq
    idiv dword [a]
    add eax, [k]

    continue:
    mov [f],eax

; Преобразование результата в строку
    mov esi, output_buffer ; загрузка адреса буфера вывода 
    mov eax, [f]          ; загрузка числа в регистр   
    call IntToStr         ; вызов подпрограммы IntToStr

    mov eax, 4
    mov ebx, 1
    mov ecx, res 
    mov edx, lenRes          
    int 0x80

    ; Вывод строки результата
    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer 
    mov edx, eax          
    int 0x80

    ; конец
    mov eax, 1
    xor ebx, ebx
    int 0x80
