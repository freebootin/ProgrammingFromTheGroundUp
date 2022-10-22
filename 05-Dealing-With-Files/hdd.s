#PURPOSE: Create a file named `haynow.txt` and write the words "Hay diddle diddle!" into it.
#

# What do I need...

.section .data

# CONSTANTS

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

_start:

# Create and open a file called `haynow.txt`.
open_fd_out:
	movl $SYS_OPEN, %eax			# Select open syscall
	movl $out_file, %ebx			# Select output filename
	movl $O_CREAT_WRONLY_TRUC, %ecx		# Set options
	movl $0666, %edx			# Set permissions
	int $LINUX_SYSCALL
	
	movl %eax, ST_FD_OUT(%ebp)		# Save file discriptor on stack
# Write "Hay diddle diddle!" into `haynow.txt`.

# Close `haynow.txt`

# Return 0.
