.LC0:
	.string	"%ld"
	.text
.LC00:
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
	movl	$.LC00, %edi
	movl	$0, %eax		# Apparently sets the number of float args
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
	subq $56, %rsp
	movq $1, %rax
	movq %rax, %r13
	movq $2, %rax
	movq %rax, %r14
	movq $3, %rax
	movq %rax, %r12
	movq $4, %rax
	movq %rax, %r11
	movq $5, %rax
	movq %rax, %r10
	movq $6, %rax
	movq %rax, %r9
	movq $7, %rax
	movq %rax, %r8
	movq $8, %rax
	movq %rax, %rdi
	movq $9, %rax
	movq %rax, %rsi
	movq $10, %rax
	movq %rax, %rcx
	movq $11, %rax
	movq %rax, %rbx
	movq $12, %rax
	movq $13, %r15
	movq %r15, -56(%rbp)
	movq $14, %r15
	movq %r15, -48(%rbp)
	movq $15, %r15
	movq %r15, -40(%rbp)
	movq $16, %r15
	movq %r15, -32(%rbp)
	movq $17, %r15
	movq %r15, -24(%rbp)
	movq $19, %r15
	movq %r15, -16(%rbp)
	movq $20, %r15
	movq %r15, -8(%rbp)
	addq %r14, %r13
	addq %r12, %r13
	movq %r13, %r12
	addq %r11, %r12
	movq %r12, %r11
	addq %r10, %r11
	movq %r11, %r10
	addq %r9, %r10
	movq %r10, %r9
	addq %r8, %r9
	movq %r9, %r8
	addq %rdi, %r8
	movq %r8, %rdi
	addq %rsi, %rdi
	movq %rdi, %rsi
	addq %rcx, %rsi
	movq %rsi, %rcx
	addq %rbx, %rcx
	movq %rcx, %rbx
	addq %rax, %rbx
	movq %rbx, %rax
	movq -56(%rbp), %rbx
	addq %rbx, %rax
	movq -48(%rbp), %rbx
	addq %rbx, %rax
	movq -40(%rbp), %rbx
	addq %rbx, %rax
	movq -32(%rbp), %rbx
	addq %rbx, %rax
	movq -24(%rbp), %rbx
	addq %rbx, %rax
	movq -16(%rbp), %rbx
	addq %rbx, %rax
	movq -8(%rbp), %rbx
	addq %rbx, %rax
	pushq %rdi
	pushq %rsi
	pushq %rax
	call out_int
	addq $8, %rsp
	popq %rsi
	popq %rdi
	movq %rbp, %rsp
	popq %rbp
	ret
