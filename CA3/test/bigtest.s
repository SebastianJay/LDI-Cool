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
	subq $152, %rsp
	call in_int
	movq %rax, %r13
	call in_int
	movq %rax, %rbx
	call in_int
	movq %rax, %rdi
	call in_int
	movq %rax, -8(%rbp)
	call in_int
	movq %rax, %r8
	call in_int
	movq %rax, -0(%rbp)
	call in_int
	movq %rax, -80(%rbp)
	call in_int
	movq %rax, -96(%rbp)
	call in_int
	movq %rax, -16(%rbp)
	call in_int
	movq %rax, %r14
	call in_int
	movq %rax, %r15
	call in_int
	movq %rax, -48(%rbp)
	call in_int
	movq %rax, %r9
	call in_int
	movq %rax, %rsi
	call in_int
	movq %rax, -64(%rbp)
	call in_int
	movq %rax, -104(%rbp)
	call in_int
	movq %rax, %r11
	call in_int
	movq %rax, %r10
	call in_int
	movq %rax, -40(%rbp)
	call in_int
	movq %rax, -56(%rbp)
	call in_int
	movq %rax, %rcx
	call in_int
	movq %rax, -24(%rbp)
	call in_int
	movq %rax, %r12
	call in_int
	movq %rax, -32(%rbp)
	call in_int
	call in_int
	movq %rax, -88(%rbp)
	movq -56(%rbp), %rax
	movq %rbx, -72(%rbp)
	imulq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq %rdx, -72(%rbp)
	imulq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, -72(%rbp)
	imulq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -72(%rbp)
	movq -16(%rbp), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	imulq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -48(%rbp)
	addq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq -64(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -72(%rbp)
	cltq
	cqto
	idivq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -72(%rbp)
	cltq
	cqto
	idivq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, -72(%rbp)
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq %r15, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -72(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -72(%rbp)
	addq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -72(%rbp)
	negq -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -80(%rbp), %rax
	imulq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rcx, -72(%rbp)
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -0(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq $12, -112(%rbp)
	movq -24(%rbp), %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -16(%rbp), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -32(%rbp), %rax
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -72(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq -48(%rbp), %rax
	movq %r12, -48(%rbp)
	addq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	movq %rdi, %rax
	subq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq -16(%rbp), %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq %rcx, %rax
	imulq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -72(%rbp)
	movq -48(%rbp), %rax
	movq -72(%rbp), %rdx
	movq %rdx, -48(%rbp)
	addq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rcx, -72(%rbp)
	negq -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq %rax, -48(%rbp)
	movq -72(%rbp), %rax
	addq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq $12, -72(%rbp)
	movq -64(%rbp), %rax
	movq -72(%rbp), %rdx
	movq %rdx, -64(%rbp)
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r11, -64(%rbp)
	negq -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -48(%rbp), %rax
	movq -64(%rbp), %rdx
	movq %rdx, -48(%rbp)
	addq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	movq -8(%rbp), %rax
	addq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq $12, -64(%rbp)
	movq -104(%rbp), %rax
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -48(%rbp), %rax
	movq -64(%rbp), %rdx
	movq %rdx, -48(%rbp)
	addq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -48(%rbp)
	subq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	movq -80(%rbp), %rax
	subq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq $12, -64(%rbp)
	movq -96(%rbp), %rax
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -48(%rbp), %rax
	movq -64(%rbp), %rdx
	movq %rdx, -48(%rbp)
	subq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -48(%rbp)
	addq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq %r10, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -48(%rbp), %rax
	movq -64(%rbp), %rdx
	movq %rdx, -48(%rbp)
	subq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, -48(%rbp)
	addq -48(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	movq %rsi, %rax
	subq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	pushq -48(%rbp)
	call out_int
	addq $8, %rsp
	movq -56(%rbp), %rdx
	movq %rdx, -72(%rbp)
	pushq -72(%rbp)
	call out_int
	addq $8, %rsp
	movq -72(%rbp), %rax
	movq %rsi, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -56(%rbp)
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -32(%rbp), %rax
	movq %r12, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -16(%rbp), %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq %r12, %rax
	subq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq %r15, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r8, -64(%rbp)
	negq -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	negq -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -64(%rbp)
	negq -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %rbx, %rax
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -64(%rbp)
	addq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %r14, %rax
	imulq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq -72(%rbp), %rax
	subq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, -8(%rbp)
	negq -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	addq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq -96(%rbp), %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -104(%rbp), %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -16(%rbp), %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq %r15, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -8(%rbp), %rax
	movq -104(%rbp), %rdx
	movq %rdx, -8(%rbp)
	subq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	negq -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq %r8, %rax
	imulq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -64(%rbp)
	movq %r15, %rax
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	negq -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -56(%rbp), %rax
	subq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq %r12, %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq %r12, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -32(%rbp), %rax
	movq %r14, -56(%rbp)
	subq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -104(%rbp), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq %rsi, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq -8(%rbp), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -8(%rbp)
	subq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq %r8, %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -40(%rbp)
	movq -32(%rbp), %rax
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq -0(%rbp), %rax
	movq %rdi, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq -96(%rbp), %rax
	subq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -56(%rbp)
	subq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq -32(%rbp), %rax
	subq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -40(%rbp), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -40(%rbp)
	movq %r11, %rax
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq -8(%rbp), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -8(%rbp)
	subq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq %rax, -8(%rbp)
	movq -40(%rbp), %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq %r15, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -64(%rbp)
	pushq -64(%rbp)
	call out_int
	addq $8, %rsp
	movq %rcx, -8(%rbp)
	pushq -8(%rbp)
	call out_int
	addq $8, %rsp
	movq -24(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq %rdi, %rax
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	pushq %rdi
	call out_int
	addq $8, %rsp
	movq %r10, %rcx
	movq -88(%rbp), %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rax
	movq -32(%rbp), %rcx
	addq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	pushq %rcx
	call out_int
	addq $8, %rsp
	movq -88(%rbp), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq %r13, %rax
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq -104(%rbp), %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq %rdi, %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	pushq -40(%rbp)
	call out_int
	addq $8, %rsp
	movq -8(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	pushq -88(%rbp)
	call out_int
	addq $8, %rsp
	movq %r14, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	pushq -56(%rbp)
	call out_int
	addq $8, %rsp
	movq -56(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq $12, -104(%rbp)
	movq -56(%rbp), %rax
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq $12, -104(%rbp)
	movq %r10, %rax
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	pushq -80(%rbp)
	call out_int
	addq $8, %rsp
	movq -88(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -104(%rbp)
	addq -104(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq %rbx, %rax
	addq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq -40(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %r15, %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -8(%rbp), %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r11, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %r8, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %rbx, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, -120(%rbp)
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %r8, %rax
	movq %rsi, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -72(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -64(%rbp), %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -96(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq %r15, %rax
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq %rcx, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq -24(%rbp), %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq %rsi, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r8, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -112(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -64(%rbp), %rax
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -8(%rbp), %rax
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq -72(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -72(%rbp)
	negq -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	imulq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -72(%rbp)
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq $12, -104(%rbp)
	movq -56(%rbp), %rax
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r15, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -88(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq $12, -88(%rbp)
	movq -80(%rbp), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -80(%rbp)
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq %r14, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq -72(%rbp), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -72(%rbp)
	addq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	pushq -88(%rbp)
	call out_int
	addq $8, %rsp
	movq -32(%rbp), %rdx
	movq %rdx, -80(%rbp)
	pushq -80(%rbp)
	call out_int
	addq $8, %rsp
	movq -56(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	pushq -32(%rbp)
	call out_int
	addq $8, %rsp
	movq %r14, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -72(%rbp)
	movq -64(%rbp), %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -104(%rbp)
	pushq -104(%rbp)
	call out_int
	addq $8, %rsp
	movq %rdi, -72(%rbp)
	pushq -72(%rbp)
	call out_int
	addq $8, %rsp
	movq -104(%rbp), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -80(%rbp), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -24(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq %r13, %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq %r11, %rax
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq %rdx, -32(%rbp)
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq %r10, %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -72(%rbp), %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq %r14, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -32(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -32(%rbp)
	addq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %rax, -32(%rbp)
	movq -120(%rbp), %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $12, -120(%rbp)
	movq -24(%rbp), %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -40(%rbp), %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $12, -120(%rbp)
	movq -56(%rbp), %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -16(%rbp), %rax
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $12, -120(%rbp)
	movq %r14, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq $12, -128(%rbp)
	movq -104(%rbp), %rax
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -56(%rbp), %rax
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq %rdi, %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -56(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -80(%rbp), %rax
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -32(%rbp), %rax
	movq %rcx, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq -112(%rbp), %rax
	addq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %rsi, %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -40(%rbp), %rax
	movq %r12, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $12, -112(%rbp)
	movq %rcx, %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq $12, -120(%rbp)
	movq %rbx, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -0(%rbp), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -24(%rbp), %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	movq %r13, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $12, -112(%rbp)
	movq -24(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -24(%rbp)
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -24(%rbp)
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -24(%rbp)
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq %rdx, -24(%rbp)
	subq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	pushq -24(%rbp)
	call out_int
	addq $8, %rsp
	movq %rdi, -24(%rbp)
	movq -64(%rbp), %rax
	addq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq %rbx, %rax
	addq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq %rdi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %r15, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -0(%rbp), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -72(%rbp), %rax
	movq %r8, -120(%rbp)
	subq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq %rax, -120(%rbp)
	movq -128(%rbp), %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq $12, -128(%rbp)
	movq %r11, %rax
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -48(%rbp), %rax
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -112(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -80(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq %rdi, %rax
	movq -120(%rbp), %rdi
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdi
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $12, -112(%rbp)
	movq %rbx, %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %rdi, %rax
	movq -112(%rbp), %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdi
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq -0(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %rsi, %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -32(%rbp), %rax
	movq %r8, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %rdi, %rax
	movq -32(%rbp), %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, %rdi
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq -56(%rbp), %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rdi, %rax
	movq -40(%rbp), %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rdi
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdi
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %r8, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, -24(%rbp)
	imulq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	movq %rdi, %rax
	movq -24(%rbp), %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rdi
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, %rdi
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq -80(%rbp), %rdx
	movq %rdx, -24(%rbp)
	negq -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq %rsi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq %rdx, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	subq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %r8, %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $12, -112(%rbp)
	movq -48(%rbp), %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -32(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -32(%rbp)
	subq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r9, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %rax, -32(%rbp)
	movq -112(%rbp), %rax
	subq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -0(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %r10, %rax
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -32(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -32(%rbp)
	addq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -32(%rbp)
	cltq
	cqto
	idivq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r8, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq -24(%rbp), %rax
	movq -32(%rbp), %rdx
	movq %rdx, -24(%rbp)
	addq -24(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rdi, -32(%rbp)
	pushq -32(%rbp)
	call out_int
	addq $8, %rsp
	movq $12, %rdi
	movq %rbx, %rax
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	pushq -24(%rbp)
	call out_int
	addq $8, %rsp
	movq -96(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	pushq %rdi
	call out_int
	addq $8, %rsp
	movq -24(%rbp), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r9, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %rsi, %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -32(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r15, -120(%rbp)
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq $12, -128(%rbp)
	movq %rcx, %rax
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	negq %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -8(%rbp), %rax
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -120(%rbp), %rax
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r15
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -112(%rbp), %rax
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -96(%rbp), %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -72(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -96(%rbp), %rax
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r15, %rax
	movq %rdi, %r15
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -0(%rbp), %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -8(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r10, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -96(%rbp), %rax
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $12, -112(%rbp)
	movq %rbx, %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %rdi, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r10, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq -32(%rbp), %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -112(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -8(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r13, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -96(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq %rdx, -96(%rbp)
	subq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -96(%rbp), %rax
	movq -72(%rbp), %rdx
	movq %rdx, -96(%rbp)
	addq -96(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -40(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -104(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -40(%rbp), %rax
	movq %r10, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r11, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	pushq %r15
	call out_int
	addq $8, %rsp
	movq -0(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq %rcx, %rax
	subq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq %r9, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %rcx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -0(%rbp), %rax
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq %r13, %rax
	subq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -104(%rbp), %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %r15, %rax
	movq %r8, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -120(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -120(%rbp)
	addq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -32(%rbp), %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %r12, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq $12, -128(%rbp)
	movq -88(%rbp), %rax
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %r11, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -120(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -120(%rbp)
	subq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r15, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq %rax, -120(%rbp)
	movq -128(%rbp), %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq $12, -128(%rbp)
	movq %r8, %rax
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -120(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -120(%rbp)
	addq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	subq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq %r13, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -88(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %r13, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -120(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -120(%rbp)
	subq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -8(%rbp), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -8(%rbp), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -56(%rbp), %rax
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -48(%rbp), %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %rbx, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq %r11, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -112(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -0(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -112(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -72(%rbp), %rax
	movq -32(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -96(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -96(%rbp)
	addq -96(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	pushq -96(%rbp)
	call out_int
	addq $8, %rsp
	movq -64(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -32(%rbp), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	movq %r12, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	negq -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	subq -88(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq -32(%rbp), %rax
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq %r15, %rax
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq %r13, %rax
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	imulq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -8(%rbp), %rax
	movq %r12, -8(%rbp)
	subq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq -40(%rbp), %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -88(%rbp)
	movq -32(%rbp), %rax
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq -24(%rbp), %rax
	movq %rcx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r15, -96(%rbp)
	addq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq $12, -112(%rbp)
	movq %r15, %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %r11, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -88(%rbp), %rax
	movq -96(%rbp), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq %r12, %rax
	addq -88(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq -104(%rbp), %rax
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq %r14, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	movq -104(%rbp), %rax
	addq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -96(%rbp), %rax
	movq %rdi, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -96(%rbp)
	negq -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq $12, -96(%rbp)
	movq -32(%rbp), %rax
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r9, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	movq -88(%rbp), %rax
	movq -96(%rbp), %rdx
	movq %rdx, -88(%rbp)
	addq -88(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -88(%rbp)
	movq -48(%rbp), %rax
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -96(%rbp)
	negq -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -32(%rbp), %rax
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -96(%rbp)
	addq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -32(%rbp), %rax
	movq %r10, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %rcx, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -112(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	negq -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -88(%rbp), %rax
	movq -96(%rbp), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	pushq -8(%rbp)
	call out_int
	addq $8, %rsp
	movq %r12, %rax
	movq %r13, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq -72(%rbp), %rax
	addq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -0(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	movq -104(%rbp), %rax
	subq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -8(%rbp), %rax
	movq %r8, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq $12, -112(%rbp)
	movq %r8, %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %r10, %rax
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -8(%rbp), %rax
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -96(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -96(%rbp)
	addq -96(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	movq -16(%rbp), %rax
	subq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq $12, -112(%rbp)
	movq %r12, %rax
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -96(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -96(%rbp)
	subq -96(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rcx, -96(%rbp)
	negq -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	addq -96(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -96(%rbp)
	negq -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq %rax, %r14
	movq -96(%rbp), %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -96(%rbp)
	movq %r8, %rax
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -96(%rbp)
	movq %r12, %rax
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq -0(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	negq -0(%rbp)
	shlq $32, -0(%rbp)
	sarq $32, -0(%rbp)
	movq $12, -96(%rbp)
	movq -16(%rbp), %rax
	movq -96(%rbp), %rdx
	movq %rdx, -16(%rbp)
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -16(%rbp)
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -16(%rbp)
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -0(%rbp)
	shlq $32, -0(%rbp)
	sarq $32, -0(%rbp)
	movq -56(%rbp), %rax
	imulq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	movq %rsi, %rax
	imulq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -0(%rbp)
	movq %r13, %rax
	cltq
	cqto
	idivq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	movq -8(%rbp), %rax
	movq %r8, -16(%rbp)
	imulq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq $12, -96(%rbp)
	movq -80(%rbp), %rax
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq %r9, %rax
	movq %r10, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r9
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %r9
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -16(%rbp)
	movq %r15, %rax
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -0(%rbp), %rax
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, %r9
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, %r14
	movq -24(%rbp), %rax
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -40(%rbp), %rax
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -88(%rbp), %rax
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r12, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r12, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rcx, %r14
	imulq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	imulq %r14
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r9, %rax
	movq -48(%rbp), %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	pushq -88(%rbp)
	call out_int
	addq $8, %rsp
	movq -32(%rbp), %rax
	movq %r10, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	pushq -96(%rbp)
	call out_int
	addq $8, %rsp
	movq -64(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -48(%rbp), %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %rbx, %r12
	movq -8(%rbp), %rax
	subq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $12, %r14
	movq -8(%rbp), %rax
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	addq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %r14
	addq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %r12, %rax
	movq %r14, %r12
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r9, %rax
	movq %rcx, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	pushq -8(%rbp)
	call out_int
	addq $8, %rsp
	movq %rbx, %rax
	movq -24(%rbp), %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	pushq -16(%rbp)
	call out_int
	addq $8, %rsp
	movq -72(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -104(%rbp), %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %rsi, %rax
	movq -16(%rbp), %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -104(%rbp), %rax
	movq -40(%rbp), %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq %r9, %rax
	movq %r12, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	pushq %r12
	call out_int
	addq $8, %rsp
	movq %r13, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	pushq %r9
	call out_int
	addq $8, %rsp
	movq $12, %r14
	movq %rcx, %rax
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r14
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r14
	pushq %r14
	call out_int
	addq $8, %rsp
	movq %rdi, -16(%rbp)
	pushq -16(%rbp)
	call out_int
	addq $8, %rsp
	movq %rsi, -40(%rbp)
	pushq -40(%rbp)
	call out_int
	addq $8, %rsp
	movq $12, -0(%rbp)
	movq -56(%rbp), %rax
	cltq
	cqto
	idivq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	pushq -88(%rbp)
	call out_int
	addq $8, %rsp
	movq %rdi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -0(%rbp)
	cltq
	cqto
	idivq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	pushq -48(%rbp)
	call out_int
	addq $8, %rsp
	movq -64(%rbp), %rax
	movq %r8, -0(%rbp)
	subq -0(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, -0(%rbp)
	negq -0(%rbp)
	shlq $32, -0(%rbp)
	sarq $32, -0(%rbp)
	addq -0(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	movq -8(%rbp), %rax
	subq %rax, -0(%rbp)
	shlq $32, -0(%rbp)
	sarq $32, -0(%rbp)
	movq -96(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, -16(%rbp)
	imulq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq -24(%rbp), %rax
	movq %r10, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq %r11, %rax
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -16(%rbp), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -16(%rbp)
	imulq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -16(%rbp)
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -0(%rbp)
	shlq $32, -0(%rbp)
	sarq $32, -0(%rbp)
	movq $12, -16(%rbp)
	movq %r14, %rax
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, -16(%rbp)
	imulq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -16(%rbp)
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq -0(%rbp), %rax
	movq -16(%rbp), %rdx
	movq %rdx, -0(%rbp)
	addq -0(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -0(%rbp)
	subq -0(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, -0(%rbp)
	subq -0(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	movq -72(%rbp), %rax
	addq %rax, -0(%rbp)
	shlq $32, -0(%rbp)
	sarq $32, -0(%rbp)
	movq -88(%rbp), %rax
	imulq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	pushq -40(%rbp)
	call out_int
	addq $8, %rsp
	movq -56(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -0(%rbp)
	imulq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -0(%rbp)
	cltq
	cqto
	idivq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	movq -96(%rbp), %rax
	subq -0(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	pushq -16(%rbp)
	call out_int
	addq $8, %rsp
	movq -48(%rbp), %rdx
	movq %rdx, -0(%rbp)
	pushq -0(%rbp)
	call out_int
	addq $8, %rsp
	movq -80(%rbp), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %r10, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq -120(%rbp), %rdx
	addq %rdx, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	addq %rdx, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %rbx, -120(%rbp)
	movq -120(%rbp), %rdx
	subq %rdx, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %rsi, -120(%rbp)
	movq -120(%rbp), %rdx
	subq %rdx, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %rax, -112(%rbp)
	movq -120(%rbp), %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -80(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq %rcx, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -112(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -32(%rbp), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -24(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq %r13, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq %r12, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq %rcx, %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %r12, %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rax
	movq %r11, -120(%rbp)
	subq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -40(%rbp), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -64(%rbp), %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -0(%rbp), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -120(%rbp)
	movq -8(%rbp), %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -120(%rbp)
	addq %r11, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %r11
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %r12, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq -0(%rbp), %rax
	movq %r13, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %rsi, %rax
	subq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	pushq %r11
	call out_int
	addq $8, %rsp
	movq %rdi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %r13, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %r8, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %r15, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq %rdi, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -88(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq -8(%rbp), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -56(%rbp), %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -8(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -8(%rbp), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -88(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	movq %rbx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -64(%rbp), %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -40(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq -80(%rbp), %rax
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq -0(%rbp), %rax
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq -136(%rbp), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -136(%rbp)
	addq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -72(%rbp), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq %r10, %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq %rdi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -136(%rbp)
	addq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq %rcx, %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -48(%rbp), %rax
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq %r15, %rax
	movq -136(%rbp), %r15
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %r15
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	negq %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -40(%rbp), %rax
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r15
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r15
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq -128(%rbp), %rax
	subq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq -80(%rbp), %rax
	subq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq -8(%rbp), %rax
	movq %rbx, %r15
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq %r11, %rax
	movq %r15, %r11
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r11
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %r11
	subq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %r11, %rax
	movq -8(%rbp), %r11
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq -40(%rbp), %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $12, %r15
	movq %r14, %rax
	movq %r15, %r14
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r14
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r14
	movq %r11, %rax
	movq %r14, %r11
	subq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %r11
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %r11
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %rbx, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %r14, %rbx
	addq %r11, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rax, %r11
	movq %rbx, %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %rsi, %rax
	movq %r11, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -112(%rbp), %rax
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -88(%rbp), %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq -0(%rbp), %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	pushq %r11
	call out_int
	addq $8, %rsp
	movq $12, %rbx
	movq -0(%rbp), %rax
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	pushq -104(%rbp)
	call out_int
	addq $8, %rsp
	movq %rcx, %rax
	movq %r13, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	pushq -0(%rbp)
	call out_int
	addq $8, %rsp
	movq -16(%rbp), %rdx
	movq %rdx, -0(%rbp)
	pushq -0(%rbp)
	call out_int
	addq $8, %rsp
	movq $12, %rbx
	movq -64(%rbp), %rax
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq %r11, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r11
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq %r12, %r11
	movq -80(%rbp), %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %r11, -96(%rbp)
	pushq -96(%rbp)
	call out_int
	addq $8, %rsp
	movq $12, %r11
	movq %rcx, %rax
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq %r9, %rax
	subq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	pushq %r15
	call out_int
	addq $8, %rsp
	movq -0(%rbp), %r11
	pushq %r11
	call out_int
	addq $8, %rsp
	movq %rsi, %r14
	pushq %r14
	call out_int
	addq $8, %rsp
	movq -80(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r13, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r10, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -88(%rbp), %rax
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -56(%rbp), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -56(%rbp), %rax
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq -16(%rbp), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rax
	movq %r9, -120(%rbp)
	addq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq %rax, -120(%rbp)
	movq -128(%rbp), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq $12, -128(%rbp)
	movq -104(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -104(%rbp)
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq %rdx, -104(%rbp)
	addq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq %r9, %rax
	addq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq -40(%rbp), %rax
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq -120(%rbp), %rdx
	subq %rdx, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq -112(%rbp), %rax
	addq -104(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r9, -104(%rbp)
	addq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq %r12, %rax
	movq -104(%rbp), %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq %r11, %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $12, -104(%rbp)
	movq %r9, %rax
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq %r12, %rax
	movq -104(%rbp), %r12
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq -8(%rbp), %rax
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r12, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq %rax, %r12
	movq -104(%rbp), %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $12, -104(%rbp)
	movq -72(%rbp), %rax
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq %r12, %rax
	movq -104(%rbp), %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rbx, %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %r12
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r12, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq %rax, %r12
	movq -104(%rbp), %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %rbx, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rcx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	pushq %r12
	call out_int
	addq $8, %rsp
	movq %r15, %rax
	movq -32(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq %r13, %rax
	subq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq %r12, %rax
	subq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq %r9, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r15, -112(%rbp)
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %r13, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -48(%rbp), %rax
	movq %rcx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -120(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -88(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %rbx, %rax
	subq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq $12, -120(%rbp)
	movq %rcx, %rax
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -88(%rbp), %rax
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -64(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -64(%rbp)
	subq -64(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, -64(%rbp)
	negq -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %rax, %r13
	movq -64(%rbp), %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $12, -64(%rbp)
	movq %rdi, %rax
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $12, -64(%rbp)
	movq %r10, %rax
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq -72(%rbp), %rax
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $12, -64(%rbp)
	movq -16(%rbp), %rax
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $12, -64(%rbp)
	movq %rdi, %rax
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r13, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq %rsi, %rax
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	subq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r13
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %r13
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r13, %rax
	movq %r9, %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	movq -24(%rbp), %rdx
	movq %rdx, -64(%rbp)
	addq %r13, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %rax, %r13
	movq -64(%rbp), %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r11, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -8(%rbp), %rax
	subq -64(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -64(%rbp)
	subq -64(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %r9, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq %r13, %rax
	movq -64(%rbp), %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq %r9, %rax
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r14, %rax
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r13, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %r13
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $12, -64(%rbp)
	movq %r10, %rax
	movq -64(%rbp), %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, %r10
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $12, %r13
	movq %r15, %rax
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r13
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	pushq %r10
	call out_int
	addq $8, %rsp
	movq -0(%rbp), %rdx
	movq %rdx, -64(%rbp)
	pushq -64(%rbp)
	call out_int
	addq $8, %rsp
	movq %r11, %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	movq -96(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -80(%rbp)
	addq %rax, -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq -72(%rbp), %rax
	addq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq %r8, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rbx, %rax
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %r10, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %r9, %rax
	movq %r9, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -8(%rbp), %rax
	movq -0(%rbp), %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq %r8, %rax
	movq %r10, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq -24(%rbp), %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -48(%rbp), %rax
	movq -56(%rbp), %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq %r8, %rax
	movq %r10, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %r8
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -88(%rbp), %rax
	movq %r11, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -96(%rbp), %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -64(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq %r8, %rax
	movq %r10, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq -80(%rbp), %rax
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %r8
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $12, %r10
	movq %r11, %rax
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %rcx, %rax
	movq -0(%rbp), %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rdi, %rax
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %r8, %rsi
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $12, %r8
	movq %r9, %rax
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $12, %rdi
	movq %r14, %rax
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq -64(%rbp), %rax
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq -96(%rbp), %rax
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %r15, %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, %rsi
	subq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq -32(%rbp), %rax
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %r13, %rsi
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rbx, %rax
	subq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %r15, %rax
	movq %rcx, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, %rbx
	addq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %r15
	pushq %r15
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
