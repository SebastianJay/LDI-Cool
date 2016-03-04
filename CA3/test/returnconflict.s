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
	movq %rax, -96(%rbp)
	call in_int
	movq %rax, -88(%rbp)
	call in_int
	movq %rax, -80(%rbp)
	call in_int
	movq %rax, -72(%rbp)
	call in_int
	movq %rax, -64(%rbp)
	call in_int
	movq %rax, -56(%rbp)
	call in_int
	movq %rax, -48(%rbp)
	call in_int
	movq %rax, -40(%rbp)
	call in_int
	movq %rax, -32(%rbp)
	call in_int
	movq %rax, -24(%rbp)
	call in_int
	movq %rax, -16(%rbp)
	call in_int
	movq %rax, -8(%rbp)
	call in_int
	movq %rax, -0(%rbp)
	call in_int
	movq %rax, %r15
	call in_int
	movq %rax, %r14
	call in_int
	movq %rax, %r13
	call in_int
	movq %rax, %r12
	call in_int
	movq %rax, %r11
	call in_int
	movq %rax, %r10
	call in_int
	movq %rax, %r9
	call in_int
	movq %rax, %r8
	call in_int
	movq %rax, %rdi
	call in_int
	movq %rax, %rsi
	call in_int
	movq %rax, %rcx
	call in_int
	movq %rax, %rbx
	call in_int
	movq -88(%rbp), %rdx
	addq %rdx, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -96(%rbp), %rdx
	movq %rdx, -88(%rbp)
	movq -80(%rbp), %rdx
	addq %rdx, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -88(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq -72(%rbp), %rdx
	addq %rdx, -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -48(%rbp), %rdx
	addq %rdx, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq -40(%rbp), %rdx
	addq %rdx, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -40(%rbp)
	movq -32(%rbp), %rdx
	addq %rdx, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq -24(%rbp), %rdx
	addq %rdx, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq -16(%rbp), %rdx
	addq %rdx, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq -8(%rbp), %rdx
	addq %rdx, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq -0(%rbp), %rdx
	addq %rdx, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -0(%rbp)
	addq %r15, -0(%rbp)
	shlq $32, -0(%rbp)
	sarq $32, -0(%rbp)
	movq -0(%rbp), %r15
	addq %r14, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r15, %r14
	addq %r13, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %r14, %r13
	addq %r12, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r13, %r12
	addq %r11, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r12, %r11
	addq %r10, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %r11, %r10
	addq %r9, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq %r10, %r9
	addq %r8, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r9, %r8
	addq %rdi, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %r8, %rdi
	addq %rsi, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rdi, %rsi
	addq %rcx, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rcx
	addq %rbx, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	addq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
