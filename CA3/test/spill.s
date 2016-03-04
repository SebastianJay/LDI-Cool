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
	subq $64, %rsp
	movq $1, %rax
	movq %rax, -48(%rbp)
	movq $2, %rax
	movq %rax, -40(%rbp)
	movq $3, %rax
	movq %rax, -32(%rbp)
	movq $4, %rax
	movq %rax, -24(%rbp)
	movq $5, %rax
	movq %rax, -16(%rbp)
	movq $6, %rax
	movq %rax, -8(%rbp)
	movq $7, %rax
	movq %rax, -0(%rbp)
	movq $8, %rax
	movq %rax, %r15
	movq $9, %rax
	movq %rax, %r14
	movq $10, %rax
	movq %rax, %r13
	movq $11, %rax
	movq %rax, %r12
	movq $12, %rax
	movq %rax, %r11
	movq $13, %rax
	movq %rax, %r10
	movq $14, %rax
	movq %rax, %r9
	movq $15, %rax
	movq %rax, %r8
	movq $16, %rax
	movq %rax, %rdi
	movq $17, %rax
	movq %rax, %rsi
	movq $19, %rax
	movq %rax, %rcx
	movq $20, %rax
	movq %rax, %rbx
	movq -48(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -40(%rbp), %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rax
	movq -32(%rbp), %rdx
	movq %rdx, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq -24(%rbp), %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -16(%rbp), %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rax
	movq -8(%rbp), %rdx
	movq %rdx, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r15, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq %r13, %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rax
	movq %r12, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r11, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq %r10, %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rax
	movq %r9, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq %r8, %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq %rdi, %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq %rsi, %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rax
	movq %rcx, -56(%rbp)
	addq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq %rbx, %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	pushq -56(%rbp)
	call out_int
	addq $8, %rsp
	movq -48(%rbp), %rax
	addq -40(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	addq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	addq -24(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	addq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	addq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	addq -0(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq %rbx, %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	pushq %rcx
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
