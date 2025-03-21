section .text

; Преобразование строки в число
; Вход:  esi - указатель на строку
; Выход: eax - число, ebx - флаг ошибки (0 - успех, 1 - ошибка)
StrToInt:
    push   edi
    push   esi
    mov    bh, '9'
    mov    bl, '0'
    cmp    byte [esi], '-'
    jne    .prod
    inc    esi     ; Пропуск знака минус
.prod:
    cld
    xor    edi, edi  ; Обнуляем результат
.cycle:
    lodsb           ; Загружаем символ (байт)
    cmp    al, 10   ; Если 10, то конец строки
    je     .Return
    cmp    al, bl   ; Сравниваем с цифрой '0'
    jb     .Error   ; Если меньше, то ошибка
    cmp    al, bh   ; Сравниваем с цифрой '9'
    ja     .Error   ; Если больше, то ошибка
    sub    al, 30h  ; Преобразуем символ в цифру
    cbw             ; Расширяем до слова
    push   eax      ; Сохраняем цифру в стеке
    mov    eax, edi ; Загружаем текущий результат
    mov    ecx, 10
    mul    ecx      ; Умножаем на 10
    pop    ecx      ; Восстанавливаем цифру
    add    eax, ecx ; Добавляем к результату
    mov    edi, eax ; Сохраняем результат
    jmp    .cycle
.Return:
    pop    esi
    mov    ebx, 0
    cmp    byte [esi], '-'
    jne    .J
    neg    edi
.J:
    mov    eax, edi
    jmp    .R
.Error:
    pop    esi
    mov    eax, 0
    mov    ebx, 1
.R:
    pop    edi
    ret

; Преобразование числа в строку
; Вход:  eax - число, edi - указатель на буфер вывода
; Выход: eax - длина строки
IntToStr:
    push   edi
    push   ebx
    push   edx
    push   ecx
    push   esi
    mov    byte [edi], 0 ; Очистка буфера
    cmp    eax, 0
    jge    .l1
    neg    eax
    mov    byte [edi], '-'
.l1:
    mov    byte [edi+6], 10 ; Добавляем символ новой строки
    mov    esi, 5           ; Индекс для записи символов
    mov    bx, 10
.again:
    cwd           ; Расширяем знак для деления
    div    bx     ; Делим на 10
    add    dl, 30h ; Преобразуем остаток в символ
    mov    [edi+esi], dl ; Записываем символ в буфер
    dec    esi    ; Уменьшаем индекс
    cmp    ax, 0  ; Проверяем, закончилось ли число
    jne    .again
    mov    ecx, 6
    sub    ecx, esi ; Вычисляем длину строки
    mov    eax, ecx
    inc    eax      ; Учитываем символ новой строки
    inc    edi      ; Пропускаем знак минус
    push   edi
    lea    esi, [edi+esi] ; Указатель на начало строки
    pop    edi
    rep movsb       ; Копируем строку в буфер
    pop    esi
    pop    ecx
    pop    edx
    pop    ebx
    pop    edi
    ret
