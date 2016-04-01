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
	movl	$1, %esi
	movl	$4096, %edi
	pushq	%rbx
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
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
.string1_l:
	.string "ERROR: %lld: Exception: dispatch on void"
.string1:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string1_l
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
.string3_l:
	.string "ERROR: %lld: Exception: case on void"
.string3:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string3_l
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
.string4_l:
	.string "ERROR: %lld: Exception: stack overflow"
.string4:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string4_l
name_Object_l:
	.string "Object"
name_Object:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad name_Object_l
.string5_l:
	.string "ERROR: %lld: Exception: case without matching branch"
.string5:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string5_l
abort_string_l:
	.string "abort\\n"
abort_string:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad abort_string_l
.string2_l:
	.string "ERROR: %lld: Exception: division by zero"
.string2:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string2_l
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
	subq $40, %rsp
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
	movq 16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq $34533, %rbx
	movq $48880, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq $50538, %rcx
	movq $12757, %rbx
	imulq %rbx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	movq %rax, -24(%rbp)
	movq %rbx, %rax
	subq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq $46509, %rax
	movq %rax, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $3306, -40(%rbp)
	movq $61695, %rax
	movq $50213, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_1
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_1:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $8423, %rbx
	movq $34498, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $56453, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $60575, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $53667, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_2
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_2:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $60858, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $2438, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_3
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_3:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $34422, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $18841, %rbx
	movq $54759, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_4
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_4:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $17815, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_5
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_5:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $58210, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $28379, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_6
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_6:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $12660, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_7
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_7:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $19369, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $55318, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $48608, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $3828, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_8
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_8:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $2739, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_9
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_9:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $8340, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $45807, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $29181, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $51233, %rbx
	movq $33158, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_10
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_10:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $47308, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_11
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_11:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $229, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_12
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_12:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25241, %rbx
	movq $13257, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $840, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_13
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_13:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $62420, %rcx
	movq $31735, %rbx
	imulq %rbx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $17376, %rbx
	movq %rbx, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $9569, %rbx
	imulq %rbx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $54460, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $28260, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $18310, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $14379, %rbx
	movq $61731, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_14
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_14:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $20908, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $59714, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_15
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_15:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $5456, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rbx
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq -32(%rbp), %rax
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_16
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_16:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $46032, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_17
	movq $3, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_17:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -24(%rbp), %rax
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $34526, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rbx
	popq %rax
	movq %rax, 24(%rbx)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rax
	pushq %rbx
	pushq -16(%rbp)
	call *%rax
	addq $16, %rsp
	movq $2730, %rbx
	call Int.new
	movq %rbx, 24(%rax)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rbx
	pushq %rax
	pushq -16(%rbp)
	call *%rbx
	addq $16, %rsp
	movq $13765, %rbx
	movq $5137, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq $3850, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_18
	movq $5, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_18:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	call Int.new
	movq %rbx, 24(%rax)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rbx
	pushq %rax
	pushq -16(%rbp)
	call *%rbx
	addq $16, %rsp
	movq $21018, %rbx
	call Int.new
	movq %rbx, 24(%rax)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rbx
	pushq %rax
	pushq -16(%rbp)
	call *%rbx
	addq $16, %rsp
	movq $16210, %rax
	movq $23599, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $8997, %rbx
	movq $30996, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_19
	movq $7, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_19:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $27231, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_20
	movq $7, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_20:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $15755, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $23071, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_21
	movq $7, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_21:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $62331, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rbx
	popq %rax
	movq %rax, 24(%rbx)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rax
	pushq %rbx
	pushq -16(%rbp)
	call *%rax
	addq $16, %rsp
	movq $9856, %rbx
	movq $8640, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq $11282, %rcx
	movq $39523, %rbx
	imulq %rbx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	movq %rax, -24(%rbp)
	movq %rbx, %rax
	addq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq $57869, -32(%rbp)
	movq $49695, %rax
	movq $13131, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $18119, %rbx
	movq %rax, -40(%rbp)
	movq %rbx, %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq $14461, %rax
	movq $15505, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33976, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $36010, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $16029, %rbx
	movq $19302, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_22
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_22:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $39267, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_23
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_23:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $3175, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $19020, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_24
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_24:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $16420, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_25
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_25:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $53595, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $43617, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $55348, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_26
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_26:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rcx
	movq $8271, %rbx
	imulq %rbx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	movq $63080, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_27
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_27:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $50998, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25947, %rbx
	movq $22130, %rcx
	movq $60913, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_28
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_28:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	movq $6550, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_29
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_29:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	movq $29011, %rsi
	subq %rsi, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $43604, %rsi
	addq %rsi, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $46874, %rsi
	addq %rsi, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $29252, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	addq %rsi, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $25351, %rsi
	subq %rsi, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_30
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_30:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $36212, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $30605, %rbx
	movq $35043, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_31
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_31:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $63562, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_32
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_32:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $14901, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_33
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_33:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $46154, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $53085, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rcx
	movq $24923, %rbx
	imulq %rbx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20995, %rbx
	movq $47127, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $53587, %rbx
	movq $6934, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_34
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_34:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $23915, %rbx
	movq $63399, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $52290, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $52486, %rbx
	movq $20968, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_35
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_35:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $37473, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_36
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_36:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $14802, %rbx
	movq $39506, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_37
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_37:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33866, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $16693, %rcx
	movq $2211, %rbx
	imulq %rbx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $30018, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20384, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -40(%rbp), %rax
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25036, %rcx
	movq %rax, %rbx
	movq %rcx, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq -32(%rbp), %rax
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_38
	movq $8, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_38:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -24(%rbp), %rax
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $38737, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rbx
	popq %rax
	movq %rax, 24(%rbx)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rax
	pushq %rbx
	pushq -16(%rbp)
	call *%rax
	addq $16, %rsp
	movq $19322, %rbx
	movq $38661, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq $21514, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, -24(%rbp)
	movq $604, -32(%rbp)
	movq $21813, %rax
	movq $25099, %rbx
	movq $52033, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $34320, %rcx
	movq $25316, %rsi
	movq $8214, %rdi
	imulq %rdi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $22802, %rdi
	addq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $5660, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $10478, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $10464, %rdi
	movq $32716, %r8
	movq $49288, %r9
	movq $5606, %r10
	imulq %r10
	shlq $32, %r9
	sarq $32, %r9
	movq $2985, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	imulq %r10
	shlq $32, %r9
	sarq $32, %r9
	movq $59495, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_39
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_39:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $60127, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $63664, %r9
	movq $60238, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_40
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_40:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	movq $28227, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_41
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_41:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $7429, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $50691, %r10
	imulq %r10
	shlq $32, %r9
	sarq $32, %r9
	subq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $5411, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $18444, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $48391, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $58688, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_42
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_42:
	cltq
	cqto
	idivq %r11
	shlq $32, %r10
	sarq $32, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	imulq %r10
	shlq $32, %r9
	sarq $32, %r9
	movq %r9, %r10
	movq $8738, %r9
	imulq %r9
	shlq $32, %r10
	sarq $32, %r10
	movq $36519, %r9
	imulq %r9
	shlq $32, %r10
	sarq $32, %r10
	movq %r10, %r9
	movq $27940, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_43
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_43:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	subq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $50929, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_44
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_44:
	cltq
	cqto
	idivq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rdi, %r8
	movq $47963, %rdi
	imulq %rdi
	shlq $32, %r8
	sarq $32, %r8
	movq %r8, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $15735, %rdi
	movq $932, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_45
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_45:
	cltq
	cqto
	idivq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	movq $27409, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_46
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_46:
	cltq
	cqto
	idivq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	addq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $35237, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $53642, %r8
	movq $21521, %rdi
	imulq %rdi
	shlq $32, %r8
	sarq $32, %r8
	movq %r8, %rdi
	addq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $53181, %rdi
	addq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $24320, %rdi
	movq $3520, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_47
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_47:
	cltq
	cqto
	idivq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	addq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	imulq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $40488, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $58419, %rsi
	imulq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	addq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $17975, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_48
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_48:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $43856, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_49
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_49:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $52306, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_50
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_50:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq $55626, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq $11513, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_51
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_51:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -32(%rbp), %rax
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $41765, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $39037, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_52
	movq $9, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_52:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -24(%rbp), %rax
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rbx
	popq %rax
	movq %rax, 24(%rbx)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rax
	pushq %rbx
	pushq -16(%rbp)
	call *%rax
	addq $16, %rsp
	movq $28968, %rax
	movq $32079, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_53
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_53:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	movq $64947, %rax
	movq %rax, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq $38220, %rax
	movq $48887, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $7493, %rcx
	addq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $26972, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $62150, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $30797, %rdi
	movq $3233, %r8
	movq $26083, %r9
	movq $56556, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_54
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_54:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	movq $55273, %r10
	movq $38801, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $17979, %r12
	imulq %r12
	shlq $32, %r11
	sarq $32, %r11
	movq $14356, %r12
	subq %r12, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $61208, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	subq %r12, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $25185, %r12
	addq %r12, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $47041, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $65097, %r13
	imulq %r13
	shlq $32, %r12
	sarq $32, %r12
	addq %r12, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $5880, %r12
	movq $12843, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_55
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_55:
	cltq
	cqto
	idivq %r13
	shlq $32, %r12
	sarq $32, %r12
	movq $38600, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_56
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_56:
	cltq
	cqto
	idivq %r13
	shlq $32, %r12
	sarq $32, %r12
	movq $25834, %r13
	imulq %r13
	shlq $32, %r12
	sarq $32, %r12
	subq %r12, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $47353, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $2951, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_57
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_57:
	cltq
	cqto
	idivq %r13
	shlq $32, %r12
	sarq $32, %r12
	movq $63252, %r13
	subq %r13, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $35037, %r13
	movq $56918, %r14
	movq $55662, %r15
	movq $0, -8(%rbp)
	pushq %rax
	movq -8(%rbp), %rax
	cmpq -8(%rbp), %r15
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -8(%rbp)
	popq %rax
	xorq $1, -8(%rbp)
	cmpq $1, -8(%rbp)
	je .Main.main_58
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_58:
	cltq
	cqto
	idivq %r15
	shlq $32, %r14
	sarq $32, %r14
	movq $0, %r15
	cmpq %r15, %r14
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_59
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_59:
	cltq
	cqto
	idivq %r14
	shlq $32, %r13
	sarq $32, %r13
	addq %r13, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $15079, %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $64582, %r14
	movq $0, %r15
	cmpq %r15, %r14
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_60
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_60:
	cltq
	cqto
	idivq %r14
	shlq $32, %r13
	sarq $32, %r13
	movq $7741, %r14
	movq $0, %r15
	cmpq %r15, %r14
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_61
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_61:
	cltq
	cqto
	idivq %r14
	shlq $32, %r13
	sarq $32, %r13
	addq %r13, %r12
	shlq $32, %r12
	sarq $32, %r12
	addq %r12, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $18422, %r12
	subq %r12, %r11
	shlq $32, %r11
	sarq $32, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	subq %r11, %r10
	shlq $32, %r10
	sarq $32, %r10
	imulq %r10
	shlq $32, %r9
	sarq $32, %r9
	subq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	imulq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	movq $2469, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_62
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_62:
	cltq
	cqto
	idivq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_63
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_63:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	addq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $37073, %rsi
	movq $6195, %rcx
	imulq %rcx
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rcx
	movq $29789, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_64
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_64:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $20509, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $48672, %rcx
	movq $3326, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_65
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_65:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $6765, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $15487, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $55049, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $57936, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_66
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_66:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	movq $1317, %rsi
	movq $47218, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_67
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_67:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rsi
	sarq $32, %rsi
	addq %rsi, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	addq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $27399, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -32(%rbp), %rax
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $30631, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_68
	movq $10, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_68:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $13076, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq -24(%rbp), %rax
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rbx
	popq %rax
	movq %rax, 24(%rbx)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rax
	pushq %rbx
	pushq -16(%rbp)
	call *%rax
	addq $16, %rsp
	movq $48557, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $38915, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_69
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_69:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $6821, %rbx
	movq $45379, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $48457, %rsi
	movq $18781, %rcx
	imulq %rcx
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rcx
	movq $47988, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_70
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_70:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $41455, %rcx
	movq $64464, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_71
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_71:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	movq $49119, %rsi
	movq $40570, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $28147, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $15714, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_72
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_72:
	cltq
	cqto
	idivq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $10809, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	imulq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $48118, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $20470, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	imulq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	addq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $50347, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $1202, %rsi
	movq $51824, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_73
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_73:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $33161, %rdi
	subq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $18429, %rdi
	movq $52820, %r8
	movq $38686, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $8022, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $33788, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_74
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_74:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $17594, %r9
	subq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $15798, %r9
	subq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $62723, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $63899, %r9
	movq $18189, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_75
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_75:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $60159, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $1357, %r10
	movq $9886, %r11
	imulq %r11
	shlq $32, %r10
	sarq $32, %r10
	movq %r10, %r11
	movq $27696, %r10
	imulq %r10
	shlq $32, %r11
	sarq $32, %r11
	movq %r11, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_76
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_76:
	cltq
	cqto
	idivq %r10
	shlq $32, %r9
	sarq $32, %r9
	subq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $61569, %r10
	movq $2562, %r9
	imulq %r9
	shlq $32, %r10
	sarq $32, %r10
	movq $38208, %r9
	imulq %r9
	shlq $32, %r10
	sarq $32, %r10
	movq %r10, %r9
	movq $19892, %r10
	imulq %r10
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_77
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_77:
	cltq
	cqto
	idivq %r8
	shlq $32, %rdi
	sarq $32, %rdi
	addq %rdi, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_78
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_78:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rcx
	sarq $32, %rcx
	addq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $14546, %rcx
	subq %rcx, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $49411, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_79
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_79:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $9508, %rbx
	movq $60323, %rcx
	imulq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $7258, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_80
	movq $11, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_80:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rbx
	sarq $32, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rbx
	popq %rax
	movq %rax, 24(%rbx)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rax
	pushq %rbx
	pushq -16(%rbp)
	call *%rax
	addq $16, %rsp
	movq $31515, %rax
	movq %rax, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	call Int.new
	movq %rbx, 24(%rax)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rbx
	pushq %rax
	pushq -16(%rbp)
	call *%rbx
	addq $16, %rsp
	movq $51549, %rbx
	call Int.new
	movq %rbx, 24(%rax)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rbx
	pushq %rax
	pushq -16(%rbp)
	call *%rbx
	addq $16, %rsp
	movq $2147483647, %rbx
	movq $2, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq $2, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_81
	movq $14, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_81:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	call Int.new
	movq %rbx, 24(%rax)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rbx
	pushq %rax
	pushq -16(%rbp)
	call *%rbx
	addq $16, %rsp
	movq $1073741824, %rbx
	movq $4, %rax
	imulq %rax
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq $2, %rbx
	movq $0, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	xorq $1, %rcx
	cmpq $1, %rcx
	je .Main.main_82
	movq $15, %rsi
	movq $.string2_l, %rdi
	call printf
	movq $1, %rdi
	call exit
.Main.main_82:
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	call Int.new
	movq %rbx, 24(%rax)
	movq 8(-16(%rbp)), %rdx
	movq 56(%rdx), %rbx
	pushq %rax
	pushq -16(%rbp)
	call *%rbx
	addq $16, %rsp
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
