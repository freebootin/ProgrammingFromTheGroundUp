#PURPOSE:	This porgram finds the maximum number of a
#		set of data items.
#

#VARIABLES:	The registers have the following uses:
#
#	%ebx - Largest data item found
#	%eax - Current data item
#	%ecx - Current data item address
#	%edx - Final data item address
#
#	The following memory locations are used:
#
#	data_items - contains the item data. 
#		     
#

.section .data

data_items:	#These are the data items
.long 3, 67, 34, 222, 200, 45, 75, 54, 34, 44, 33, 22, 11, 66, 1, 252	# length: 15

.section .text

.globl _start

_start:
	movl $data_items, %ecx		# Copy the address of data_items into %ecx. %ecx is now
					# a pointer to our current data.

	movl %ecx, %edx			# Copy the address of data_items into %edx.
	addl $64, %edx			# Add 16 * 4 (bytes) to the address of data_items.
					# This should add up to the address of the final item.

	movl (%ecx), %ebx		# First data_item is by default the largest.

start_loop:
	add $4, %ecx			# Advance to next data item	
	cmpl %ecx, %edx			# Check if current address (ecx) is same as final (edx)
	je exit_loop			# If true jump to exit_loop.
	cmpl %ebx, (%ecx)		# Compaire current data_item to current largest value.
	jle start_loop			# If new item isn't bigger, jump to start_loop

	movl (%ecx), %ebx		# Move new largest value into %ebx.
	jmp start_loop			# Back to start_loop.

exit_loop:
	movl $1, %eax			# 1 is the exit() syscall (Immediate Addressing Mode)
	int $0x80			# (Immediate Addressing Mode)
