; Executable name : EATSYSCALL
; Version         : 1.0
; Created date    : 19/08/2021
; Last Update     : 19/08/2021
; Author          : r41ng3l
; Description     : Salutate the Abyss
;
; Build using these commands:
; 	nasm -f elf -g -F stabs abyssalcall.asm
; 	ld -o abyssalcall abyssalcall.o
;

SECTION .data		       ; Section containing initialized data

AbssMsg: db "Hello Abyss", 10
AbssLen: equ $-AbssMsg

SECTION .bss                    ; Section containing unintialized data
SECTION .text                   ; Section containing code
                                
global _start                    ; Linker needs this to find the entry point!
                                
_start:                         
	nop		        ; This no-op keeps gdb happy (see text)
	mov eax, 4              ; Specify sys_write syscall
	mov ebx, 1              ; Specify File Descriptor 1: Standard Output
	mov ecx, AbssMsg         ; Pass offset of the message
	mov edx, AbssLen	; Pass the length of the message
	int 80H			; Make syscall to output the text to stdout

	mov eax, 1		; Specify Exit syscall
	mov ebx, 0		; Return a code of zero
	int 80H			; Make syscall to terminate the program
