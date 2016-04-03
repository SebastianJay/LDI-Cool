	.file	"internals.c"
	.text
	.p2align 4,,15
	.globl	IO.new
	.type	IO.new, @function
IO.new:
.LFB61:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$24, %esi
	movl	$1, %edi
	call	calloc
	movq	$3, (%rax)
	movq	$IO_vtable, 8(%rax)
	movq	$0, 16(%rax)
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE61:
	.size	IO.new, .-IO.new
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld"
	.text
	.p2align 4,,15
	.globl	in_int
	.type	in_int, @function
in_int:
.LFB63:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$1, %esi
	movl	$4096, %edi
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	$0, 8(%rsp)
	call	calloc
	movq	stdin(%rip), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	fgets
	leaq	8(%rsp), %rdx
	movl	$.LC0, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_sscanf
	movl	%eax, %ebp
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L15:
	movq	stdin(%rip), %rdx
	movl	$4096, %esi
	movq	%rbx, %rdi
	call	fgets
.L7:
	movq	%rbx, %rcx
.L4:
	movl	(%rcx), %esi
	addq	$4, %rcx
	leal	-16843009(%rsi), %edx
	notl	%esi
	andl	%esi, %edx
	andl	$-2139062144, %edx
	je	.L4
	movl	%edx, %eax
	shrl	$16, %eax
	testl	$32896, %edx
	cmove	%eax, %edx
	leaq	2(%rcx), %rax
	cmove	%rax, %rcx
	addb	%dl, %dl
	sbbq	$3, %rcx
	subq	%rbx, %rcx
	movslq	%ecx, %rcx
	cmpb	$10, -1(%rbx,%rcx)
	jne	.L15
	movq	%rbx, %rdi
	addl	$1, %ebp
	call	free
	cmpl	$1, %ebp
	jbe	.L9
	movq	8(%rsp), %rdx
	movl	$2147483648, %esi
	movl	$4294967295, %ecx
	xorl	%eax, %eax
	addq	%rdx, %rsi
	cmpq	%rcx, %rsi
	cmovbe	%rdx, %rax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE63:
	.size	in_int, .-in_int
	.section	.rodata.str1.1
.LC1:
	.string	"%d"
	.text
	.p2align 4,,15
	.globl	IO.out_int
	.type	IO.out_int, @function
