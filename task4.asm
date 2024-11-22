/* 1. Read a simulated sensor value from memory.
2. If value > THRESHOLD_HIGH:
   a. Turn on the alarm.
3. If THRESHOLD_LOW <= value <= THRESHOLD_HIGH:
   a. Turn on the motor.
4. If value < THRESHOLD_LOW:
   a. Turn off the motor and alarm. */

section .data
    sensor_value db 0x05  ; Example sensor value
    motor_status db 0x00  ; 0x00 = OFF, 0x01 = ON
    alarm_status db 0x00  ; 0x00 = OFF, 0x01 = ON

section .text
    global _start

_start:
    ; Read sensor value
    mov al, [sensor_value]
    mov bl, 0x08  ; THRESHOLD_HIGH
    cmp al, bl
    ja alarm_on   ; Jump if sensor > THRESHOLD_HIGH

    mov bl, 0x02  ; THRESHOLD_LOW
    cmp al, bl
    jae motor_on  ; Jump if THRESHOLD_LOW <= sensor <= THRESHOLD_HIGH

    ; Default: Turn off motor and alarm
    mov byte [motor_status], 0x00
    mov byte [alarm_status], 0x00
    jmp exit

alarm_on:
    mov byte [alarm_status], 0x01
    jmp exit

motor_on:
    mov byte [motor_status], 0x01
    mov byte [alarm_status], 0x00
    jmp exit

exit:
    ; Exit program
    mov eax, 1
    int 0x80

