/* 1. Take input for an array of integers.
2. Use a loop to reverse the array in place.
3. Output the reversed array. */

section .data
    array db 5, 10, 15, 20, 25
    size db 5

section .text
    global _start

_start:
    ; Reverse array
    xor ebx, ebx
    mov ecx, size
    dec ecx

reverse_loop:
    cmp ebx, ecx
    jge done_reversing

    ; Swap elements
    mov al, [array + ebx]
    mov bl, [array + ecx]
    mov [array + ebx], bl
    mov [array + ecx], al

    ; Update indices
    inc ebx
    dec ecx
    jmp reverse_loop

done_reversing:
    ; Exit program
    mov eax, 1
    int 0x80
