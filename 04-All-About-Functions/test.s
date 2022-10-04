.section .rodata
.WriteIntString: .string "%d"
.WritelnString: .string "\n"
.text
.globl main
f:
movq %rsp, %rbx # set up t he f rame point er
movq 16(%rbx) , %rax # argument value
imul $2, %eax # perf orming mult iplicat ion
ret # ret urn f rom t he f unct ion
main:
movq %rsp, %rbx # set up t he f rame point er
sub $8, %rsp # allocat e local variable i
movl $0, %eax # put t ing value int o ac
movl %eax, -8(%rbx) # assign t o i
.L0 :
cmpl $ 10 , -8(%rbx) # compare i and 1 0
jge .L1 # if i >= 1 0 leave t he loop
movl -8(%rbx) , %esi # value t o print ( arg2 f or t he call)
movq $.WriteIntString, %rdi
movl $0, %eax # clear t he ret urn value
call printf # call t he C-lib print f f unct ion
push -8(%rbx) # pushing argument f or t he call t o f
push %rbx # pushing t he f rame point er
call f # calling t he f unct ion
pop %rbx # ret rieving t he f rame point er
add $8, %rsp # removing args f rom t he st ack
movl %eax, %esi # value t o print ( arg2 f or t he call)
movq $.WriteIntString, %rdi
movl $ 0 , %eax # clear t he ret urn value
call printf # call t he C-lib print f f unct ion
movq $.WritelnString, %rdi
movl $0, %eax # clear t he ret urn value
call printf # call t he C-lib print f f unct ion
movl -8( %rbx) , %eax # value of i
addl $1, %eax # perf orming addit ion
movl %eax, -8( %rbx) # assign
jmp .L0 # WHILE: jump back t o t op
.L1 :
add $8, %rsp # deallocat e local variables
ret # ret urn f rom t he f unct ion
