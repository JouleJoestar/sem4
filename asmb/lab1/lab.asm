section .data               ; Сегмент инициализированных переменных
    ExitMsg db "Press Enter to Exit", 10 ; Выводимое сообщение
    lenExit equ $ - ExitMsg              ; Длина выводимого сообщения
    A dw 30
    B dw 21
    val1 db 255                   ; 1 байт, инициализируемый значением 255
    chart dw 256                  ; 2 байта, инициализируемые значением 256
    lue3 dw -128                  ; 2 байта, инициализируемые значением -128
    v5 db 10h                     ; 1 байт, инициализируемый значением 10 в шестнадцатеричной системе
    twenty_one db 100101B        ; 1 байт, инициализируемый двоичным значением (37 в десятичной системе)
    beta db 23, 23h, 0ch         ; 3 байта инициализируются 23, 35 (23h) и 12 (0ch)
    sdk db "Hello", 10           ; Строка "Hello" и завершающий байт 10
    mind dw -32767               ; 2 байта, инициализируемые значением -32767
    ard dd 12345678h             ; 4 байта, инициализируемые значением 12345678 (обрезается до 16 бит)
    valar times 5 db 0           ; Резервирует 5 байтов, инициализированных нулями
    chislo dw 25		 ; Число 2 байта со знаком
    negchislo dw -35		 ; Двойное слово 
    name db "Тимур", 11		 ; Имя
    innt1 dw 9472		 ; 00 25 в памяти
    innt2 dw 37			 ; 25 00 в памяти
    F1 dw 65535			 ; слово
    F2 dd 65535			 ; двойное слово
    

section .bss                ; Сегмент неинициализированных переменных
    InBuf resb 10          ; Буфер для вводимой строки
    lenIn equ $ - InBuf    ; Длина буфера (сейчас равна 10)
    X resd 1               ; Резервируем 4 байта для хранения результата
    alures resw 10         ; Резервируем 10 слов (20 байт)
    f1 resb 5              ; Резервируем 5 байтов
	
section .text               ; Сегмент кода
global _start               ; Объявление точки хода программы

_start:                     ; Начало программы
    ; Выполним арифметические операции
    mov eax, [A]           ; загрузить число A в регистр EAX
    add eax, 5             ; добавить 5
    sub eax, [B]           ; вычесть число B, результат в EAX
    mov [X], eax           ; сохранить результат в памяти

     ; тест
    add word [F1], 1
    add dword [F2], 1            

    ; write
    mov eax, 4             ; Код системного вызова 4 (write)
    mov ebx, 1             ; Дескриптор файла, stdout = 1
    mov ecx, ExitMsg       ; Адрес выводимой строки
    mov edx, lenExit       ; Длина выводимой строки
    int 0x80               ; Вызов системного прерывания

    ; read
    mov eax, 3             ; Код системного вызова 3 (read)
    mov ebx, 0             ; Дескриптор файла, stdin = 0
    mov ecx, InBuf         ; Адрес буфера ввода
    mov edx, lenIn         ; Размер буфера
    int 0x80               ; Вызов системного прерывания

    ; exit
    mov eax, 1             ; Код системного вызова 1 (exit)
    xor ebx, ebx           ; Код возврата 0
    int 0x80               ; Вызов системного прерывания

