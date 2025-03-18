section .data 
    prompt_a db "Enter: ", 0
    outArr db "Your array: ", 10
    lenOut equ $-outArr
    res db "Columns sum: ", 0
    lenRes equ $-res
    newline db 10, 0 ; новая строка

section .bss
    input_buffer resb 20 
    output_buffer resb 30
    arr resd 24 ; матрица (4 строки по 6 столбцов)
    sums resd 6 ; массив вывода (6 столбцов)

section .text
    global _start

%include "./lib.asm" ; либа с преобразованиями

_start:
    ; Ввод матрицы
    mov ecx, 24 ; количество элементов матрицы
    mov edi, arr ; указатель на начало массива

input_loop:
    push ecx ; сохраняем ecx

    ; Вывод приглашения для ввода
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_a
    mov edx, 7
    int 0x80

    ; Ввод числа
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 16
    int 0x80

    ; Null-terminate input buffer
    mov byte [input_buffer + eax - 1], 0

    ; Преобразование ввода в число
    mov esi, input_buffer ; используем esi для передачи адреса буфера
    call StrToInt
    mov [edi], eax ; сохраняем число в массиве
    add edi, 4 ; переход к следующему элементу

    pop ecx ; восстанавливаем ecx
    loop input_loop

    ; Сброс сумм столбцов
    mov ecx, 6
    mov edi, sums
    xor eax, eax

reset_column_sums:
    mov [edi], eax
    add edi, 4
    loop reset_column_sums

    ; Суммирование элементов каждого столбца
    mov ecx, 6 ; количество столбцов
    mov edi, sums ; указатель на массив сумм

sum_columns:
    xor eax, eax ; обнуляем сумму для текущего столбца
    mov edx, 0 ; сброс счетчика строк

sum_row:
    cmp edx, 4 ; проверяем, достигли ли конца строки
    jge store_sum

    ; Вычисляем адрес элемента
    mov eax, edx ; копируем индекс строки
    imul eax, 6 ; умножаем на количество столбцов
    add eax, ecx ; добавляем индекс столбца (ecx)
    dec eax ; корректируем индекс (так как ecx начинается с 1)
    mov eax, [arr + eax * 4] ; загружаем элемент массива

    add [edi], eax ; добавляем к сумме столбца

    inc edx ; переход к следующей строке
    jmp sum_row

store_sum:
    add edi, 4 ; переход к следующему столбцу
    loop sum_columns

    ; Вывод массива
    mov eax, 4
    mov ebx, 1
    mov ecx, outArr
    mov edx, lenOut
    int 0x80

    ; Вывод элементов массива
    mov ecx, 24 ; количество элементов в массиве
    mov esi, arr ; указатель на начало массива

print_array:
    push ecx
    mov eax, [esi]
    mov edi, output_buffer
    call IntToStr

    ; Вывод элемента
    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer
    mov edx, eax ; Используем длину строки, возвращенную IntToStr
    int 0x80

    ; Печать новой строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    add esi, 4
    pop ecx
    loop print_array

    ; Вывод сумм столбцов
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, lenRes
    int 0x80

    mov ecx, 6 ; количество столбцов
    mov edi, sums ; указатель на массив сумм

print_column_sums:
    push ecx
    mov eax, [edi]
    mov esi, output_buffer
    call IntToStr

    ; Вывод суммы
    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer
    mov edx, eax ; Используем длину строки, возвращенную IntToStr
    int 0x80

    ; Печать новой строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    add edi, 4
    pop ecx
    loop print_column_sums

    ; Завершение программы
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80
