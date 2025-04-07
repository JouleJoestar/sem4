 %include "./lib.asm" ; либа с функциями StrToInt и IntToStr
section .data
    sums dw 0,0,0,0,0,0 ; массив сумм
    outArr db "Your array:", 10
    lenOut equ $ - outArr
    res db 10, "Columns sums:", 10
    lenRes equ $ - res
    space db " ", 0
    newline db 10, 0
    num_prompt db "Enter number: ", 0
    len_num_prompt equ $ - num_prompt
    input_buffer times 16 db 0   ; буфер для ввода
    output_buffer times 10 db 0  ; буфер для вывода

section .bss
    arr resw 24 ; массив 4х6

section .text
global _start

_start:
    ; Ввод 24 чисел
    mov ecx, 24 ; регистр счётчик
    mov edi, arr

input_loop:
    push ecx
    push edi

    ; Вывод приглашения
    mov eax, 4
    mov ebx, 1
    mov ecx, num_prompt
    mov edx, len_num_prompt
    int 0x80

    ; Чтение ввода
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    ; Преобразование в число
    mov esi, input_buffer
    call StrToInt

    ; Сохранение числа
    pop edi
    mov [edi], ax
    add edi, 2
    pop ecx
    loop input_loop

    ; Вывод массива
    mov eax, 4
    mov ebx, 1
    mov ecx, outArr
    mov edx, lenOut
    int 0x80

    ; Вывод 4 строк по 6 элементов
    mov ecx, 4
    mov esi, arr

print_rows:
    push ecx
    mov ecx, 6

print_cols:
    push ecx
    mov ax, [esi]
    cwde ; чтобы выводить минус в отрицательных числах
    mov edi, output_buffer
    call IntToStr

    ; Вывод числа
    push eax        ; сохраняем длину строки
    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer
    pop edx         ; возвращаем длину из стека
    int 0x80

    ; Пробел между числами (кроме последнего)
    pop ecx
    cmp ecx, 1
    je .no_space
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    pop ecx
.no_space:
    add esi, 2
    loop print_cols

    ; Перенос строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    pop ecx
    loop print_rows

    ; Расчет сумм столбцов
    mov ecx, 6
    mov edi, sums
    mov ebx, 0

calc_sums:
    xor eax, eax
    mov dx, [arr + ebx]
    add ax, dx
    mov dx, [arr + ebx + 12]
    add ax, dx
    mov dx, [arr + ebx + 24]
    add ax, dx
    mov dx, [arr + ebx + 36]
    add ax, dx
    
    mov [edi], ax
    add edi, 2
    add ebx, 2
    loop calc_sums

    ; Вывод сумм столбцов
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, lenRes
    int 0x80

    mov ecx, 6
    mov esi, sums

print_sums:
    push ecx
    mov ax, [esi]
    cwde ; аналогично с минусами
    mov edi, output_buffer
    call IntToStr

    ; Вывод суммы
    push eax
    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer
    pop edx
    int 0x80

    ; Пробел между суммами (кроме последней)
    pop ecx
    cmp ecx, 1
    je .no_space_sum
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    pop ecx
.no_space_sum:
    add esi, 2
    loop print_sums

    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
