# Dealing With Files

---
## Review

### Know the Concepts

1. Describe the lifecycle of a file descriptor. A file descriptor begins when it is requested from the operating system. The program requests a file from the OS by name, the OS then returns a file descriptor. This descriptor is included in all system calls that pertain to that file. Finally, when the file is closed the file descriptor is discarded as it is no longer needed.
1. What are the standard file descriptors and what are they used for? The standard file descriptors are STDIN, STDOUT, and STDERR. STDIN, or standard input, is usually pointing to the keyboard, but could also be data that is piped in from another program. STDOUT, or standard output, is usually the monitor. Finally, STDERR, or standard error, is also usually the monitor and is the destination for most error messages.
1. What is a buffer? A buffer is a segment of memory defined by the program for temporary storage of data determined at runtime. 
1. What is the difference between the `.data` section and the `.bss` section? The `.data` section contains data defined when the program is written, while `.bss` contains buffers used to store data what will be defined during the programs execution.
1. What are the system calls related to reading and writing files? The linux system calls related to reading and writing files are `open`, `write`, `read`, and `close`.

### Use the Concepts

1. Mdify the `toupper` program so that it reads from `STDIN` and writes to STDOUT instead of using the files on the command line. See `toupper2.s`.
1. Change the size of the buffer. See `toupper3.s`.
1. Rewrite the program so that it uses storage in the `.bss` section rather than the stack to store the file descriptors. See `toupper4.s`.
1. Write a program that will create a file called `heynow.txt` and write the words "Hay diddle diddle!" into it. See `hdd.s`
