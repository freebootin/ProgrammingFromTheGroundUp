#Chapter 2: Computer Architecture

## Structure of Computer Memory
All computer memory is implemented in the same way; a group of addressable cells that each can store a single number. As a result, all data on a computer must be stored in the form a numbers. It is up to the programmer to determine what each number means though, as the computer has no way of knowing.

## The CPU
The CPU does the actual computing. It reads instructions from memory one at a time and executes them. This is known as the ~fetch-execute cycle~. The CPU has five components that it uses to run the fetch-execute cycle: the program counter, the instruction decoder, the data bus, the general-purpose registers, and the arithmetic and logic unit.

### Program Counter
The program counter tell the CPU where to get its next instruction. It holds the memory address of the next instruction.

### Instruction Decoder
The instruction decoder does just that, it decodes instructions.

### Data Bus
The data bus can be thought of as the actual wire connecting the CPU and the memory (RAM).

### General Purpose Registers
These are small segments of memory inside the CPU. This is where most of your assembly language code will be working.

### Arithmetic and Logic Unit
This is the part of the CPU that information from the registers are passed to for actual processing.

## Data Accessing Methods
There are a number of different ways that processors have of accessing data. These are known as ~addressing modes~.

### Immediate Mode
The simplest mode in which the data to access is embedded in the instruction itself. For example, if we want to initialize a register to 0, instead of giving the computer and address to read the 0 from, we would specify immediate mode, and give it the number 0.

### Register Addressing Mode
The instruction contains a register to access, rather than a memory address.

### Direct Addressing Mode
The instruction contains the memory address to access. Fore example, I could say, please load this register with data at address 2002. The computer would go directly to byte number 2002 and copy the contents into the register.

### Index Addressing Mode
The instruction contains a memory address to access, and also specifies an ~index register~ to offset that address. For Example, we could specify address 2002 and an index register. If the index register contains the number 4, the actual address the data is loaded from would be 2006. This way, if you have a set of number starting at location 2002, you can cycle between each of the using an index register. On x86 processors, you can also specify a ~multiplier~ for the index. This allows you to access memory a byte at a time or a word at a time(4 bytes). If you are accessing an entire word, your index will need to be multiplied by 4 to get the exact location of the fourth element from your address.

### Indirect Addressing Mode
The instruction contains a register that contains a pointer to where the data should be accessed. For example, if we used indirect addressing mode and specified the `%eax` register, and the `%eax` register contained the value 4, whatever value was at memory location 4 would be used.

### Base Pointer Addressing Mode
This is similar to indirect addressing, but you also include a number called the ~offset~ to add to the register's value before using it for lookup. This is one of the most commonly used addressing modes.

---
## Review

### Know the Concepts

1. The Fetch-Execute Cycle describes how the CPU repeatedly fetches instructions from the program counter and executes them, pushing the output into a register or onto the data bus.
1. A register is a segment of memory inside the CPU. They can be either general purpose and used like a scratch pad or specialized to certain tasks. Without registers, all data would have to stored and operated on from general memory, requiring much more address bookkeeping. Registers are also much faster to access, being inside the CPU, so not having them would slow down processing.
1. Numbers larger than 255 are represented using multiple bytes. This is normally handled for you.
1. My machine is a 64 bit machine, so it will have 64 bit registers.
1. A computer does not know how to interpret any given byte or set of bytes. That is the responsibility of the programmer.
1. Descriptions of addressing modes are given above.
1. The instruction pointer is a special purpose register that holds the address of the current CPU instruction.

### Use the Concepts

1. Data for an employee record might include: name, id-number, salary. These could be laid out in memory as: 
`name (1 word address pointing to value at address)
id-number (1 word address pointing to value at address + 8 bytes)
salary (1 word address pointing to value at address + 16 bytes)
salary (1 word address pointing to value at address + 16 bytes)
`.
1. If you had a pointer to the beginning of the employee record above, and you wanted to access a particular piece of data inside it, you would probably use base pointer addressing mode.
1. In base pointer addressing mode, if you have a register holding the value 3122, and an offset of 20, then you would be trying to access the address 3122 + 20 = 3142.
1. In indexed addressing mode, if the base address is 6512, and the index register has a 5, and the multiplier is 4, then you would be trying to access 6532.
1. In index addressing mode, if the base address is 123472, the index register has a 0, and the multiplier is 4, the address you would be accessing is 123472.
1. In index addressing mode, if the base address is 9123478, the index register has a 20, and the multiplier is 1, the address you would be accessing is 9123498.

### Going Further

1. What are the minimum number of addressing modes needed for computation? You could hypothetically use only immediate mode to do JUST computation. Realistically you could use immediate mode and any one other addressing mode in order to access memory.
1. Why include addressing modes that aren't strictly needed? The extra addressing modes can be thought of as a convenience and as a way of simplifying some operations.
1. Research and describe how pipelining affects the fetch-execute cycle. Without pipelining, instructions move though all five stages of the fetch-execute cycle (fetch, decode, logic, memory, write) before a new instruction can enter the CPU. With pipelining as soon as the first instruction has moved past the fetch part of the cycle, a second instruction can enter behind it. This way you can have up to five instructions be processed during each cycle. This way pipelining can be used to implement a kind of parallelism.
Research and describe the trade-offs between fixed-length and variable-length instructions. When you have a variable length instruction set you can have many more possible instructions, however, you also have to have a multi-step fetch and decode which takes more time, circuitry, and power. Having a fixed length instruction set reduces the total number of instructions you can have, but it also does not require the extra circuitry to implement them. This save both power and time. The simplified fetch and decode step also make fixed length instruction sets easier to pipeline.
