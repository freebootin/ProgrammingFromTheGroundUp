objects = add-year.o count-chars.o read-record.o read-records.o write-newline.o \
	  write-record.o write-records.o write-thirty.o

write-records:
	as -32 write-records.s -o write-records.o
	as -32 write-record.s -o write-record.o
	ld -m elf_i386 write-record.o write-records.o -o write-records

read-records:
	as -32 read-record.s -o read-record.o
	as -32 count-chars.s -o count-chars.o
	as -32 write-newline.s -o write-newline.o
	as -32 read-records.s -o read-records.o
	ld -m elf_i386 read-record.o count-chars.o write-newline.o read-records.o -o read-records

add-year:
	as -32 add-year.s -o add-year.o
	as -32 read-record.s -o read-record.o
	as -32 write-record.s -o write-record.o
	ld -m elf_i386 add-year.o read-record.o write-record.o -o add-year

write-thirty:
	as -32 write-thirty.s -o write-thirty.o
	as -32 write-record.s -o write-record.o
	ld -m elf_i386 write-thirty.o write-record.o -o write-thirty

clean:
	rm $(objects)
