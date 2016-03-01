	.file	"internals.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld"
	.text
	.p2align 4,,15
	.globl	in_int
	.type	in_int, @function
in_int:
.LFB39:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC0, %edi
	xorl	%eax, %eax
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	in_int, .-in_int
	.p2align 4,,15
	.globl	out_int
	.type	out_int, @function
out_int:
.LFB40:
	.cfi_startproc
	movq	%rdi, %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk
	.cfi_endproc
.LFE40:
	.size	out_int, .-out_int
	.p2align 4,,15
	.globl	in_string
	.type	in_string, @function
in_string:
.LFB41:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1, %esi
	movl	$4096, %edi
	call	calloc
	movq	stdin(%rip), %rdx
	movq	%rax, %rbx
	movl	$4096, %esi
	movq	%rax, %rdi
	call	fgets
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	in_string, .-in_string
	.section	.rodata.str1.1
.LC1:
	.string	"%s"
	.text
	.p2align 4,,15
	.globl	out_string
	.type	out_string, @function
out_string:
.LFB42:
	.cfi_startproc
	movq	%rdi, %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk
	.cfi_endproc
.LFE42:
	.size	out_string, .-out_string
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	in_string
	movl	$.LC1, %esi
	movq	%rax, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
