; Author:  Steven Jordaan
; Date:    2025
; Purpose: Lecture 2 Exercise on Integer Arithmetic and Bit operations
; 
; For more information and free learning resources, follow the link:
;   https://www.youtube.com/watch?v=dQw4w9WgXcQ
; 
; Debugger Cheatsheet:
; 
; Expressions in the watch window in VSCode:
; - (type)(source) : Display 'source' interpreted as 'type'
; - (type)(source >> N) & 0xff : Display Nth byte of 'source' interpreted as 'type'
; 
; 'type' can be basic data types like char, int, etc.
; 'source' can be registers like rax, rbx, etc., or memory addresses.
; 'N' is the number of bytes to shift to the right to get to the desired byte.
;
; Examples:
; - (char)(rax & 0xff) : Display least significant byte of rax as char
; - (char)((rax >> 8) & 0xff) : Display second byte of rax as char
; 
; Working with byte strings:
; *(char*)0x12345678 : Display byte at address 0x12345678 as char
; *(char*)label : Display byte at address of label as char
; *(char*)(label + N) : Display Nth byte after label as char
; *(char*)label@N : Display N bytes after label as char
; 
; For hex | oct:
; (value),h
; (value),o
section .text
    global encrypt
    global decrypt

encrypt:
    ; Arguments are passed through rdi (string) and rsi (key)

    ; Load the string and key into registers
    mov eax, dword [rdi]
    mov ebx, dword [rsi]

    ; XOR and rotate left to get ciphertext
    xor eax, ebx
    rol eax, 8

    ; Negate the bits
    not eax

    ; Store the ciphertext back into the string
    mov dword [rdi], eax

    ret

decrypt:
    ; Arguments are passed through rdi (string) and rsi (key)

    ; Load the ciphertext and key into registers
    mov eax, dword [rdi]
    mov ebx, dword [rsi]

    ; Negate the bits
    not eax

    ; Rotate right
    ror eax, 1

    ; XOR with the key to get plaintext
    xor eax, ebx

    ; Store the decrypted text back into the string
    mov dword [rdi], eax

    ret