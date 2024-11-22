/* 1. Prompt the user for a number.
2. Call a subroutine to compute the factorial.
   a. Use the stack to store intermediate results.
   b. Preserve and restore registers in the subroutine.
3. Output the factorial result. */

section .data
    msg_input db "Enter a number: ", 0
    msg_result db "Factorial is: ", 0
    newline db 10, 0

section .bss
    input resb 4
    result resb 4

section .text
    global _start

_start:
    ; Prompt for input
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
    mov ebx, eax  ; Save input in ebx

    ; Call factorial subroutine
    call factorial

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_result
    mov edx, 14
    int 0x80

    mov eax, 4
    mov ebx, 1
    lea ecx, [result]
    mov edx, 4
    int 0x80

    ; Exit program
    mov eax, 1
    int 0x80

factorial:
    ; Calculate factorial using recursion
    cmp ebx, 1
    jle end_factorial

    ; Recursive case
    push ebx
    dec ebx
    call factorial
    pop ebx
    mul ebx  ; Multiply result by current number

end_factorial:
    mov [result], eax
    ret

