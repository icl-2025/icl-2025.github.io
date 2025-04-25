        .text
        .globl main

main:
        pushq   %rbp
        movq    %rsp, %rbp
        movq    X, %rdi
        movq    Y, %rsi
        addq    %rdi, %rsi
        movq    $message, %rdi
        xorq    %rax, %rax
        call    printf
        xorq    %rax, %rax
        popq    %rbp
        ret

        .data
message:
        .string "%d\n"
X:
        .quad 2
Y:
        .quad 4
