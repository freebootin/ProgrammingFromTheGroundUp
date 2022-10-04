# All About Functions

## x64 Incompatibility

As I continue working through this book I am coming up on problems with the example code. All of the code in this book is written with the assumption that you have a 32 bit machine. However, 32 bit desktops are obsolete at this point, and 32 bit assembly is not fully compatible with 64 bit machines, at least not when running Linux. 

From this point on I am going to attempt to port the 32 bit examples into 64 bit and do the chapter problems in 64 bit.  As a reference I am going to be using [https://www.cs.oberlin.edu/~bob/cs331/Notes%20on%20x86-64%20Assembly%20Language.pdf](Notes On x86-64 Assembly Language), a short 10 page informational on x86-64 assembly and its differences from x86.

Before completely abandoning x86 I'm first going to try to assembly everything using `gcc -m32` and see if that works. 
