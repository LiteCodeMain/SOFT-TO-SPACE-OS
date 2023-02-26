section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, input_len
    int 0x80

    cmp byte [input], 'h'    
    jne not_hello

    mov eax, 4      
    mov ebx, 1
    mov ecx, hello
    mov edx, hello_len
    int 0x80

    jmp done

not_hello:
    mov eax, 4
    mov ebx, 1
    mov ecx, error
    mov edx, error_len
    int 0x80

done:
    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    prompt db "Enter command: ", 0
    prompt_len equ $ - prompt

    input times 256 db 0
    input_len equ $ - input

    hello db "operation system by LiteCode (IT team) developer: Evgeniy Trygub", 0
    hello_len equ $ - hello

    error db "error 15", 0
    error_len equ $ - error