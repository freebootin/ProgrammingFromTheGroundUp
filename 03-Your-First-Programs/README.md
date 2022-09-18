# Your First Programs
This chapter focuses on the basics of assembly.

## Assembly Basics

- Comments start with `#`.
- Anything starting with a `.` is and *assembler directive*.
- `.globl _start` marks the entry point of your program. Every program needs to have this.
- You can think of `_start` as the main function for assembly.
- `.globl` can be thought of as a truly global variable. It can be seen by the operating system, not just other functions.

## Addressing Modes

- Immediate Mode: `$[number]`
- Index Addressing Mode: `[cmd] BEGINNINGADDRESS(,%INDEXREGISTER,WORDSIZE)`
- Direct Addressing Mode: `[cmd] ADDRESS`
- Indirect Addressing Mode: `[cmd] (%register)`
- Base Pointer Addressing Mode: `[cmd] CONSTANT(%register)`
- Register Addressing Mode: `[cmd] %register`

---

## Review

### Know the Concepts

1. What does it mean if a line in a program starts with `#`? It means that line is a comment and will not be read by the assembler.
1. What is the difference between an assembly language file and an object code file? An assembly language file contains human readable assembly language while an object file contains unlinked machine code.
1. What does the linker do? The linker takes all the object files in you program and links them together using symbols inside the object files. This results in a final executable binary.
1. How do you check the result status code of the last program you ran? The status code of the last program you ran is saved by the shell in the environment variable `$?`. You can check its value with `echo $?`.
1. What is the difference between `movl $1, %eax` and `movl 1, %eax`? `movl $1, %eax` is using immediate mode addressing and is moving the value `1` into the register `%eax`. `movl 1, %eax` is using direct addressing mode to try to move the value at the address `1` (assuming it exists) into the register `%eax`.
1. What register holds the system call number? `eax` holds the system call number for Linux systems.
1. What are indexes used for? Indexes are used to move through sets of data by a fixed amount.
1. Why do indexes usually start at 0? Indexes usually start at 0 because they a multiple of an offset that is added to the base address. An index of 2 would indicate the address is 2 * (data size) blocks away from the base address. So an index of 0 would be the base address itself.
1. If I issued the command `movl data_items(,%edi,4), %eax` and data_items was address 3634 and %edi held the value 13, what address would you be using to move into %eax? This command is using *Index Addressing Mode* so %edi is the index and 4 is the word size.  So the address we are moving into %eax is 3634 + (13 * 4) = 3686.
1. List the general-purpose registers. For 32 bit x86 processors you have 6 general purpose registers: %eax, %ebx, %ecx, %edx, %edi, and %esi. When using 64 bit x86 processors you get %rax, %rbx, %rcx, %rdx, %rsi, %rdi, %rbp, and %rsp which are all extensions of the 32 bit registers. You also get eight more, r8-r15.
1. What is the difference between `movl` and `movb`? The difference between `movl` and `movb` is the size of the memory the instruction works on. `movl` works with `longs` which are four bytes long, while `movb` works with `bytes` which are only one byte long.
1. What is flow control? Flow control describes how the use of conditionals and jumps can affect which part of the program will execute next.
1. What does a conditional jump do? A conditional jump jumps to a different part of the program depending on the result of a comparison instruction.
1. What things do you have to plan for when writing a program? When writing a program you want to plan out what data you will be working with and how you will represent it, what your inputs and outputs will be, what flow control if any you will need, and how your user will interact with it.
1. Go through every instruction and list what addressing mode is being used for each operand(I am assuming they mean each instruction in the example programs for this chapter, not every instruction the x86 has). See comments in each example program.

### Use the Concepts

1. Modify the first program to return the value 3. Changing value that you load into `%ebx` will change the return value. The return value appears to be only one byte in length. For values greater than 255 it appears to roll over, returning a 0 for a value of 256 and a 1 for 257.
1. Modify the `maximum` program to find the minimum instead. This is easily done by changing the line `jle start_loop` to `jge start_loop`. Now instead of checking if the current biggest value is less than or equal to the one being tested, we get the smallest value being greater than or equal to that being tested. If you only make this change then you will get a `0` as your smallest value. This is because even though `0` is used to mark the end of the list it is still compaired before ending the program. You can change one or more values to be negative and that will get you an answer other than `0`. There is a problem with this though, the return value of a process can only be 0 to 255 inclusive. Any negative value you return will rollover and give you positive values, eg. -1 will return 255.
1. Modify the `maximum` program to use the number 255 to end the list rather than the number 0. To change the terminal number to 255 just change the comparison at the start of `start_loop` to `cmpl $255, %eax` and add `255` to `data_items`. This has the same affect as having 0 end the list for `minimum` in that you will always get 255 as a result. Now you can have number in `data_items` larger than 255, but again they will rollover to a number between 0 and 255 when you check the return value. This is for the same reason that negative numbers do not print in the return value of `minimum`. 
1. Modify the `maximum` program to use the ending address rather than the number 0 to know when to stop.