IO.out_int:
.LFB64:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	24(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	16(%rbp), %rbx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbx, %rax
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	leave
	ret
	.cfi_endproc
.LFE64:
	.size	IO.out_int, .-IO.out_int
	.section	.rodata.str1.1
.LC2:
	.string	""
	.text
	.p2align 4,,15
	.globl	in_string
	.type	in_string, @function
in_string:
.LFB67:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$4096, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$1, %esi
	movl	$4096, %edi
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	calloc
	movq	%rax, %rbp
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L25:
	addq	$1, %rbx
.L20:
	movq	stdin(%rip), %rdi
	movslq	%ebx, %r13
	call	fgetc
	cmpl	$-1, %eax
	je	.L28
	testl	%eax, %eax
	je	.L26
	cmpl	$10, %eax
	.p2align 4,,3
	je	.L29
	leal	-1(%r12), %edx
	leal	1(%rbx), %ecx
	movb	%al, 0(%rbp,%rbx)
	cmpl	%ecx, %edx
	jne	.L25
	movslq	%edx, %rdx
	addl	$4096, %r12d
	movl	$1, %esi
	movb	$0, 0(%rbp,%rdx)
	movslq	%r12d, %rdi
	call	calloc
	movq	%rbp, %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	strcpy
	movq	%rbp, %rdi
	movq	%r13, %rbp
	call	free
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L28:
	testl	%r13d, %r13d
	movl	$.LC2, %eax
	cmovne	%rbp, %rax
	addq	$8, %rsp
	.cfi_remember_state
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$.LC2, %eax
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
	movb	$0, 0(%rbp,%r13)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%rbp, %rax
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE67:
	.size	in_string, .-in_string
	.section	.rodata.str1.1
.LC3:
	.string	"%s"
	.text
	.p2align 4,,15
	.globl	out_string
	.type	out_string, @function
out_string:
.LFB69:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	pushq	%rbp
	pushq	%rbx	
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq %rdi, %rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	strlen
	leal	1(%rax), %edi
	movq	%rax, %r12
	movl	$1, %esi
	movl	%eax, %ebx
	movslq	%edi, %rdi
	call	calloc
	leaq	1(%r12), %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
	xorl	%ebp, %ebp
	call	memcpy
	cmpl	$1, %r12d
	leaq	1(%r13), %r9
	movl	$1, %r10d
	jg	.L43
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L32:
	addl	$1, %r10d
	movq	%r11, %r9
	cmpl	%r10d, %ebx
	jle	.L35
.L43:
	cmpb	$92, -1(%r9)
	leaq	1(%r9), %r11
	jne	.L32
	movzbl	(%r9), %ecx
	cmpb	$116, %cl
	je	.L39
	cmpb	$110, %cl
	jne	.L32
	movl	$10, %r12d
.L33:
	movl	%ebx, %eax
	leaq	1(%r9), %r11
	subl	%ebp, %eax
	cmpl	%eax, %r10d
	jge	.L37
	subl	%r10d, %eax
	movq	%r11, %rcx
	subl	$1, %eax
	leaq	2(%r9,%rax), %r8
	.p2align 4,,10
	.p2align 3
.L38:
	movzbl	(%rcx), %esi
	addq	$1, %rcx
	movb	%sil, -2(%rcx)
	cmpq	%r8, %rcx
	jne	.L38
.L37:
	addl	$1, %r10d
	addl	$1, %ebp
	movb	%r12b, -1(%r9)
	cmpl	%r10d, %ebx
	movq	%r11, %r9
	jg	.L43
.L35:
	movq	%r13, %rdx
	movl	$1, %edi
	movl	$.LC3, %esi
	xorl	%eax, %eax
	call	__printf_chk
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r13, %rdi
	call	free
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	ret
	.cfi_def_cfa_offset 8
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_restore_state
	movl	$9, %r12d
	jmp	.L33
	.cfi_endproc
.LFE69:
	.size	out_string, .-out_string
	.p2align 4,,15
	.globl	IO.out_string
	.type	IO.out_string, @function
IO.out_string:
.LFB68:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rdi
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	16(%rbp), %rbx
	movq	24(%rbp), %rdi
	movq	24(%rdi), %rdi
	call	out_string
	movq	%rbx, %rax
	popq	%rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	leave
	ret
	.cfi_endproc
.LFE68:
	.size	IO.out_string, .-IO.out_string
	.p2align 4,,15
	.globl	out_error
	.type	out_error, @function
out_error:
.LFB70:
	.cfi_startproc
	movq	%rsi, %rdx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE70:
	.size	out_error, .-out_error
	.p2align 4,,15
	.globl	Object.new
	.type	Object.new, @function
Object.new:
.LFB71:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$24, %esi
	movl	$1, %edi
	call	calloc
	movq	$0, (%rax)
	movq	$Object_vtable, 8(%rax)
	movq	$0, 16(%rax)
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE71:
	.size	Object.new, .-Object.new
	.section	.rodata.str1.1
.LC4:
	.string	"abort\n"
	.text
	.p2align 4,,15
	.globl	Object.abort
	.type	Object.abort, @function
Object.abort:
.LFB72:
	.cfi_startproc
	movl	$.LC4, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	out_string
	xorl	%edi, %edi
	call	exit
	.cfi_endproc
.LFE72:
	.size	Object.abort, .-Object.abort
	.p2align 4,,15
	.globl	Object.copy
	.type	Object.copy, @function
Object.copy:
.LFB74:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	16(%rbp), %rdi
	movq	16(%rdi), %rax
	movq	%rdi, %rbx
	movl	$8, %esi
	leaq	3(%rax), %rdi
	call	calloc
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbx), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$0, 16(%rbx)
	movl	$1, %edx
	jle	.L58
	.p2align 4,,10
	.p2align 3
.L59:
	movq	16(%rbx,%rdx,8), %rcx
	movq	%rcx, 16(%rax,%rdx,8)
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpq	16(%rbx), %rcx
	jl	.L59
