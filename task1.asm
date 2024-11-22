/* 1. Prompt user for input.
2. Check if input is greater than 0, equal to 0, or less than 0.
   a. If greater, classify as "POSITIVE."
   b. If equal, classify as "ZERO."
   c. If less, classify as "NEGATIVE."
3. Use conditional and unconditional jumps to implement branching logic. */


section .data
    msg_input db "Enter a number: ", 0
    msg_positive db "POSITIVE", 0
    msg_negative db "NEGATIVE", 0
    msg_zero db "ZERO", 0

section .bss
    input resb 4

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_input
    mov edx, 14
    int 0x80

    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 4
    int 0x80

    ; Convert input to integer
    mov eax, [input]
    sub eax, '0'

    ; Branching logic
    cmp eax, 0
    je is_zero
    jl is_negative
    jmp is_positive

is_positive:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_positive
    mov edx, 8
    int 0x80
    jmp exit

is_negative:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_negative
    mov edx, 8
    int 0x80
    jmp exit

is_zero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_zero
    mov edx, 4
    int 0x80

exit:
    mov eax, 1
    int 0x80
