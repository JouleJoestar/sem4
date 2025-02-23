section .data
    a dd 0
    b dd 0
    d dd 0
    c dd 0
    input_buffer db 16 dup(0)
    output_buffer db 16 dup(0)
    prompt_a db "Enter a: ", 0
    prompt_b db "Enter b: ", 0
    prompt_d db "Enter d: ", 0
    result_msg db "Result (c): ", 0

section .text
    global _start

%include "./lib.asm"

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

    ; Вычисление выражения c = (a + b) / d - d * d * a - b
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
    mov eax, [c]
    mov esi, output_buffer
    call IntToStr

    ; Вывод результата
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 12
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer
    mov edx, 16
    int 0x80

    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