.L58:
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	leave
	ret
	.cfi_endproc
.LFE74:
	.size	Object.copy, .-Object.copy
	.p2align 4,,15
	.globl	String.new
	.type	String.new, @function
String.new:
.LFB75:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	$2, (%rax)
	movq	$String_vtable, 8(%rax)
	movq	$1, 16(%rax)
	movq	$.LC2, 24(%rax)
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE75:
	.size	String.new, .-String.new
	.p2align 4,,15
	.globl	IO.in_string
	.type	IO.in_string, @function
IO.in_string:
.LFB66:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	call	String.new
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	in_string
	movq	%rax, 24(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	IO.in_string, .-IO.in_string
	.p2align 4,,15
	.globl	Object.type_name
	.type	Object.type_name, @function
Object.type_name:
.LFB73:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	movq	16(%rbp), %rax	# Self arg
	movq 	8(%rax), %rax	# vtable
	movq	(%rax), %rax	# String object name
	.cfi_def_cfa_offset 8
	leave
	ret
	.cfi_endproc
.LFE73:
	.size	Object.type_name, .-Object.type_name
	.p2align 4,,15
	.globl	String.concat
	.type	String.concat, @function
String.concat:
.LFB77:
	.cfi_startproc
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	24(%rdi), %r13
	movq	%r13, %rdi
	call	strlen
	movq	24(%r12), %rdi
	movq	%rax, %rbp
	call	strlen
	leal	1(%rax,%rbp), %edi
	movl	$1, %esi
	movslq	%edi, %rdi
	call	calloc
	leaq	1(%rbp), %rdx
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	memcpy
	movq	24(%r12), %rsi
	leaq	(%rbx,%rbp), %rdi
	call	strcpy
	xorl	%eax, %eax
	call	String.new
	movq	%rbx, 24(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE77:
	.size	String.concat, .-String.concat
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"ERROR: %lld: Exception: String index out of bounds"
	.text
	.p2align 4,,15
	.globl	String.substr
	.type	String.substr, @function
String.substr:
.LFB78:
	.cfi_startproc
	pushq	%rbp
	movq 	%rsp, %rbp
	pushq	%rsp
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	16(%rbp), %rdi
	movq	24(%rbp), %rsi
	movq	32(%rbp), %rdx
	movq	%rdi, %rbp
	movq	%rdx, %r12
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	24(%rdi), %rdi
	movq	%rsi, %rbx
	call	strlen
	movq	24(%rbx), %rbx
	cltq
	movq	24(%r12), %r13
	cmpq	%rax, %rbx
	jge	.L70
	leaq	(%rbx,%r13), %rdx
	cmpq	%rdx, %rax
	jl	.L70
	testq	%rbx, %rbx
	js	.L70
	leaq	1(%r13), %r12
	xorl	%eax, %eax
	call	String.new
	movl	$1, %esi
	movq	%r12, %rdi
	movq	%rax, %r14
	call	calloc
	xorl	%ecx, %ecx
	testq	%r13, %r13
	movl	$1, %edx
	jle	.L73
	.p2align 4,,10
	.p2align 3
.L75:
	movq	%rbx, %rsi
	addq	24(%rbp), %rsi
	movzbl	(%rsi,%rcx), %ecx
	movb	%cl, -1(%rax,%rdx)
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpq	%r12, %rdx
	jne	.L75
.L73:
	movb	$0, (%rax,%r13)
	movq	%rax, 24(%r14)
	movq	%r14, %rax
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rsp
	popq	%rbp
	ret
.L70:
	xorl	%esi, %esi
	movl	$.LC5, %edi
	call	out_error
	.cfi_endproc
.LFE78:
	.size	String.substr, .-String.substr
	.p2align 4,,15
	.globl	Int.new
	.type	Int.new, @function
Int.new:
.LFB79:
	.cfi_startproc
	.cfi_def_cfa_offset 16
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	subq 	$8, %rsp
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	$1, (%rax)
	movq	$Int_vtable, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	ret
	.cfi_endproc
.LFE79:
	.size	Int.new, .-Int.new
	.p2align 4,,15
	.globl	IO.in_int
	.type	IO.in_int, @function
IO.in_int:
.LFB62:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	call	Int.new
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	in_int
	movq	%rax, 24(%rbx)
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE62:
	.size	IO.in_int, .-IO.in_int
	.p2align 4,,15
	.globl	String.length
	.type	String.length, @function
String.length:
.LFB76:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	16(%rbp), %rdi
	xorl	%eax, %eax
	movq	%rdi, %rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_def_cfa_offset 32
	call	Int.new
	movq	24(%rbp), %rdi
	movq	%rax, %rbx
	call	strlen
	movq	%rax, 24(%rbx)
	.cfi_def_cfa_offset 24
	movq	%rbx, %rax
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE76:
	.size	String.length, .-String.length
	.p2align 4,,15
	.globl	Bool.new
	.type	Bool.new, @function
Bool.new:
.LFB80:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	$4, (%rax)
	movq	$Bool_vtable, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE80:
	.size	Bool.new, .-Bool.new
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
	call	Main.new
	pushq	%rax
	call	Main.main
	addq	$8, %rsp
	ret
.LFE81:
	.size	main, .-main
### END Internals
	.section .rodata
empty_string_l:
	.string ""
empty_string:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad empty_string_l
percentd_string_l:
	.string "%d"
percentd_string:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad percentd_string_l
percentlld_string_l:
	.string "%lld"
percentlld_string:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad percentlld_string_l
name_Bool_l:
	.string "Bool"
name_Bool:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad name_Bool_l
name_IO_l:
	.string "IO"
name_IO:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad name_IO_l
substrerr_string_l:
	.string "ERROR: %lld: Exception: String index out of bounds"
substrerr_string:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad substrerr_string_l
.string0_l:
	.string "Main"
.string0:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string0_l
.string2_l:
	.string "ERROR: %lld: Exception: division by zero\n"
.string2:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string2_l
.string5_l:
	.string "ERROR: %lld: Exception: case without matching branch\n"
.string5:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string5_l
percents_string_l:
	.string "%s"
percents_string:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad percents_string_l
name_String_l:
	.string "String"
name_String:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad name_String_l
name_Int_l:
	.string "Int"
name_Int:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad name_Int_l
name_Object_l:
	.string "Object"
name_Object:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad name_Object_l
.string3_l:
	.string "ERROR: %lld: Exception: case on void\n"
.string3:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string3_l
.string4_l:
	.string "ERROR: %lld: Exception: stack overflow\n"
.string4:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string4_l
abort_string_l:
	.string "abort\\n"
abort_string:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad abort_string_l
.string1_l:
	.string "ERROR: %lld: Exception: dispatch on void\n"
.string1:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string1_l
String_vtable:
	.quad name_String
	.quad String.new
	.quad Object.abort
	.quad Object.copy
	.quad Object.type_name
	.quad String.concat
	.quad String.length
	.quad String.substr
Int_vtable:
	.quad name_Int
	.quad Int.new
	.quad Object.abort
	.quad Object.copy
	.quad Object.type_name
Object_vtable:
	.quad name_Object
	.quad Object.new
	.quad Object.abort
	.quad Object.copy
	.quad Object.type_name
Bool_vtable:
	.quad name_Bool
	.quad Bool.new
	.quad Object.abort
	.quad Object.copy
	.quad Object.type_name
IO_vtable:
	.quad name_IO
	.quad IO.new
	.quad Object.abort
	.quad Object.copy
	.quad Object.type_name
	.quad IO.in_int
	.quad IO.in_string
	.quad IO.out_int
	.quad IO.out_string
Main_vtable:
	.quad .string0
	.quad Main.new
	.quad Object.abort
	.quad Object.copy
	.quad Object.type_name
	.quad IO.in_int
	.quad IO.in_string
	.quad IO.out_int
	.quad IO.out_string
	.quad Main.main
	.text 
	.globl Main.new
	.type Main.new, @function
Main.new:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rsi
	pushq %rdi
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	movq $8, %rsi
	movq $3, %rdi
	call calloc
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rdi
	popq %rsi
	movq $10, (%rax)
	movq $Main_vtable, 8(%rax)
	movq $0, 16(%rax)
	leave
	ret
	.size Main.new, .-Main.new
	.globl Main.main
	.type Main.main, @function
Main.main:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	pushq %rbx
	pushq %rcx
	pushq %rsi
	pushq %rdi
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq 16(%rbp), %rbx
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rcx
	pushq %rbx
	call *%rcx
	addq $8, %rsp
	movq %rax, %rcx
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %r8
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -48(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -40(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -88(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -16(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -8(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -112(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %r9
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -80(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %r10
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %r11
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %r15
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %rdi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -72(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %r13
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, -96(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, -56(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, -104(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, %r14
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, -120(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, -32(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, -24(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %r12
	pushq %rbx
	call *%r12
	addq $8, %rsp
	movq %rax, %r12
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rdx
	movq %rdx, -64(%rbp)
	pushq %rbx
	call *-64(%rbp)
	addq $8, %rsp
	movq %rax, -64(%rbp)
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_1
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_2
.Main.main_1:
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r8), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_3
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r12), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_4
.Main.main_3:
	movq 24(%r13), %rax
	movq 24(%rsi), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_5
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_6
.Main.main_5:
	movq 24(%r15), %rdx
	movq %rdx, -128(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_7
	movq 24(%rdi), %rax
	movq 24(%r10), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_8
.Main.main_7:
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_9
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_10
.Main.main_9:
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_11
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_12
.Main.main_11:
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_13
	movq 24(%r12), %rcx
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_14
.Main.main_13:
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rsi), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_15
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_16
.Main.main_15:
	movq 24(%rsi), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r10), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_17
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_18
.Main.main_17:
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r13), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_19
	movq 24(%r11), %rcx
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_20
.Main.main_19:
	movq 24(%r11), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r9), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_21
	movq 24(%r13), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_22
.Main.main_21:
	movq 24(%r14), %rax
	movq 24(%rcx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_23
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r8), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_24
.Main.main_23:
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_25
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_26
.Main.main_25:
	movq 24(%r13), %rax
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_27
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r14), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_28
.Main.main_27:
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r10), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_29
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_30
.Main.main_29:
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r9), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_31
	movq 24(%r11), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_32
.Main.main_31:
	movq 24(%r8), %rax
	movq 24(%r12), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_33
	movq 24(%r15), %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_34
.Main.main_33:
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r9), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_35
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r8), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_36
.Main.main_35:
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_37
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_38
.Main.main_37:
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r10), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_39
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_40
.Main.main_39:
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_41
	movq 24(%r13), %rax
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_42
.Main.main_41:
	movq 24(%r11), %rax
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_43
	movq 24(%r15), %rsi
	movq 24(%rcx), %rax
	cmpq %rax, %rsi
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_44
.Main.main_43:
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r15), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_45
	movq 24(%rdi), %rcx
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_46
.Main.main_45:
	movq 24(%r11), %rax
	movq 24(%r9), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_47
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_48
.Main.main_47:
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r12), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_49
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_50
.Main.main_49:
	movq 24(%r13), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r12), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_51
	movq 24(%r12), %rax
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_52
.Main.main_51:
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rdi), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_53
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_54
.Main.main_53:
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%rsi), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_55
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r15), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_56
.Main.main_55:
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_57
	movq 24(%r9), %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_58
