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
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$1, %esi
	movl	$4096, %edi
	call	calloc
	movq	%rax, -8(%rbp)
	movq	stdin(%rip), %rdx
	movq	-8(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	fgets
	leaq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$1, %eax
	je	.L2
	movl	$0, %eax
	jmp	.L6
.L2:
	movq	-16(%rbp), %rax
	cmpq	$2147483647, %rax
	jg	.L4
	movq	-16(%rbp), %rax
	cmpq	$-2147483648, %rax
	jge	.L5
.L4:
	movl	$0, %eax
	jmp	.L6
.L5:
	movq	-16(%rbp), %rax
.L6:
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
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
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	16(%rbp), %rsi
	movl	$.LC00, %edi
	movl	$0, %eax		# Apparently sets the number of float args
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
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
	movq %rsp, %rbp
	subq $72, %rsp
	movq $1, %rax
	movq %rax, -0(%rbp)
	movq $2, %rax
	movq %rax, -8(%rbp)
	movq $3, %rax
	movq %rax, -16(%rbp)
	movq $4, %rax
	movq %rax, -24(%rbp)
	movq $5, %rax
	movq %rax, -32(%rbp)
	movq $6, %rax
	movq %rax, -40(%rbp)
	movq $7, %rax
	movq %rax, -48(%rbp)
	movq $8, %rax
	movq %rax, -56(%rbp)
	movq $9, %rax
	movq %rax, -64(%rbp)
	movq $10, %rax
	movq $11, %rbx
	movq $12, %rcx
	movq $13, %rsi
	movq $14, %rdi
	movq $15, %r8
	movq $16, %r9
	movq $17, %r10
	movq $18, %r11
	movq $19, %r12
	movq $20, %r13
	movq -0(%rbp), %r14
	movq -8(%rbp), %r15
	addq %r15, %r14
	movq %r14, %r15
	movq -16(%rbp), %r14
	addq %r14, %r15
	movq -24(%rbp), %r14
	addq %r14, %r15
	movq -32(%rbp), %r14
	addq %r14, %r15
	movq -40(%rbp), %r14
	addq %r14, %r15
	movq %r15, %r14
	movq -48(%rbp), %r15
	addq %r15, %r14
	movq %r14, %r15
	movq -56(%rbp), %r14
	addq %r14, %r15
	movq %r15, %r14
	movq -64(%rbp), %r15
	addq %r15, %r14
	movq %r14, %r15
	movq %rax, %r14
	addq %r14, %r15
	movq %r15, %r14
	movq %rbx, %r15
	addq %r15, %r14
	movq %r14, %r15
	movq %rcx, %r14
	addq %r14, %r15
	movq %rsi, %r14
	addq %r14, %r15
	movq %rdi, %r14
	addq %r14, %r15
	movq %r8, %r14
	addq %r14, %r15
	movq %r9, %r14
	addq %r14, %r15
	movq %r15, %r14
	movq %r10, %r15
	addq %r15, %r14
	movq %r14, %r15
	movq %r12, %r14
	addq %r14, %r15
	movq %r13, %r14
	addq %r14, %r15
	pushq %r15
	call out_int
	addq $8, %rsp
	pushq -0(%rbp)
	call out_int
	addq $8, %rsp
	pushq -8(%rbp)
	call out_int
	addq $8, %rsp
	pushq -16(%rbp)
	call out_int
	addq $8, %rsp
	pushq -24(%rbp)
	call out_int
	addq $8, %rsp
	pushq -32(%rbp)
	call out_int
	addq $8, %rsp
	pushq -40(%rbp)
	call out_int
	addq $8, %rsp
	pushq -48(%rbp)
	call out_int
	addq $8, %rsp
	pushq -56(%rbp)
	call out_int
	addq $8, %rsp
	pushq -64(%rbp)
	call out_int
	addq $8, %rsp
	pushq %rax
	call out_int
	addq $8, %rsp
	pushq %rbx
	call out_int
	addq $8, %rsp
	pushq %rcx
	call out_int
	addq $8, %rsp
	pushq %rsi
	call out_int
	addq $8, %rsp
	pushq %rdi
	call out_int
	addq $8, %rsp
	pushq %r8
	call out_int
	addq $8, %rsp
	pushq %r9
	call out_int
	addq $8, %rsp
	pushq %r10
	call out_int
	addq $8, %rsp
	pushq %r11
	call out_int
	addq $8, %rsp
	pushq %r12
	call out_int
	addq $8, %rsp
	pushq %r13
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
