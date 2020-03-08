.section .data

.section .text
	.globl _start
	_start:
		pushl $5 #exponent
		pushl $3 #base
		call power
		movl $1, %eax
		int $0x80
	.type power @function	
		power:
			pushl %ebp
			movl %esp,%ebp
			movl 8(%ebp),%ecx
			movl 12(%ebp),%eax
			movl %ecx, %ebx
			loop:
				cmpl $1,%eax
				je exit
				imull %ecx, %ebx
				subl $1, %eax
				jmp loop
			exit:
				movl %ebp,%esp
				popl %ebp
				ret	