.Main.main_57:
	movq 24(%r14), %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_59
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_60
.Main.main_59:
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rdi), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_61
	movq 24(%r12), %rdx
	movq %rdx, -128(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_62
	movq 24(%r9), %rsi
	movq 24(%rcx), %rax
	cmpq %rax, %rsi
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_63
.Main.main_62:
	movq 24(%r9), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r12), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_64
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rsi
	movq 24(%rcx), %rax
	cmpq %rax, %rsi
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_65
.Main.main_64:
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_66
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rsi
	movq 24(%rcx), %rax
	cmpq %rax, %rsi
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_67
.Main.main_66:
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_68
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_69
.Main.main_68:
	movq 24(%rcx), %rdx
	movq %rdx, -128(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_70
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r12), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_71
.Main.main_70:
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_72
	movq 24(%rdi), %rax
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_73
	movq 24(%r13), %rcx
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_74
.Main.main_73:
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_75
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_76
.Main.main_75:
	movq 24(%rcx), %rdx
	movq %rdx, -128(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_77
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r11), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_78
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r14), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_79
.Main.main_78:
	movq 24(%rcx), %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_80
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r15), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_81
.Main.main_80:
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_82
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r12), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_83
.Main.main_82:
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r13), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_84
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r9), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_85
.Main.main_84:
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r9), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_86
	movq 24(%r10), %rcx
	movq 24(%r11), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_87
