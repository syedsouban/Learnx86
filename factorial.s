.section .data
	number:
		.long 6
.section .text
	.globl _start
_start:
	movl number,%ecx
	movl number,%ebx
	movl $1, %edx
fact:
	subl $1, %ecx
	cmpl $0, %ecx
	je exit
	imul %ecx, %ebx
	jmp fact
exit:
	movl $1, %eax
	int $0x80
