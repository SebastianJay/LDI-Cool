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
	movq $0, %rsi
	cmpq $2147483647, %rax
	cmovg %rsi, %rax
	cmpq $-2147483648, %rax
	cmovl %rsi, %rax
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
	movq $2147483647, %rax
	movq $1, %rbx
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
	movq $2147483647, %rax
	movq $4, %rbx
	imulq %rbx
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
	movq $2147483647, %rax
	negq %rax
	movq $2, %rbx
	negq %rbx
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
	movq $2147483647, %rax
	movq %rax, %rbx
	negq %rbx
	movq $1, %rax
	subq %rax, %rbx
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
	movq $2147483647, %rax
	negq %rax
	movq $2, %rbx
	cqto
	idivq %rbx
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
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
