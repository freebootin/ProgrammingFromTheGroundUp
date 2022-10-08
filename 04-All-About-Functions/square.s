#PURPOSE:	Program to compute the square of a number. 
#

#Everything in the main program is stored in registers,
#so the data section doesn't have anything.
.section .data

.section .text

.globl _start

_start:
	push $2			#push first argument to stack
	call square		#call the square function

	movl %eax, %ebx		#move answer into %ebx
	movl $1, %eax		#exit syscall
	int $0x80

#PURPOSE: This function is used to compute the square of a number.
#

#INPUT: First argument - the number.
#

#OUTPUT: Will give the result as a return value
#

#VARIABLES:
# %eax holds the return value.
#

.type square, @function
square:
	pushl %ebp		#save old base pointer
	movl %esp, %ebp		#copy stack pointer to base pointer
	subl $4, %esp		#allocate space for copy of number
	movl 8(%ebp), %eax	#copy number into %eax
	imull 8(%ebp), %eax	#square number
	movl %ebp, %esp		#reset the stack pointer
	popl %ebp		#pop old base pointer, exposing return address
	ret
