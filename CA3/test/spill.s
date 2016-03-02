.LC0:
	.string	"%d"
	.text
	.globl	in_int
	.type	in_int, @function
in_int:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	scanf
	movq	-8(%rbp), %rax
	leave
	ret
.LFE2:
	.size	in_int, .-in_int
	.globl	out_int
	.type	out_int, @function
out_int:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	pushq	%rax
	movq	16(%rbp), %rsi
	movl	$.LC0, %edi
	##movl	$0, %eax		#not sure if necessary
	call	printf
	popq	%rax
	leave
	ret
.LFE3:
	.size	out_int, .-out_int
	.globl	in_string
	.type	in_string, @function
in_string:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$1, %esi
	movl	$4096, %edi
	call	calloc
	movq	%rax, -8(%rbp)
	movq	stdin(%rip), %rdx
	movq	-8(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	fgets
	movq	-8(%rbp), %rax
	leave
	ret
.LFE4:
	.size	in_string, .-in_string
	.section	.rodata
.LC1:
	.string	"%s"
	.text
	.globl	out_string
	.type	out_string, @function
out_string:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	pushq	%rax
	movq	16(%rbp), %rsi
	movl	$.LC1, %edi
	##movl	$0, %eax		#not sure if necessary
	call	printf
	popq	%rax
	leave
	ret
.LFE5:
	.size	out_string, .-out_string
	.globl main
	.type main, @function
main:
	pushq %rbp
	movq %rsp, %rdx
	movq %rdx, %rbp
	movq $48, %rdx
	subq %rdx, %rsp
	movq $1, %rax
	movq %rax, 32(%rsp)
	movq $2, %rax
	movq %rax, 40(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq $4, %rax
	movq %rax, 16(%rsp)
	movq $5, %rax
	movq %rax, 8(%rsp)
	movq $6, %rax
	movq %rax, 0(%rsp)
	movq $7, %rax
	movq %rax, %r15
	movq $8, %rax
	movq %rax, %r14
	movq $9, %rax
	movq %rax, %r13
	movq $10, %rax
	movq %rax, %r12
	movq $11, %rax
	movq %rax, %r11
	movq $12, %rax
	movq %rax, %r10
	movq $13, %rax
	movq %rax, %r9
	movq $14, %rax
	movq %rax, %r8
	movq $15, %rax
	movq %rax, %rdi
	movq $16, %rax
	movq %rax, %rsi
	movq $17, %rax
	movq %rax, %rcx
	movq $19, %rax
	movq %rax, %rbx
	movq $20, %rax
	movq 32(%rsp), %rdx
	addq %rdx, 40(%rsp)
	movq 40(%rsp), %rdx
	movq %rdx, 32(%rsp)
	movq 32(%rsp), %rdx
	addq %rdx, 24(%rsp)
	movq 24(%rsp), %rdx
	addq %rdx, 16(%rsp)
	movq 16(%rsp), %rdx
	addq %rdx, 8(%rsp)
	movq 8(%rsp), %rdx
	addq %rdx, 0(%rsp)
	addq 0(%rsp), %r15
	addq %r15, %r14
	addq %r14, %r13
	addq %r13, %r12
	addq %r12, %r11
	addq %r11, %r10
	addq %r10, %r9
	addq %r9, %r8
	addq %r8, %rdi
	addq %rdi, %rsi
	addq %rsi, %rcx
	addq %rcx, %rbx
	addq %rbx, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
