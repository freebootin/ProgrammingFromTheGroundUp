.include "linux.s"
.include "record-def.s"

.section .data

# Constant date of the records we want to write.
# Each text data item is padded to the proper
# length with null (i.e. 0) bytes.

# .rept is used to pad each item. .rept tells
# the assembler to repeat the section between
# .rept adn .endr the number of times specified.
# This is used in theis program to add extra null
# characters at the end of each field to fill it up.

record1:
	.ascii "Fredrick\0"
	.rept 31 # Padding to 40 bytes
	.byte 0
	.endr

	.ascii "Bartlett\0"
	.rept 31 # Padding to 40 bytes
	.byte 0
	.endr

	.ascii "4242 S Prairie\nTulsa, OK 55555\0"
	.rept 209 # Padding to 240 bytes
	.byte 0
	.endr

	.long 45

record2:
	.ascii "Marilyn\0"
	.rept 32 # Padding to 40 bytes
	.byte 0
	.endr

	.ascii "Taylor\0"
	.rept 33 # Padding to 40 bytes 
	.byte 0
	.endr

	.ascii "2224 S Johannan St\nChicago, IL 12345\0"
	.rept 203 # Padding to 240 bytes
	.byte 0
	.endr

	.long 29

record3:
	.ascii "Derrick\0"
	.rept 32 # Padding to 40 bytes
	.byte 0
	.endr

	.ascii "McIntire\0"
	.rept 31 # Padding to 40 bytes
	.byte 0
	.endr

	.ascii "500 W Oakland\nSan Diego, CA 54321\0"
	.rept 206 # Padding to 240 bytes
	.byte 0
	.endr

	.long 36
