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
		testl	%eax, %eax
	jne	.L2
	movl	$0, %eax
	jmp	.L4
.L2:
	movq	-8(%rbp), %rax
.L4:
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
	subq $64, %rsp
	movq $1, %rax
	movq %rax, %r13
	movq $2, %rax
	movq %rax, %r12
	movq $3, %rax
	movq %rax, %r11
	movq $4, %rax
	movq %rax, %r10
	movq $5, %rax
	movq %rax, %r9
	movq $6, %rax
	movq %rax, %r8
	movq $7, %rax
	movq %rax, %rdi
	movq $8, %rax
	movq %rax, %rsi
	movq $9, %rax
	movq %rax, %rcx
	movq $10, %rax
	movq %rax, %rbx
	movq $11, %rax
	movq $12, %r14
	movq %r14, -56(%rbp)
	movq $13, %r14
	movq %r14, -48(%rbp)
	movq $14, %r14
	movq %r14, -40(%rbp)
	movq $15, %r14
	movq %r14, -32(%rbp)
	movq $16, %r14
	movq %r14, -24(%rbp)
	movq $17, %r14
	movq %r14, -16(%rbp)
	movq $19, %r14
	movq %r14, -8(%rbp)
	movq $20, %r14
	movq %r14, -0(%rbp)
	movq %r13, %r15
	movq %r12, %r14
	addq %r14, %r15
	movq %r11, %r14
	addq %r14, %r15
	movq %r10, %r14
	addq %r14, %r15
	movq %r9, %r14
	addq %r14, %r15
	movq %r8, %r14
	addq %r14, %r15
	movq %r15, %r14
	movq %rdi, %r15
	addq %r15, %r14
	movq %rsi, %r15
	addq %r15, %r14
	movq %rcx, %r15
	addq %r15, %r14
	movq %rbx, %r15
	addq %r15, %r14
	movq %rax, %r15
	addq %r15, %r14
	movq %r14, %r15
	movq -56(%rbp), %r14
	addq %r14, %r15
	movq -48(%rbp), %r14
	addq %r14, %r15
	movq -40(%rbp), %r14
	addq %r14, %r15
	movq -32(%rbp), %r14
	addq %r14, %r15
	movq -24(%rbp), %r14
	addq %r14, %r15
	movq %r15, %r14
	movq -16(%rbp), %r15
	addq %r15, %r14
	movq -8(%rbp), %r15
	addq %r15, %r14
	movq -0(%rbp), %r15
	addq %r15, %r14
	pushq %rdi
	pushq %rsi
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r14
	call out_int
	addq $8, %rsp
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rsi
	popq %rdi
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
	movq -0(%rbp), %rbx
	addq %rbx, %rax
	pushq %rdi
	pushq %rsi
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rax
	call out_int
	addq $8, %rsp
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rsi
	popq %rdi
	movq %rbp, %rsp
	popq %rbp
	ret
