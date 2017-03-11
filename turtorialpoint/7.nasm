SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

segment .data
	
	msg1 db "Enter a Digit",0xA,0xD
	len1 equ $- msg1

	msg2 db 'Please Enter a Secound Digit :',0xA,0xD
	len2 equ $- msg2

	msg3 db 'The sum is : '
	len3 equ $- msg3

segment .bss

	num1 resb 2
	num2 resb 2
	res resb 1

section .text
	global __start

_start:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, len1
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, len2
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, len3
	int 0x80

	mov eax, [num1] ; moving first input to eax
	sub eax, '0' ; subtracting asccii '0' to convert it into a decimal number

	mov ebx, [num2]
	sub ebx, '0'

	add eax, ebx ; this will add ebx to eax
	add eax, '0'  ; add '0' to convert them sum from decimal to ascii

	mov [res], eax ; after converting eax value to ascci now Storing the sum in memory location res

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 0x80

exit:
	
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
