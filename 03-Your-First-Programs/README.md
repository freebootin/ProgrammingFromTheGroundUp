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
