#PURPOSE:	This porgram finds the minimum number of a
#		set of data items.
#

#VARIABLES:	The registers have the following uses:
#
#	%edi - Holds the index of the data item being examined
#	%ebx - Smallest data item found
#	%eax - Current data item
#
#	The following memory locations are used:
#
#	data_items - contains the item data. A 0 is used to
#		     to terminate the data.
#

.section .data

data_items:	#These are the data items
.long 3, 67, -1, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

.section .text

.globl _start

_start:
	movl $0, %edi			# move 0 into the index register (Immediate Mode)
	movl data_items(,%edi,4), %eax	# load the first byte of data (Index Addressing Mode)
	movl %eax, %ebx			# since this is the first item, (Register Addressing Mode)
					# %eax is the smallest
	
start_loop:				# start loop
	cmpl $0, %eax			# check to see if we've hit the end (Immediate Mode)
	je loop_exit			# (Direct Addressing Mode)
	incl %edi			# load next value (Register Addressing Mode)
	movl data_items(,%edi,4), %eax	# (Index Addressing Mode)
	cmpl %ebx, %eax			# compare values (Register Addressing Mode)
	jge start_loop			# jump to loop beginning if the new (Direct Addressing Mode)
					# one isn't smaller
	movl %eax, %ebx			# move the value as the largest (Register Addressing Mode)
	jmp start_loop			# jump to loop beginning (Direct Addressing Mode)

loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
	movl $1, %eax			# 1 is the exit() syscall (Immediate Addressing Mode)
	int $0x80			# (Immediate Addressing Mode)
