.set IRQ_BASE, 0x20

.section .text

.extern _ZN4myos21hardwarecommunication16InterruptManager15HandleInterruptEhj


.macro HandleException num
.global _ZN4myos21hardwarecommunication16InterruptManager19HandleException\num\()Ev
_ZN4myos21hardwarecommunication16InterruptManager19HandleException\num\()Ev:
    movb $\num, (interruptnumber)
    jmp int_bottom
.endm


.macro HandleInterruptRequest num
.global _ZN4myos21hardwarecommunication16InterruptManager26HandleInterruptRequest\num\()Ev
_ZN4myos21hardwarecommunication16InterruptManager26HandleInterruptRequest\num\()Ev: 
    movb $\num + IRQ_BASE, (interruptnumber)
    pushl $0
    jmp int_bottom
.endm

HandleException 0x00
HandleException 0x01

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