.Main.main_86:
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_88
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_89
.Main.main_88:
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_90
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rsi), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_91
.Main.main_90:
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_92
	movq 24(%r12), %rax
	movq 24(%r9), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_93
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	xorq $1, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_94
	movq 24(%rsi), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%rcx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_95
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_96
	movq 24(%r10), %rcx
	movq 24(%rdi), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_97
.Main.main_96:
	movq 24(%rdi), %rdx
	movq %rdx, -128(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_98
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rdi), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_99
.Main.main_98:
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_100
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r12), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_101
.Main.main_100:
	movq 24(%rdi), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_102
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_103
	movq 24(%rcx), %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_104
.Main.main_103:
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_105
	movq 24(%r14), %rcx
	movq 24(%r15), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_106
.Main.main_105:
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_107
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_108
.Main.main_107:
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%r14), %rax
	cmpq %rax, -128(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_109
	movq 24(%r9), %rax
	movq 24(%r9), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_110
.Main.main_109:
	movq 24(%r15), %rax
	movq 24(%rdi), %rdx
	movq %rdx, -128(%rbp)
	pushq %rbx
	movq -128(%rbp), %rbx
	cmpq -128(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -128(%rbp)
	popq %rbx
	movq -128(%rbp), %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_111
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r13), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_112
.Main.main_111:
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_113
	movq 24(%r9), %rcx
	movq 24(%r11), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_114
.Main.main_113:
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -8(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_115
	movq 24(%r11), %rax
	movq 24(%r8), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_116
.Main.main_115:
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	movq 24(%r15), %rax
	cmpq %rax, -8(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_117
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r11), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_118
.Main.main_117:
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_119
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r15), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	xorq $1, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_120
.Main.main_119:
	movq 24(%r12), %rax
	movq 24(%r8), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_121
	movq 24(%rcx), %rcx
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_122
.Main.main_121:
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_123
	movq 24(%r13), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_124
	movq 24(%rdi), %rax
	movq 24(%r12), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_125
.Main.main_124:
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	movq 24(%r15), %rax
	cmpq %rax, -8(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_126
	movq 24(%r12), %rdx
	movq %rdx, -8(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -8(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_127
	movq 24(%r9), %rax
	movq 24(%r15), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_128
.Main.main_127:
	movq 24(%rcx), %rax
	movq 24(%r8), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_129
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r12), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, %rcx
	xorq $1, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_130
.Main.main_129:
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_131
	movq 24(%r9), %rax
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_132
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_133
.Main.main_132:
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %rbx
	movq -8(%rbp), %rbx
	cmpq -8(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -8(%rbp)
	popq %rbx
	movq -8(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_134
	movq 24(%r8), %rcx
	movq 24(%r14), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_135
.Main.main_134:
	movq 24(%rdi), %rdx
	movq %rdx, -8(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, -8(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_136
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r12), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_137
.Main.main_136:
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r14), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmovlq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_138
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_139
.Main.main_138:
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r15), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_140
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_141
.Main.main_140:
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_142
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r9), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	xorq $1, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_143
.Main.main_142:
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmovleq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_144
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_145
.Main.main_144:
	movq 24(%r13), %rax
	movq 24(%r13), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmovlq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_146
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmovleq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_147
	movq 24(%r10), %rcx
	movq 24(%r12), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_148
.Main.main_147:
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r13), %r10
	cmpq %r10, %rax
	movq $0, %r10
	movq $1, %rdx
	cmovleq %rdx, %r10
	movq %r10, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_149
	movq 24(%r12), %rax
	movq 24(%r12), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_150
.Main.main_149:
	movq 24(%r12), %rax
	movq 24(%rcx), %r10
	cmpq %r10, %rax
	movq $0, %r10
	movq $1, %rdx
	cmovleq %rdx, %r10
	movq %r10, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_151
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %r10
	cmpq %r10, %rax
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	movq %r10, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_152
	movq 24(%r11), %rax
	movq 24(%r11), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_153
.Main.main_152:
	movq 24(%r9), %rax
	movq 24(%rcx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_154
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r9), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_155
.Main.main_154:
	movq 24(%r8), %rcx
	movq 24(%rsi), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_156
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r12), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
	jmp .Main.main_157
.Main.main_156:
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_157:
.Main.main_155:
.Main.main_153:
	jmp .Main.main_158
.Main.main_151:
	movq 24(%r12), %rcx
	movq 24(%r15), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_158:
.Main.main_150:
.Main.main_148:
	jmp .Main.main_159
.Main.main_146:
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%rsi), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_159:
.Main.main_145:
.Main.main_143:
.Main.main_141:
.Main.main_139:
.Main.main_137:
.Main.main_135:
.Main.main_133:
	jmp .Main.main_160
