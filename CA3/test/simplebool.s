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
	movq	-8(%rbp), %rax
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
	##movl	$0, %eax		#not sure if necessary
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
	movq %rsp, %rbp
	movq $2, %rax
	movq $2, %rbx
	imulq %rbx
	movq $1, %rbx
	movq $2, %rcx
	addq %rcx, %rbx
	movq $3, %rcx
	addq %rcx, %rbx
	cmp %rbx, %rax
	movq $1, %rbx
	movq $0, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmp $0, %rax
	je Main_main_0
	movq $12, %rax
	pushq %rdi
	pushq %rsi
	pushq %rax
	call out_int
	addq $8, %rsp
	popq %rsi
	popq %rdi
	jmp Main_main_1
Main_main_0:
	movq $34, %rax
	pushq %rdi
	pushq %rsi
	pushq %rax
	call out_int
	addq $8, %rsp
	popq %rsi
	popq %rdi
Main_main_1:
	movq %rbp, %rsp
	popq %rbp
	ret
