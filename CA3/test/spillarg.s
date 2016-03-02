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
	movq $2, %rbx
	movq $3, %rcx
	movq %rcx, -48(%rbp)
	movq $4, %rcx
	movq %rcx, -40(%rbp)
	movq $5, %rcx
	movq %rcx, -32(%rbp)
	movq $6, %rcx
	movq %rcx, -24(%rbp)
	movq $7, %rcx
	movq %rcx, -16(%rbp)
	movq $8, %rcx
	movq %rcx, -8(%rbp)
	movq $9, %rcx
	movq %rcx, %r15
	movq $10, %rcx
	movq %rcx, %r14
	movq $11, %rcx
	movq %rcx, %r13
	movq $12, %rcx
	movq %rcx, %r12
	movq $13, %rcx
	movq %rcx, %r11
	movq $14, %rcx
	movq %rcx, %r10
	movq $15, %rcx
	movq %rcx, %r9
	movq $16, %rcx
	movq %rcx, %r8
	movq $17, %rcx
	movq %rcx, %rdi
	movq $19, %rcx
	movq $20, %rsi
	movq %rax, -56(%rbp)
	movq %rbx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -56(%rbp)
	movq -48(%rbp), %rdx
	addq %rdx, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq -40(%rbp), %rdx
	addq %rdx, -48(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -40(%rbp)
	movq -32(%rbp), %rdx
	addq %rdx, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq -24(%rbp), %rdx
	addq %rdx, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq -16(%rbp), %rdx
	addq %rdx, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq -8(%rbp), %rdx
	addq %rdx, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	addq %r14, %r15
	movq %r15, %r14
	addq %r13, %r14
	movq %r14, %r13
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
	movq %rcx, %r8
	addq %r8, %rdi
	movq %rsi, %r8
	addq %r8, %rdi
	pushq %rdi
	pushq %rsi
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rdi
	call out_int
	addq $8, %rsp
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rsi
	popq %rdi
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
	pushq %rdi
	pushq %rsi
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rbx
	call out_int
	addq $8, %rsp
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rsi
	popq %rdi
	pushq %rdi
	pushq %rsi
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rcx
	call out_int
	addq $8, %rsp
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rsi
	popq %rdi
	pushq %rdi
	pushq %rsi
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rsi
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
