section .text
global processStrings

extern markDuplicates

processStrings:
    ;пролог
    push rbp
    mov rbp, rsp
    push rbx
    push r12
    push r13
    push r14
    push r15

    mov r12, rdi    ; str1
    mov r13, rsi    ; str2
    mov r14d, edx   ; len

    mov rdi, r12    ; trg = str1
    mov rsi, r13    ; src = str2
    mov edx, r14d   ; len
    call markDuplicates

    mov rdi, r13    ; trg = str2
    mov rsi, r12    ; src = str1
    mov edx, r14d   ; len
    call markDuplicates
    
    ;эпилог
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret
