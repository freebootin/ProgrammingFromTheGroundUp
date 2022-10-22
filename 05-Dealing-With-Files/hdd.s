#PURPOSE: Create a file named `haynow.txt` and write the words "Hay diddle diddle!" into it.
#

# What do I need...

.section .data

# CONSTANTS

.equ FD, 4
# system call numbers
.equ SYS_CLOSE, 6
.equ SYS_OPEN, 5
.equ SYS_WRITE, 4
.equ SYS_READ, 3
.equ SYS_EXIT, 1

# options for open system call
.equ O_RDONLY, 0
.equ O_CREAT_WRONLY_TRUNC, 03101

# standard file discriptors
.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2

# system call interrupts
.equ LINUX_SYSCALL, 0x80


# Store "Hay diddle diddle!" in an array.
msg:
	.ascii "Hay diddle diddle!"
	# "len" will calculate the current offset minus the "msg" offset.
	# This should give you the size of "msg".
	len = . - msg
	
# name of output file
out_file:
	.ascii "haynow.txt"

.section .text

.globl _start

_start:

	movl %esp, %ebp
	
# Create and open a file called `haynow.txt`.
open_fd_out:
	movl $SYS_OPEN, %eax			# Select open syscall
	movl $out_file, %ebx			# Select output filename
	movl $O_CREAT_WRONLY_TRUNC, %ecx	# Set options
	movl $0666, %edx			# Set permissions
	int $LINUX_SYSCALL
	
	movl %eax, FD(%ebp)		# Save file discriptor on stack
# Write "Hay diddle diddle!" into `haynow.txt`.
	movl %eax, %ebx				# file discriptor
	movl $msg, %ecx				# buffer start
	movl $len, %edx				# buffer size
	movl $SYS_WRITE, %eax
	int $LINUX_SYSCALL

# Close `haynow.txt`
	movl FD(%ebp), %ebx
	movl $SYS_CLOSE, %eax
	int $LINUX_SYSCALL

# Return 0.
	movl $0, %ebx
	movl $SYS_EXIT, %eax
	int $LINUX_SYSCALL
