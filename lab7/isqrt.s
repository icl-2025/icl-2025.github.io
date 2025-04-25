	.text
	.globl	main

## int isqrt(int n) {
##   int c = 0, s = 1;
##   while (s <= n) {
##     c++;
##     s += 2*c + 1;
##   }
##   return c;
## }

isqrt:
        xorq    %rax, %rax      # c in %rax (because return c at the end)
        movq    $1, %rcx
        jmp     T1
L1:     incq    %rax
        leaq    1(%rcx, %rax, 2), %rcx
T1:     cmpq    %rdi, %rcx      # s <= n ?
        jle     L1
        ret

## int main() {
##   int n;
##   for (n = 0; n <= 20; n++)
##     printf("sqrt(%2d) = %2d\n", n, isqrt(n));
##   return 0;
## }

main:
        pushq   %rbx            # save %rbx and stack alignment
        movq    $0, %rbx        # n dans %rbx (callee-save)
L2:     movq    %rbx, %rdi
        call    isqrt
        movq	$format, %rdi
        movq    %rbx, %rsi
        movq    %rax, %rdx
        xorq    %rax, %rax
	call	printf
        incq    %rbx
        cmpq    $20, %rbx
        jle     L2
        xorq    %rax, %rax
        popq    %rbx
	ret

        .data
format:
	.string	"sqrt(%2d) = %2d\n"
