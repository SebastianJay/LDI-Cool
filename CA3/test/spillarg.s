.LC0:
	.string	"%d"
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
	leaq	-8(%rbp), %rax	
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	scanf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	testl	%eax, %eax
	jne	.L2
	movl	$0, %eax
	jmp	.L4
.L2:
	movq	-8(%rbp), %rax
.L4:
	movq $0, %rdx
	cmpq $2147483647, %rax
	cmovgq %rdx, %rax
	cmpq  $-2147483648, %rax
	cmovlq %rdx, %rax

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
	movq $2, %rbx
	movq $3, %rcx
	movq $4, %rsi
	movq $5, %rdi
	movq $6, %r8
	movq $7, %r9
	movq $8, %r10
	movq $9, %r11
	movq $10, %r12
	movq $11, %r13
	movq $12, %r14
	movq $13, %r15
	movq $14, -8(%rbp)
	movq $15, -16(%rbp)
	movq $16, -24(%rbp)
	movq $17, -32(%rbp)
	movq $18, -40(%rbp)
	movq $19, -48(%rbp)
	movq $20, -56(%rbp)
	movq %rax, -64(%rbp)
	movq %rbx, -72(%rbp)
	movq -72(%rbp), %rdx
	addq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq %rcx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq %rsi, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq %rdi, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq %r8, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %r9, -72(%rbp)
	movq -72(%rbp), %rdx
	addq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq %r10, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %r11, -72(%rbp)
	movq -72(%rbp), %rdx
	addq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq %r12, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %r13, -72(%rbp)
	movq -72(%rbp), %rdx
	addq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq %r14, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq %r15, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq -72(%rbp), %rdx
	addq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	pushq -72(%rbp)
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
	pushq %r14
	call out_int
	addq $8, %rsp
	pushq %r15
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
	movq %rbp, %rsp
	popq %rbp
	ret
