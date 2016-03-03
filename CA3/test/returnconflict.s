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
	subq $112, %rsp
	call in_int
	movq %rax, %rbx
	call in_int
	movq %rax, %r9
	call in_int
	movq %rax, %r8
	call in_int
	movq %rax, %r12
	call in_int
	movq %rax, %r10
	call in_int
	movq %rax, %r11
	call in_int
	movq %rax, %r14
	call in_int
	movq %rax, %r15
	call in_int
	movq %rax, -0(%rbp)
	call in_int
	movq %rax, %r13
	call in_int
	movq %rax, -48(%rbp)
	call in_int
	movq %rax, -40(%rbp)
	call in_int
	movq %rax, -32(%rbp)
	call in_int
	movq %rax, -8(%rbp)
	call in_int
	movq %rax, -24(%rbp)
	call in_int
	movq %rax, -16(%rbp)
	call in_int
	movq %rax, -64(%rbp)
	call in_int
	movq %rax, -72(%rbp)
	call in_int
	movq %rax, -80(%rbp)
	call in_int
	movq %rax, -56(%rbp)
	call in_int
	movq %rax, -104(%rbp)
	call in_int
	movq %rax, -96(%rbp)
	call in_int
	movq %rax, -88(%rbp)
	call in_int
	movq %rax, %rsi
	call in_int
	movq %rax, %rdi
	call in_int
	movq %r9, %rcx
	addq %rcx, %rbx
	movq %r8, %rcx
	addq %rcx, %rbx
	movq %r12, %rcx
	addq %rcx, %rbx
	movq %r10, %rcx
	addq %rcx, %rbx
	movq %r11, %rcx
	addq %rcx, %rbx
	movq %r14, %rcx
	addq %rcx, %rbx
	movq %r15, %rcx
	addq %rcx, %rbx
	movq -0(%rbp), %rcx
	addq %rcx, %rbx
	movq %r13, %rcx
	addq %rcx, %rbx
	movq -48(%rbp), %rcx
	addq %rcx, %rbx
	movq -40(%rbp), %rcx
	addq %rcx, %rbx
	movq -32(%rbp), %rcx
	addq %rcx, %rbx
	movq -8(%rbp), %rcx
	addq %rcx, %rbx
	movq -24(%rbp), %rcx
	addq %rcx, %rbx
	movq -16(%rbp), %rcx
	addq %rcx, %rbx
	movq -64(%rbp), %rcx
	addq %rcx, %rbx
	movq -72(%rbp), %rcx
	addq %rcx, %rbx
	movq -80(%rbp), %rcx
	addq %rcx, %rbx
	movq -56(%rbp), %rcx
	addq %rcx, %rbx
	movq -104(%rbp), %rcx
	addq %rcx, %rbx
	movq -96(%rbp), %rcx
	addq %rcx, %rbx
	movq -88(%rbp), %rcx
	addq %rcx, %rbx
	movq %rsi, %rcx
	addq %rcx, %rbx
	movq %rdi, %rcx
	addq %rcx, %rbx
	addq %rax, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
