section .data 
    ina db "Enter a: ", 0
    inb db "Enter b: ", 0
    ind db "Enter d: ", 0
    res db "Result: ", 10
    lenRes equ $-res
    exep db "Zero exception!", 10
    lenExep equ $-exep


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
    mov ecx, ina
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
    mov ecx, inb
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
    mov ecx, ind
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

    cmp dword[d],0
    jne math

    mov eax,4
    mov ebx,1
    mov ecx,exep
    mov edx,lenExep
    int 0x80

    mov eax,1
    mov ebx,1
    int 0x80

math:
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

    ; преобразование вывода
    mov esi, output_buffer  
    mov eax, [c]             
    call IntToStr         

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
