write-records:
	as -32 write-records.s -o write-records.o
	as -32 write-record.s -o write-record.o
	ld -m elf_i386 write-record.o write-records.o -o write-records

read-records:
	as -32 count-chars.s -o count-chars.o
	as -32 write-newline.s -o write-newline.o
