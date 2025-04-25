        .text
        .globl main

fib:
        pushq   %rbp
        movq    %rsp, %rbp
        movq    $1, %rax
        cmpq    $0, %rdi
        je      Exit
        cmpq    $1, %rdi
        je      Exit
        pushq   %rdi
        subq    $2, %rdi
        call    fib
        popq    %rdi
        pushq   %rax
        subq    $1, %rdi
        call    fib
        popq    %rsi
        addq    %rsi, %rax
Exit:
        popq    %rbp
        ret

main:
        pushq   %rbp
        movq    %rsp, %rbp
        movq    $5, %rdi
        call    fib
        movq    $message, %rdi
        movq    %rax, %rsi
        xorq    %rax, %rax
        call    printf
        xorq    %rax, %rax
        popq    %rbp
        ret

        .data
message:
        .string "fib(5) = %d\n"
