.LC0:
	.string	"%ld"
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
	movl	$.LC0, %edi
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
	call in_int
	addq $0, %rsp
	movq %rax, %rbx
	movq %rbx, %rax
Main_main_0:
	movq $5, %rsi
	movq %rax, %rcx
	cmp %rsi, %rcx
	movq $1, %rsi
	movq $0, %rdx
	cmovlq %rdx, %rsi
	movq %rsi, %rcx
	xorq $1, %rcx
	cmp $0, %rcx
	je Main_main_1
	movq $1, %rcx
	addq %rax, %rcx
	movq %rcx, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_0
Main_main_1:
	movq %rbx, %rax
Main_main_2:
	movq $5, %rsi
	movq %rax, %rcx
	cmp %rsi, %rcx
	movq $1, %rsi
	movq $0, %rdx
	cmovleq %rdx, %rsi
	movq %rsi, %rcx
	xorq $1, %rcx
	cmp $0, %rcx
	je Main_main_3
	movq $1, %rcx
	addq %rax, %rcx
	movq %rcx, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_2
Main_main_3:
	movq %rbx, %rax
Main_main_4:
	movq $5, %rcx
	movq %rax, %rbx
	cmp %rcx, %rbx
	movq $1, %rcx
	movq $0, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rbx
	xorq $1, %rbx
	cmp $0, %rbx
	je Main_main_5
	movq $1, %rbx
	addq %rax, %rbx
	movq %rbx, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_4
Main_main_5:
	movq %rbp, %rsp
	popq %rbp
	ret