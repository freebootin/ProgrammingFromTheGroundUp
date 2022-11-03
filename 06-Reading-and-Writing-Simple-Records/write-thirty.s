#PURPOSE: Create a program that uses a loop to write 30 identical
#	  records to a file.

.include "record-def.s"		# Record offsets
.include "linux.s"		# Linux syscall defs

.section .data

# The record to be writen, structured according to 'record-def.s'.

record:
	.ascii "Billy Bob\0"
	.rept 30 # Pad to 40 bytes
	.byte 0
	.endr

	.ascii "Johnson\0"
	.rept 32 # Pad to 40 bytes
	.byte 0
	.endr

	.ascii "1234 N Fake St.\nDerp, CA 66666\0"
	.rept 210 # Pad to 240 bytes
	.byte 0
	.endr

	.ascii "Gemini\0"
	.rept 5 # Pad to 12 bytes
	.byte 0
	.endr

	.long 69

# End record

# Output filename
file_name:
	.ascii "thirty.dat\0"
	
	.equ ST_FILE_DESCRIPTOR, -4
	.equ LOOP_COUNTER, -8
	.globl _start


_start:
	movl %esp, %ebp
	subl $8, %esp			# allocate space to hold file discriptor/counter

	movl $SYS_OPEN, %eax		# Open output file
	movl $file_name, %ebx
	movl $0101, %ecx		# Create file if not exist and open for writing
	movl $0666, %edx
	int $LINUX_SYSCALL

	movl %eax, ST_FILE_DESCRIPTOR(%ebp)	# Store file discriptor
	movl $30, LOOP_COUNTER(%ebp)		# Initialize loop counter

loop_start:
	cmpl $0, LOOP_COUNTER(%ebp)		# Check if loop is finished
	je loop_end
	
	pushl ST_FILE_DESCRIPTOR(%ebp)
	pushl $record
	call write_record
	addl $8, %esp
	decl LOOP_COUNTER(%ebp)

	jmp loop_start

loop_end:
	movl $SYS_CLOSE, %eax			# Close file discriptor
	movl ST_FILE_DESCRIPTOR(%ebp), %ebx
	int $LINUX_SYSCALL

	movl $SYS_EXIT, %eax			# Exit
	movl $0, %ebx
	int $LINUX_SYSCALL
