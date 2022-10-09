# PURPOSE: Calculate the factorial of a number without using recursion.
#

.section .data

.section .text

.globl _start

_start:
	pushl $4		# Push first argument onto the stack.
	call factorial		# Call factorial function.
	movl %eax, %ebx		# Return value is in %eax, move it to %ebx.
	movl $1, %eax		# Load exit() syscall.
	int $0x80		# Exit

.type factorial, @function
factorial:
	pushl %ebp		# Function setup
	movl %esp, %ebp

	movl 8(%ebp), %eax	# Move argument into return register, this will act
				# as an accumulator.

	movl %eax, %ebx		# Copy argument into %ebx. %ebx will hold the
				# value that gets multiplied to the accumulator.
start_loop:
	decl %ebx		# Decrement %ebx.
	cmpl $0, %ebx		# Check if %ebx is 0. If so we are done.
	je end_factorial

	imull %ebx, %eax	# Multiply accumulator by %ebx, store in %eax.
	jmp start_loop

end_factorial:
	movl %ebp, %esp		# Function return.
	popl %ebp
	ret
