#PURPOSE: Scan a list of records and return the largest
#	  age found as the status code.

# Includes:
.include "record-def.s"
.include "linux.s"

.section .data

age:
	.long 0

input_file_name:
	.ascii "test.dat\0"

.section .bss
	.lcomm record_buffer, RECORD_SIZE

.section .text
.globl _start
_start:
	
loop_start:
	pushl $input_file_name
	pushl record_buffer
	call read_record
	
# alocate a buffer to hold the return of the open syscall

# call read_record in a loop
# everytime send the returned data to the buffer
# check the age, if larger than last it is now largest
# when EOF close file
# move largest into %ebx and call EXIT syscall
