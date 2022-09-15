# Your First Programs
This chapter focuses on the basics of assembly.

## Assembly Basics

- Comments start with `#`.
- Anything starting with a `.` is and *assembler directive*.
- `.globl _start` marks the entry point of your program. Every program needs to have this.
- You can think of `_start` as the main function for assembly.
- `.globl` can be thought of as a truly gobal variable. It can be seen by the operating system, not just other functions.

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
1. How do you check the result status code of the last program you ran? The status code of the last program you ran is saved by the shell in the enviroment variable `$?`. You can check its value with `echo $?`.
1. What is the difference between `movl $1, %eax` and `movl 1, %eax`? `movl $1, %eax` is using immediate mode addressing and is moving the value `1` into the register `%eax`. `movl 1, %eax` is using direct addressing mode to try to move the value at the address `1` (assuming it exists) into the register `%eax`.
