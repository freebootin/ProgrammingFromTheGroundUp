# Reading and Writing Simple Records

---
## Review

- For some reason ARGC seems to include the name of the program. So two command line arguments would be have ARGC = 3.

### Know the Concepts

1. What is a record? A record is some amount of persistent, structured data that can potentially be read by a program.
1. What is the advantage of fixed-length records over variable-length records? Fixed-length records take up a known fixed amount of space per record and they can easily be structured to use base pointer addressing for access.That is opposed to each field being referenced by a pointer.
1. How do you include constants in multiple assembly source files? One way to include constants in multiple assembly source files is to place them all in one source file, then to use the `include` directive to include that file in any other source file that needs those constants.
1. Why might you want to split up a project into multiple source files? You might want to split your source code into many different files to make it easier to organize and navigate. You might include all code implementing some functionality into its own file. That way it is very clear that the code in that file is only pertaining to that functionality. Also, as programs get larger you might not want to have to navigate though a 10,000 line file.
1. What does the instruction `incl record_buffer + RECORD_AGE` do? What addressing mode is it using? How many operands does the `incl` instruction have in this case? Which parts are being handled by the assembler and which parts are being handled when the program is run? The instruction `incl record_buffer + RECORD_AGE` adds one to that number stored at the address `record_buffer + RECORD_AGE`. It is using `direct addressing mode`. It is taking only one operand. The buffer `record_buffer` is being handled by the assembler. `RECORD_AGE` is handled at runtime.

### Use the Concepts

1. Add another data member to the person structure defined in this chapter, and rewrite the reading and writing functions and programs to take them into account.

### Going Further
