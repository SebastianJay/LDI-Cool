	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	in_int
	.type	in_int, @function
in_int:
.LFB2:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-4(%rbp), %eax
	cltq
	leave
	ret
.LFE2:
	.size	in_int, .-in_int
	.globl	out_int
	.type	out_int, @function
out_int:
.LFB3:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	16(%rsp), %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	ret
.LFE3:
	.size	out_int, .-out_int
	.globl main
	.type main, @function
main:
	pushq %rbp
	mov %rsp, %rbp
	movl $2147483647, %eax
	movl $1, %ebx
	addl %eax, %ebx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movl $2147483647, %ebx
	movl $4, %eax
	imull %ebx
	pushq %rax
	call out_int
	addq $8, %rsp
	movl $2147483647, %eax
	negl %eax
	movl $2, %ebx
	negl %ebx
	addl %eax, %ebx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movl $0, %eax
	mov %rbp, %rsp
	popq %rbp
	ret
