# All About Functions

## x64 Incompatibility

As I continue working through this book I am coming up on problems with the example code. All of the code in this book is written with the assumption that you have a 32 bit machine. However, 32 bit desktops are obsolete at this point, and 32 bit assembly is not fully compatible with 64 bit machines, at least not when running Linux. 

From this point on I am going to attempt to port the 32 bit examples into 64 bit and do the chapter problems in 64 bit.  As a reference I am going to be using [https://www.cs.oberlin.edu/~bob/cs331/Notes%20on%20x86-64%20Assembly%20Language.pdf](Notes On x86-64 Assembly Language), a short 10 page informational on x86-64 assembly and its differences from x86.

Before completely abandoning x86 I'm first going to try to assembly everything using `gcc -m32` and see if that works. 

Okay I finally figured it out. First you tell your assembler to generate 32 bit objects, `as -m32 -o [output].o [inputfile]`. Next tell the linker to link a 32 bit ELF binary, `ld -m elf_i386 -o [outputfile] [inputfile].o`.

Also you will probably need to install gcc's multilib packages `gcc-multilib` and `g++-multilib`.

---
## Review

### Know the Concepts

1. What are primitives? Primitives are the most basic functions provided by the operating system or run time. Everything else is built off of them.
1. What are calling conventions? A calling convention is the process defined by a programming language for passing parameters to functions, call those functions, and receiving any returned value.
1. What is the stack? The stack is a data structure provided to the program to store data during runtime. It can be conceptualised as a stack of paper, with each sheet having one value. These sheets can be added to or removed from the stack.
1. How do `pushl` and `popl` affect the stack? `pushl` takes the value given it and places it on top of the stack, while `popl` takes the top most value of the stack, returns a copy to the address provided, then removes that value from the stack. What special-purpose register do they affect? They affect the `%esp` or 'stack pointer'. This is a register that holds a pointer to the top most item on the stack. Pushing to the stack decrements `%esp`, as the stack starts at the highest memory address and moves down, while popping from the stack increments `%esp`.
