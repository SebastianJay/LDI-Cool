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
	movq $48887, %rax
	movq %rax, %rbx
	negq %rbx
	movq $7493, %rax
	addq %rax, %rbx
	movq $26972, %rcx
	movq $62150, %rax
	movq %rax, %rsi
	negq %rsi
	movq $30797, %rdi
	movq $3233, %r8
	movq $26083, %rax
	movq $56556, %r9
	cqto
	idivq %r9
	movq %rax, %r9
	movq $55273, %r10
	movq $38801, %rax
	negq %rax
	movq $17979, %r11
	imulq %r11
	movq $14356, %r11
	subq %r11, %rax
	movq $61208, %r11
	negq %r11
	subq %r11, %rax
	movq $25185, %r12
	movq %rax, %r11
	movq %r12, %rax
	addq %rax, %r11
	movq $47041, %rax
	negq %rax
	movq $65097, %r12
	imulq %r12
	addq %rax, %r11
	movq $5880, %rax
	movq $12843, %r12
	cqto
	idivq %r12
	movq $38600, %r12
	cqto
	idivq %r12
	movq $25834, %r12
	imulq %r12
	subq %rax, %r11
	movq $47353, %rax
	negq %rax
	movq $2951, %r12
	cqto
	idivq %r12
	movq %rax, %r12
	movq $63252, %rax
	subq %rax, %r12
	movq $35037, %r13
	movq $56918, %rax
	movq $55662, %r14
	cqto
	idivq %r14
	movq %rax, %r14
	movq %r13, %rax
	movq %r14, %r13
	cqto
	idivq %r13
	addq %rax, %r12
	movq $15079, %rax
	negq %rax
	movq $64582, %r13
	cqto
	idivq %r13
	movq $7741, %r13
	cqto
	idivq %r13
	movq %rax, %r13
	movq %r12, %rax
	movq %r13, %r12
	addq %r12, %rax
	addq %rax, %r11
	movq $18422, %rax
	subq %rax, %r11
	movq %r11, %rax
	negq %rax
	subq %rax, %r10
	movq %r9, %rax
	movq %r10, %r9
	imulq %r9
	subq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	imulq %rdi
	movq $2469, %rdi
	cqto
	idivq %rdi
	movq %rax, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	subq %rsi, %rax
	movq %rax, %rsi
	negq %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cqto
	idivq %rcx
	addq %rax, %rbx
	movq $37073, %rax
	movq $6195, %rcx
	imulq %rcx
	movq $29789, %rcx
	cqto
	idivq %rcx
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	subq %rbx, %rax
	movq $20509, %rcx
	movq %rax, %rbx
	movq %rcx, %rax
	subq %rax, %rbx
	movq $48672, %rax
	movq $3326, %rcx
	cqto
	idivq %rcx
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	subq %rbx, %rax
	movq $6765, %rbx
	subq %rbx, %rax
	movq $15487, %rcx
	movq %rax, %rbx
	movq %rcx, %rax
	subq %rax, %rbx
	movq $55049, %rax
	negq %rax
	movq $57936, %rcx
	cqto
	idivq %rcx
	movq %rax, %rcx
	movq $1317, %rax
	movq $47218, %rsi
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	addq %rcx, %rax
	addq %rax, %rbx
	movq $27399, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	imulq %rbx
	movq $30631, %rbx
	cqto
	idivq %rbx
	movq $13076, %rbx
	imulq %rbx
	pushq %rax
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