.Main.main_131:
	movq 24(%r13), %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
.Main.main_160:
.Main.main_130:
.Main.main_128:
	jmp .Main.main_161
.Main.main_126:
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_161:
	movq 24(%rax), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_162
	movq 24(%rdi), %rax
	movq 24(%rsi), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
	jmp .Main.main_163
.Main.main_162:
	movq 24(%r9), %rax
	movq 24(%r12), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
.Main.main_163:
.Main.main_125:
	jmp .Main.main_164
.Main.main_123:
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r14), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
.Main.main_164:
.Main.main_122:
.Main.main_120:
.Main.main_118:
.Main.main_116:
.Main.main_114:
.Main.main_112:
.Main.main_110:
.Main.main_108:
.Main.main_106:
.Main.main_104:
	jmp .Main.main_165
.Main.main_102:
	movq 24(%r8), %rcx
	movq 24(%r9), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_165:
.Main.main_101:
.Main.main_99:
.Main.main_97:
	jmp .Main.main_166
.Main.main_95:
	movq 24(%rdi), %rcx
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_166:
	jmp .Main.main_167
.Main.main_94:
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rcx
	movq 24(%r9), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_167:
	jmp .Main.main_168
.Main.main_93:
	movq 24(%r11), %rcx
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_168:
	jmp .Main.main_169
