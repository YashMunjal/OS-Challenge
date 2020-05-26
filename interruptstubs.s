.section .text

.extern _ZN4myos21hardwarecommunication16InterruptManager15HandleInterruptEhj

.macro HandleInterruptRequest num
.global _ZN4myos21hardwarecommunication16InterruptManager26HandleInterruptRequest\num\()Ev
_ZN4myos21hardwarecommunication16InterruptManager26HandleInterruptRequest\num\()Ev: 

int_bottom:

    pusha
    pushl %ds
    pushl %es
    pushl %fs
    pushl %gs
    
    pushl %esp
    push(interruptnumber)
    call _ZN4myos21hardwarecommunication16InterruptManager15HandleInterruptEhj
    movl %eax, %esp 

    popl %gs
    popl %fs
    popl %es
    popl %ds
    pusha

    iret
    
.data 
    interruptnumber: .byte 0;
