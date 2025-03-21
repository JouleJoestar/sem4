%include "./lib.asm" ; либа для преобразовани 

section .data
    arr dw 1, 1, 1, 1, 1, 1
        dw 1, 1, 1, 1, 1, 1
        dw 1, 1, 1, 1, 1, 1
        dw 1, 1, 1, 1, 1, 1 ; пример массива 4x6
    sums dw 0, 0, 0, 0, 0, 0 ; массив для сумм столбцов
    outArr db "Your array: ", 0
    lenOut equ $ - outArr
    res db "Columns sum: ", 0
    lenRes equ $ - res
    space db " ", 0
    output_buffer times 10 db 0

section .text
global _start

_start:
    ; Сброс сумм столбцов
    mov ecx, 6
    mov edi, sums
    xor eax, eax

reset_column_sums:
    mov [edi], ax ; обнуляем сумму столбца
    add edi, 2    ; переходим к следующему столбцу
    loop reset_column_sums

    ; Суммирование элементов каждого столбца
    mov ecx, 6 ; количество столбцов
    mov edi, sums ; указатель на массив сумм

sum_columns:
    xor eax, eax ; обнуляем сумму для текущего столбца
    mov edx, 0   ; сброс счетчика строк

sum_row:
    cmp edx, 4 ; проверяем, достигли ли конца строки
    jge store_sum

    ; Вычисляем адрес элемента
    mov ebx, edx ; копируем индекс строки
    imul ebx, 6  ; умножаем на количество столбцов
    add ebx, ecx ; добавляем индекс столбца (ecx)
    dec ebx      ; корректируем индекс (так как ecx начинается с 1)
    mov ax, [arr + ebx * 2] ; загружаем элемент массива

    add [edi], ax ; добавляем к сумме столбца

    inc edx ; переход к следующей строке
    jmp sum_row

store_sum:
    add edi, 2 ; переход к следующему столбцу
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
    mov ax, [esi] ; загружаем элемент массива (16-битное значение)
    movzx eax, ax ; расширяем до 32 бит
    mov edi, output_buffer
    call IntToStr ; преобразуем число в строку

    ; Вывод элемента
    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer
    mov edx, eax ; длина буфера вывода (результат IntToStr)
    int 0x80

    ; Вывод пробела между элементами
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80

    add esi, 2 ; переходим к следующему элементу массива
    pop ecx
    loop print_array

    ; Вывод сумм столбцов
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, lenRes
    int 0x80

    mov ecx, 6 ; количество столбцов
    mov esi, sums ; указатель на массив сумм

print_column_sums:
    push ecx
    mov ax, [esi] ; загружаем сумму столбца (16-битное значение)
    movzx eax, ax ; расширяем до 32 бит
    mov edi, output_buffer
    call IntToStr ; преобразуем число в строку

    ; Вывод суммы
    mov eax, 4
    mov ebx, 1
    mov ecx, output_buffer
    mov edx, eax ; длина буфера вывода (результат IntToStr)
    int 0x80

    ; Вывод пробела между суммами
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80

    add esi, 2 ; переходим к следующему столбцу
    pop ecx
    loop print_column_sums

    ; Завершение программы
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80