.Main.main_92:
	movq 24(%r13), %rax
	movq 24(%r14), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
.Main.main_169:
.Main.main_91:
.Main.main_89:
.Main.main_87:
.Main.main_85:
.Main.main_83:
.Main.main_81:
.Main.main_79:
	jmp .Main.main_170
.Main.main_77:
	movq 24(%rcx), %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
.Main.main_170:
.Main.main_76:
.Main.main_74:
	jmp .Main.main_171
.Main.main_72:
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r10), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -48(%rbp)
	negq -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq %rax, -40(%rbp)
	movq -48(%rbp), %rax
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq 24(%r8), %rax
	movq 24(%r9), %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r9
	movq $0, -48(%rbp)
	pushq %rax
	movq -48(%rbp), %rax
	cmpq -48(%rbp), %r9
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -48(%rbp)
	popq %rax
	xorq $1, -48(%rbp)
	cmpq $1, -48(%rbp)
	je .Main.main_172
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_172:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %r9
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r9, %rax
	movq 24(%r10), %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r10), %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq %rax, %r9
	movq -40(%rbp), %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -40(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	movq $0, -48(%rbp)
	movq -40(%rbp), %rdx
	pushq %rax
	movq -48(%rbp), %rax
	cmpq -48(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -48(%rbp)
	popq %rax
	xorq $1, -48(%rbp)
	cmpq $1, -48(%rbp)
	je .Main.main_173
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_173:
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -40(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	movq $0, -48(%rbp)
	movq -40(%rbp), %rdx
	pushq %rax
	movq -48(%rbp), %rax
	cmpq -48(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -48(%rbp)
	popq %rax
	xorq $1, -48(%rbp)
	cmpq $1, -48(%rbp)
	je .Main.main_174
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_174:
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq %r9, %rax
	movq -40(%rbp), %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -32(%rbp)
	movq 24(%r8), %rax
	movq -32(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq $0, -40(%rbp)
	movq -32(%rbp), %rdx
	pushq %rax
	movq -40(%rbp), %rax
	cmpq -40(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -40(%rbp)
	popq %rax
	xorq $1, -40(%rbp)
	cmpq $1, -40(%rbp)
	je .Main.main_175
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_175:
	cltq
	cqto
	idivq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq $0, -40(%rbp)
	movq -32(%rbp), %rdx
	pushq %rax
	movq -40(%rbp), %rax
	cmpq -40(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -40(%rbp)
	popq %rax
	xorq $1, -40(%rbp)
	cmpq $1, -40(%rbp)
	je .Main.main_176
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_176:
	cltq
	cqto
	idivq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %r9, %rax
	movq -32(%rbp), %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq 24(%r15), %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq 24(%r12), %rax
	movq 24(%r14), %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r12
	movq $0, %r14
	cmpq %r14, %r12
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_177
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_177:
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r12
	movq $0, %r14
	cmpq %r14, %r12
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_178
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_178:
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, %r12
	movq 24(%rdi), %rax
	movq %r12, %rdi
	movq $0, %r12
	cmpq %r12, %rdi
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_179
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_179:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %r9, %rdi
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $12, %r9
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq $0, %r12
	cmpq %r12, %r9
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_180
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_180:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rsi), %rsi
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	movq $0, %r9
	cmpq %r9, %rsi
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_181
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_181:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	movq $0, %r9
	cmpq %r9, %rsi
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_182
	movq $308, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_182:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, %rsi
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rsi
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rax
	movq 24(%r11), %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r13), %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r10), %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq 24(%rcx), %rax
	cmpq %rax, %rsi
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	pushq %rax
	call Bool.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %rax
.Main.main_171:
.Main.main_71:
.Main.main_69:
.Main.main_67:
.Main.main_65:
.Main.main_63:
	jmp .Main.main_183
.Main.main_61:
	movq $12, %rdi
	movq 24(%r12), %rax
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_184
	movq $316, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_184:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_185
	movq $316, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_185:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq 24(%r10), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $12, %r8
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq $0, %r10
	cmpq %r10, %r8
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_186
	movq $316, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_186:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq 24(%rsi), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	movq $0, %r8
	cmpq %r8, %rsi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_187
	movq $316, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_187:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	movq $0, %r8
	cmpq %r8, %rsi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_188
	movq $316, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_188:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rdi, %rsi
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq 24(%r14), %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $12, %rdi
	movq 24(%r9), %rax
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_189
	movq $316, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_189:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rcx
	movq $0, %rdi
	cmpq %rdi, %rcx
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_190
	movq $316, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_190:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rsi, %rcx
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rax
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	call Bool.new
	movq %rcx, 24(%rax)
.Main.main_183:
.Main.main_60:
.Main.main_58:
.Main.main_56:
.Main.main_54:
.Main.main_52:
.Main.main_50:
.Main.main_48:
.Main.main_46:
.Main.main_44:
.Main.main_42:
.Main.main_40:
.Main.main_38:
.Main.main_36:
.Main.main_34:
.Main.main_32:
.Main.main_30:
.Main.main_28:
.Main.main_26:
.Main.main_24:
.Main.main_22:
.Main.main_20:
.Main.main_18:
.Main.main_16:
.Main.main_14:
.Main.main_12:
.Main.main_10:
.Main.main_8:
.Main.main_6:
.Main.main_4:
.Main.main_2:
	movq 24(%rax), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_191
	movq $1, %rax
	pushq %rax
	call Int.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rsi
	pushq %rcx
	pushq %rbx
	call *%rsi
	addq $16, %rsp
	jmp .Main.main_192
.Main.main_191:
	movq $0, %rax
	pushq %rax
	call Int.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rsi
	pushq %rcx
	pushq %rbx
	call *%rsi
	addq $16, %rsp
.Main.main_192:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rdi
	popq %rsi
	popq %rcx
	popq %rbx
	leave
	ret
	.size Main.main, .-Main.main
