#PURPOSE:	This porgram finds the maximum number of a
#		set of data items.
#

#VARIABLES:	The registers have the following uses:
#
#	data_items - contains the item data. A 0 is used to
#		     to terminate the data.
#

.section .data

data_items:	#These are the data items
.long 3, 67, 34, 222, 200, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0	# length: 15

.section .text

.globl _start

_start:
	pushl $data_items		# Push a pointer to data_items onto the stack.
	call maximum			# Call the maximum function.
	movl %eax, %ebx			# %eax has maximum's return value. Move it to %ebx.
	movl $1, %eax			# Load exit syscall.
	int $0x80			# Execute syscall.

.type maximum, @function
maximum:
	pushl %ebp			# Save the base point on the stack.
	movl %esp, %ebp			# Move the stack pointer into the base pointer.

	movl 8(%ebp), %ecx		# Get data pointer and move it to %ecx.
	movl (%ecx), %eax		# since this is the first item %eax is the biggest
	
start_loop:				# start loop
	cmpl $0, (%ecx)			# check to see if we've hit the end (Immediate Mode)
	je loop_exit			# (Direct Addressing Mode)
	addl $4, %ecx			# Should increment to next address.
	cmpl %eax, (%ecx)		# compare values (Register Addressing Mode)
	jle start_loop			# jump to loop beginning if the new (Direct Addressing Mode)
					# one isn't bigger
	movl (%ecx), %eax		# move the value as the largest (Register Addressing Mode)
	jmp start_loop			# jump to loop beginning (Direct Addressing Mode)

loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
	movl %ebp, %esp			# Restore base pointer.
	popl %ebp			# Expose return address.
	ret
