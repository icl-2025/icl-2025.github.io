	.text
	.globl	main
main:
        subq    $8, %rsp        # alignment
	movq	$format, %rdi
        movq    $42, %rsi
        xorq    %rax, %rax
	call	printf
        xorq    %rax, %rax
        addq    $8, %rsp
	ret

        .data
format:
	.string	"n = %d\n"
