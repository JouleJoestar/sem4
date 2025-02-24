section .data 
    prompt_a db "Enter a: ", 0
    prompt_b db "Enter b: ", 0
    prompt_d db "Enter d: ", 0
    res db "Result: ", 0
    lenRes equ $-res

section .bss
    input_buffer resb 10 
    output_buffer resb 10
    a resd 1
    b resd 1
    d resd 1
    c resd 1  

section .text
    global _start

%include "./lib.asm" ; либа с преобразованиями

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

    ; Ввод значения b
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_b
    mov edx, 9
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    mov esi, input_buffer
    call StrToInt
    mov [b], eax

    ; Ввод значения d
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_d
    mov edx, 9
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    mov esi, input_buffer
    call StrToInt
    mov [d], eax

    ; Математика
    mov eax, [a]
    add eax, [b]
    cdq
    idiv dword [d]
    mov ecx, eax

    mov eax, [d]
    imul eax, [d]
    imul eax, [a]
    sub ecx, eax

    sub ecx, [b]
    mov [c], ecx

    ; Преобразование результата в строку
    mov esi, output_buffer ; загрузка адреса буфера вывода 
    mov eax, [c]          ; загрузка числа в регистр   
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
