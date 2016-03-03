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
	movq $14, -0(%rbp)
	movq $15, -8(%rbp)
	movq $16, -16(%rbp)
	movq $17, -24(%rbp)
	movq $18, -32(%rbp)
	movq $19, -40(%rbp)
	movq $20, -48(%rbp)
	movq %rax, -56(%rbp)
	movq %rbx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %rcx, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %rsi, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %rdi, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %r8, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq %r9, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %r10, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq %r11, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %r12, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq %r13, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %r14, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %r15, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -0(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -64(%rbp), %rdx
	addq %rdx, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq -56(%rbp), %rdx
	addq %rdx, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
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
	pushq %r14
	call out_int
	addq $8, %rsp
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
	movq %rbp, %rsp
	popq %rbp
	ret
