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
	subq $168, %rsp
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
	movq %rax, %r14
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
	movq %rax, -16(%rbp)
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
	movq %rax, -24(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -96(%rbp)
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
	movq %rax, -48(%rbp)
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
	movq %rax, %r15
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
	movq %rax, %r9
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
	movq %rax, -80(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -120(%rbp)
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
	movq %rax, %r11
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -56(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rsi
	pushq %rbx
	call *%rsi
	addq $8, %rsp
	movq %rax, -64(%rbp)
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
	movq %rax, -32(%rbp)
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
	movq %rdx, -40(%rbp)
	pushq %rbx
	call *-40(%rbp)
	addq $8, %rsp
	movq %rax, -40(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rdx
	movq %rdx, -88(%rbp)
	pushq %rbx
	call *-88(%rbp)
	addq $8, %rsp
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 40(%rdx), %rdx
	movq %rdx, -88(%rbp)
	pushq %rbx
	call *-88(%rbp)
	addq $8, %rsp
	movq %rax, -104(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rcx), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r14), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -72(%rbp)
	imulq -72(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -72(%rbp)
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	movq $0, -128(%rbp)
	movq -88(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_1
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_1:
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -88(%rbp)
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	movq $0, -128(%rbp)
	movq -88(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_2
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_2:
	cltq
	cqto
	idivq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r14), %rdx
	movq %rdx, -88(%rbp)
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq 24(%r15), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r11), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_3
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_3:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	addq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	negq -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rsi), %rdx
	movq %rdx, -88(%rbp)
	addq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_4
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_4:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	addq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq $12, -128(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_5
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_5:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_6
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_6:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_7
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_7:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_8
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_8:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_9
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_9:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_10
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_10:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_11
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_11:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	addq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -88(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq %rdx, -72(%rbp)
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq 24(%r12), %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -72(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq 24(%r8), %rax
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -88(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq 24(%rsi), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -88(%rbp)
	movq -72(%rbp), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -72(%rbp)
	addq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rsi), %rdx
	movq %rdx, -88(%rbp)
	negq -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq %rax, -72(%rbp)
	movq -88(%rbp), %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq $12, -88(%rbp)
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -88(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -88(%rbp), %rax
	cmpq -88(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -88(%rbp)
	popq %rax
	xorq $1, -88(%rbp)
	cmpq $1, -88(%rbp)
	je .Main.main_12
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_12:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r13), %rdx
	movq %rdx, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -88(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -88(%rbp), %rax
	cmpq -88(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -88(%rbp)
	popq %rax
	xorq $1, -88(%rbp)
	cmpq $1, -88(%rbp)
	je .Main.main_13
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_13:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -88(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -88(%rbp), %rax
	cmpq -88(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -88(%rbp)
	popq %rax
	xorq $1, -88(%rbp)
	cmpq $1, -88(%rbp)
	je .Main.main_14
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_14:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq -72(%rbp), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -72(%rbp)
	addq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -72(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq $12, -80(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -88(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -88(%rbp), %rax
	cmpq -88(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -88(%rbp)
	popq %rax
	xorq $1, -88(%rbp)
	cmpq $1, -88(%rbp)
	je .Main.main_15
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_15:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -88(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -88(%rbp), %rax
	cmpq -88(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -88(%rbp)
	popq %rax
	xorq $1, -88(%rbp)
	cmpq $1, -88(%rbp)
	je .Main.main_16
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_16:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq -72(%rbp), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -72(%rbp)
	addq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -72(%rbp)
	subq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -72(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq $12, -80(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -88(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -88(%rbp), %rax
	cmpq -88(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -88(%rbp)
	popq %rax
	xorq $1, -88(%rbp)
	cmpq $1, -88(%rbp)
	je .Main.main_17
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_17:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq -72(%rbp), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -72(%rbp)
	subq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -72(%rbp)
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq 24(%r11), %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq -72(%rbp), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -72(%rbp)
	subq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -72(%rbp)
	movq 24(%r12), %rax
	addq %rax, -72(%rbp)
	shlq $32, -72(%rbp)
	sarq $32, -72(%rbp)
	movq -72(%rbp), %rax
	movq 24(%rdi), %rdx
	movq %rdx, -72(%rbp)
	subq -72(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -72(%rbp)
	popq %rax
	movq -72(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -72(%rbp), %rdx
	movq %rdx, -72(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -80(%rbp)
	pushq -72(%rbp)
	pushq %rbx
	call *-80(%rbp)
	addq $16, %rsp
	movq -64(%rbp), %rdx
	movq %rdx, -88(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -64(%rbp)
	pushq -88(%rbp)
	pushq %rbx
	call *-64(%rbp)
	addq $16, %rsp
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rdi), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -64(%rbp)
	addq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r12), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq -64(%rbp), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -64(%rbp)
	addq -64(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -64(%rbp)
	addq -64(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq 24(%r12), %rax
	subq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq 24(%r15), %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r10), %rdx
	movq %rdx, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -64(%rbp)
	subq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq 24(%rcx), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	addq %rax, -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -16(%rbp)
	imulq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -16(%rbp)
	negq -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	addq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq 24(%r15), %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq $0, -128(%rbp)
	movq -96(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_18
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_18:
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq $0, -128(%rbp)
	movq -96(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_19
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_19:
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r11), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	movq -16(%rbp), %rax
	movq -96(%rbp), %rdx
	movq %rdx, -16(%rbp)
	addq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	negq -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq 24(%r10), %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	imulq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -16(%rbp)
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq $12, -80(%rbp)
	movq 24(%r15), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -96(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -96(%rbp), %rax
	cmpq -96(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -96(%rbp)
	popq %rax
	xorq $1, -96(%rbp)
	cmpq $1, -96(%rbp)
	je .Main.main_20
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_20:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	negq -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -64(%rbp), %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdx
	movq %rdx, -64(%rbp)
	negq -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq %rax, -16(%rbp)
	movq -64(%rbp), %rax
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -64(%rbp)
	subq -64(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq $0, -80(%rbp)
	movq -64(%rbp), %rdx
	pushq %rax
	movq -80(%rbp), %rax
	cmpq -80(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -80(%rbp)
	popq %rax
	xorq $1, -80(%rbp)
	cmpq $1, -80(%rbp)
	je .Main.main_21
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_21:
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq $0, -80(%rbp)
	movq -64(%rbp), %rdx
	pushq %rax
	movq -80(%rbp), %rax
	cmpq -80(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -80(%rbp)
	popq %rax
	xorq $1, -80(%rbp)
	cmpq $1, -80(%rbp)
	je .Main.main_22
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_22:
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq 24(%rdi), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq $0, -80(%rbp)
	movq -64(%rbp), %rdx
	pushq %rax
	movq -80(%rbp), %rax
	cmpq -80(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -80(%rbp)
	popq %rax
	xorq $1, -80(%rbp)
	cmpq $1, -80(%rbp)
	je .Main.main_23
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_23:
	cltq
	cqto
	idivq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -16(%rbp)
	addq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq 24(%r10), %rax
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq $12, -56(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_24
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_24:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_25
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_25:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_26
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_26:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_27
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_27:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r8), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -64(%rbp), %rdx
	movq %rdx, -64(%rbp)
	subq -64(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -64(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -64(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	movq -56(%rbp), %rax
	movq -64(%rbp), %rdx
	movq %rdx, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq $12, -56(%rbp)
	movq 24(%r13), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_28
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_28:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq -16(%rbp), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -56(%rbp)
	negq -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq %rax, -16(%rbp)
	movq -56(%rbp), %rax
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq 24(%r15), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_29
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_29:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_30
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_30:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_31
	movq $9, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_31:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq -16(%rbp), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -16(%rbp)
	popq %rax
	movq -16(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -16(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -16(%rbp)
	pushq -80(%rbp)
	pushq %rbx
	call *-16(%rbp)
	addq $16, %rsp
	movq %rsi, -16(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rsi
	pushq -16(%rbp)
	pushq %rbx
	call *%rsi
	addq $16, %rsp
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	movq $0, -56(%rbp)
	pushq %rax
	movq -56(%rbp), %rax
	cmpq -56(%rbp), %rsi
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -56(%rbp)
	popq %rax
	xorq $1, -56(%rbp)
	cmpq $1, -56(%rbp)
	je .Main.main_32
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_32:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq 24(%r8), %rax
	subq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rsi
	popq %rax
	movq %rax, 24(%rsi)
	movq %rsi, %r8
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rsi
	pushq %r8
	pushq %rbx
	call *%rsi
	addq $16, %rsp
	movq 24(%r11), %rsi
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rsi
	popq %rax
	movq %rax, 24(%rsi)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -56(%rbp)
	pushq %rsi
	pushq %rbx
	call *-56(%rbp)
	addq $16, %rsp
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -56(%rbp)
	negq -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq 24(%r14), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -56(%rbp)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq $0, -64(%rbp)
	movq -56(%rbp), %rdx
	pushq %rax
	movq -64(%rbp), %rax
	cmpq -64(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -64(%rbp)
	popq %rax
	xorq $1, -64(%rbp)
	cmpq $1, -64(%rbp)
	je .Main.main_33
	movq $21, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_33:
	cltq
	cqto
	idivq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -56(%rbp)
	subq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -56(%rbp)
	subq -56(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -56(%rbp)
	popq %rax
	movq -56(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -56(%rbp), %rdx
	movq %rdx, -56(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -64(%rbp)
	pushq -56(%rbp)
	pushq %rbx
	call *-64(%rbp)
	addq $16, %rsp
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -64(%rbp)
	negq -64(%rbp)
	shlq $32, -64(%rbp)
	sarq $32, -64(%rbp)
	call Int.new
	movq -64(%rbp), %rdx
	movq %rdx, 24(%rax)
	movq %rax, -104(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -64(%rbp)
	pushq -104(%rbp)
	pushq %rbx
	call *-64(%rbp)
	addq $16, %rsp
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -64(%rbp)
	imulq -64(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -64(%rbp)
	popq %rax
	movq -64(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -64(%rbp), %rdx
	movq %rdx, -64(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -96(%rbp)
	pushq -64(%rbp)
	pushq %rbx
	call *-96(%rbp)
	addq $16, %rsp
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -96(%rbp)
	negq -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	movq $12, -120(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_34
	movq $30, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_34:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	addq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq $12, -120(%rbp)
	movq 24(%r11), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_35
	movq $30, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_35:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -96(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -96(%rbp)
	subq -96(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -96(%rbp)
	popq %rax
	movq -96(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -120(%rbp)
	pushq -96(%rbp)
	pushq %rbx
	call *-120(%rbp)
	addq $16, %rsp
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq 24(%rcx), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r13), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq 24(%r10), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq 24(%rcx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdx
	movq %rdx, -136(%rbp)
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq 24(%r10), %rax
	movq 24(%rdi), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rdi), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -152(%rbp)
	addq -152(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -160(%rbp)
	negq -160(%rbp)
	shlq $32, -160(%rbp)
	sarq $32, -160(%rbp)
	movq %rax, -152(%rbp)
	movq -160(%rbp), %rax
	addq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq $12, -160(%rbp)
	movq 24(%r15), %rax
	movq -160(%rbp), %rdx
	movq %rdx, -160(%rbp)
	movq $0, -168(%rbp)
	movq -160(%rbp), %rdx
	pushq %rax
	movq -168(%rbp), %rax
	cmpq -168(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -168(%rbp)
	popq %rax
	xorq $1, -168(%rbp)
	cmpq $1, -168(%rbp)
	je .Main.main_36
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_36:
	cltq
	cqto
	idivq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -160(%rbp)
	movq -160(%rbp), %rdx
	movq %rdx, -160(%rbp)
	movq $0, -168(%rbp)
	movq -160(%rbp), %rdx
	pushq %rax
	movq -168(%rbp), %rax
	cmpq -168(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -168(%rbp)
	popq %rax
	xorq $1, -168(%rbp)
	cmpq $1, -168(%rbp)
	je .Main.main_37
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_37:
	cltq
	cqto
	idivq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -160(%rbp)
	movq -152(%rbp), %rax
	movq -160(%rbp), %rdx
	movq %rdx, -152(%rbp)
	subq -152(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -152(%rbp)
	imulq -152(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -152(%rbp)
	movq -144(%rbp), %rax
	movq -152(%rbp), %rdx
	movq %rdx, -144(%rbp)
	addq -144(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_38
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_38:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%rsi), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_39
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_39:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_40
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_40:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%rdi), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_41
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_41:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r10), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_42
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_42:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_43
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_43:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_44
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_44:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_45
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_45:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -88(%rbp)
	negq -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	imulq -88(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq %rdx, -88(%rbp)
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq $12, -120(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_46
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_46:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_47
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_47:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_48
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_48:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -120(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -120(%rbp), %rax
	cmpq -120(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -120(%rbp)
	popq %rax
	xorq $1, -120(%rbp)
	cmpq $1, -120(%rbp)
	je .Main.main_49
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_49:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -120(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -120(%rbp), %rax
	cmpq -120(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -120(%rbp)
	popq %rax
	xorq $1, -120(%rbp)
	cmpq $1, -120(%rbp)
	je .Main.main_50
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_50:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	subq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq $12, -104(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -104(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq $0, -104(%rbp)
	movq -96(%rbp), %rdx
	pushq %rax
	movq -104(%rbp), %rax
	cmpq -104(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -104(%rbp)
	popq %rax
	xorq $1, -104(%rbp)
	cmpq $1, -104(%rbp)
	je .Main.main_51
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_51:
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r11), %rdx
	movq %rdx, -96(%rbp)
	negq -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq $0, -104(%rbp)
	movq -96(%rbp), %rdx
	pushq %rax
	movq -104(%rbp), %rax
	cmpq -104(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -104(%rbp)
	popq %rax
	xorq $1, -104(%rbp)
	cmpq $1, -104(%rbp)
	je .Main.main_52
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_52:
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq %rdx, -88(%rbp)
	addq %rax, -88(%rbp)
	shlq $32, -88(%rbp)
	sarq $32, -88(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -96(%rbp)
	movq -96(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq $0, -104(%rbp)
	movq -96(%rbp), %rdx
	pushq %rax
	movq -104(%rbp), %rax
	cmpq -104(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -104(%rbp)
	popq %rax
	xorq $1, -104(%rbp)
	cmpq $1, -104(%rbp)
	je .Main.main_53
	movq $33, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_53:
	cltq
	cqto
	idivq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -96(%rbp)
	movq -88(%rbp), %rax
	movq -96(%rbp), %rdx
	movq %rdx, -88(%rbp)
	addq -88(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -88(%rbp)
	popq %rax
	movq -88(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -88(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -88(%rbp)
	pushq -104(%rbp)
	pushq %rbx
	call *-88(%rbp)
	addq $16, %rsp
	movq -40(%rbp), %rdx
	movq %rdx, -96(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -40(%rbp)
	pushq -96(%rbp)
	pushq %rbx
	call *-40(%rbp)
	addq $16, %rsp
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	call Int.new
	movq -40(%rbp), %rdx
	movq %rdx, 24(%rax)
	movq %rax, -40(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -88(%rbp)
	pushq -40(%rbp)
	pushq %rbx
	call *-88(%rbp)
	addq $16, %rsp
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -88(%rbp)
	addq -88(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -88(%rbp)
	popq %rax
	movq -88(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -88(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -88(%rbp)
	pushq -120(%rbp)
	pushq %rbx
	call *-88(%rbp)
	addq $16, %rsp
	movq %r8, -88(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq -88(%rbp)
	pushq %rbx
	call *-128(%rbp)
	addq $16, %rsp
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq 24(%r14), %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq 24(%r13), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -40(%rbp)
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rax
	movq 24(%r11), %rdx
	movq %rdx, -40(%rbp)
	addq -40(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -40(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -40(%rbp)
	addq -40(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq %rax, -40(%rbp)
	movq -136(%rbp), %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq $12, -136(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_54
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_54:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_55
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_55:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -40(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -40(%rbp)
	subq -40(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq $12, -136(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_56
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_56:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_57
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_57:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq $12, -136(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_58
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_58:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_59
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_59:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_60
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_60:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_61
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_61:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	addq -144(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq 24(%r8), %rax
	subq %rax, -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq -144(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_62
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_62:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_63
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_63:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -40(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -40(%rbp)
	subq -40(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rsi), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -40(%rbp)
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	movq 24(%rdi), %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r12), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq $12, -128(%rbp)
	movq 24(%rsi), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_64
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_64:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%rcx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_65
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_65:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq $12, -128(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq $0, -128(%rbp)
	movq -32(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_66
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_66:
	cltq
	cqto
	idivq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq $0, -128(%rbp)
	movq -32(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_67
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_67:
	cltq
	cqto
	idivq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq $0, -128(%rbp)
	movq -32(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_68
	movq $48, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_68:
	cltq
	cqto
	idivq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq -40(%rbp), %rax
	movq -32(%rbp), %rdx
	movq %rdx, -32(%rbp)
	subq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -32(%rbp)
	popq %rax
	movq -32(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -32(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -40(%rbp)
	pushq -32(%rbp)
	pushq %rbx
	call *-40(%rbp)
	addq $16, %rsp
	movq 24(%r8), %rdx
	movq %rdx, -32(%rbp)
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -32(%rbp)
	movq 24(%rcx), %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq 24(%r8), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq 24(%r15), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r10), %rdx
	movq %rdx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -144(%rbp)
	negq -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq %rax, -136(%rbp)
	movq -144(%rbp), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq 24(%r13), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_69
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_69:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_70
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_70:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%r8), %rax
	movq -136(%rbp), %r8
	movq $0, -136(%rbp)
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %r8
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_71
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_71:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %r8
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $12, -128(%rbp)
	movq 24(%rcx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_72
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_72:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %r8, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %r8
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq 24(%rdi), %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rax
	movq 24(%r10), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq %r8, %rax
	movq -40(%rbp), %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rdi), %r8
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %r8, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r8
	movq $0, -40(%rbp)
	pushq %rax
	movq -40(%rbp), %rax
	cmpq -40(%rbp), %r8
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -40(%rbp)
	popq %rax
	xorq $1, -40(%rbp)
	cmpq $1, -40(%rbp)
	je .Main.main_73
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_73:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %r8
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq 24(%r10), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rdi), %rdx
	movq %rdx, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %r8, %rax
	movq -32(%rbp), %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r8
	movq $0, -32(%rbp)
	pushq %rax
	movq -32(%rbp), %rax
	cmpq -32(%rbp), %r8
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -32(%rbp)
	popq %rax
	xorq $1, -32(%rbp)
	cmpq $1, -32(%rbp)
	je .Main.main_74
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_74:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rdi), %r8
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq 24(%rdi), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	movq 24(%r10), %rax
	addq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq $12, -128(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_75
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_75:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_76
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_76:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -40(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -40(%rbp)
	subq -40(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r9), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq %rax, -40(%rbp)
	movq -128(%rbp), %rax
	subq %rax, -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq 24(%r11), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -40(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -40(%rbp)
	addq -40(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -40(%rbp)
	movq -40(%rbp), %rdx
	movq %rdx, -40(%rbp)
	movq $0, -128(%rbp)
	movq -40(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_77
	movq $51, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_77:
	cltq
	cqto
	idivq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r10), %rdx
	movq %rdx, -40(%rbp)
	imulq -40(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -40(%rbp)
	movq -32(%rbp), %rax
	movq -40(%rbp), %rdx
	movq %rdx, -32(%rbp)
	addq -32(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	call Int.new
	movq %r8, 24(%rax)
	movq %rax, -40(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r8
	pushq -40(%rbp)
	pushq %rbx
	call *%r8
	addq $16, %rsp
	movq $12, %r8
	movq 24(%rcx), %rax
	movq $0, -32(%rbp)
	pushq %rax
	movq -32(%rbp), %rax
	cmpq -32(%rbp), %r8
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -32(%rbp)
	popq %rax
	xorq $1, -32(%rbp)
	cmpq $1, -32(%rbp)
	je .Main.main_78
	movq $54, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_78:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	call Int.new
	movq %r8, 24(%rax)
	movq %rax, -32(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r8
	pushq -32(%rbp)
	pushq %rbx
	call *%r8
	addq $16, %rsp
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r8
	popq %rax
	movq %rax, 24(%r8)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %r8
	pushq %rbx
	call *-128(%rbp)
	addq $16, %rsp
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r9), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq 24(%rdi), %rax
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdx
	movq %rdx, -136(%rbp)
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq 24(%rsi), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_79
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_79:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq 24(%r15), %r15
	negq %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -136(%rbp), %rax
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r15
	movq $0, -136(%rbp)
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %r15
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_80
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_80:
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %r15
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r15, %rax
	movq 24(%r8), %r15
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq 24(%r11), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_81
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_81:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $12, -128(%rbp)
	movq 24(%rcx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_82
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_82:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq 24(%r8), %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq 24(%r11), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_83
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_83:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -136(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_84
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_84:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_85
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_85:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_86
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_86:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_87
	movq $60, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_87:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r11), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq %r15, %rax
	movq -112(%rbp), %r15
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r13), %r15
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r15
	popq %rax
	movq %rax, 24(%r15)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -112(%rbp)
	pushq %r15
	pushq %rbx
	call *-112(%rbp)
	addq $16, %rsp
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	movq 24(%rsi), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq 24(%r9), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq 24(%rsi), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq 24(%r14), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq 24(%r15), %rax
	movq 24(%r10), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq 24(%r12), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_88
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_88:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %rdx
	movq %rdx, -144(%rbp)
	negq -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	negq -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	negq -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	negq -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq 24(%r13), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_89
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_89:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_90
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_90:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq -136(%rbp), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdx
	movq %rdx, -144(%rbp)
	negq -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq %rax, -136(%rbp)
	movq -144(%rbp), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq 24(%r10), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_91
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_91:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq -136(%rbp), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -136(%rbp)
	addq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq 24(%r14), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_92
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_92:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_93
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_93:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq 24(%r14), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_94
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_94:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_95
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_95:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -144(%rbp)
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	movq $0, -152(%rbp)
	movq -144(%rbp), %rdx
	pushq %rax
	movq -152(%rbp), %rax
	cmpq -152(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -152(%rbp)
	popq %rax
	xorq $1, -152(%rbp)
	cmpq $1, -152(%rbp)
	je .Main.main_96
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_96:
	cltq
	cqto
	idivq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq -136(%rbp), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	addq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq 24(%rcx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_97
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_97:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_98
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_98:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%r13), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_99
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_99:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_100
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_100:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_101
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_101:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_102
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_102:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_103
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_103:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_104
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_104:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_105
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_105:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -128(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_106
	movq $63, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_106:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -112(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -112(%rbp)
	popq %rax
	movq -112(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq -112(%rbp)
	pushq %rbx
	call *-128(%rbp)
	addq $16, %rsp
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rax
	movq 24(%r12), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -104(%rbp)
	negq -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	subq -104(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -104(%rbp)
	subq -104(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq 24(%r15), %rax
	subq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq 24(%r14), %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -16(%rbp)
	imulq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -16(%rbp)
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq 24(%r12), %rax
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq $12, -104(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -112(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_107
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_107:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rsi), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r11), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_108
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_108:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdx
	movq %rdx, -112(%rbp)
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -128(%rbp)
	movq 24(%r15), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_109
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_109:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_110
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_110:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r13), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -104(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -112(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_111
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_111:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq 24(%r12), %rax
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	addq -104(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	subq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq $12, -112(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_112
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_112:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r9), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_113
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_113:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -104(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -104(%rbp)
	addq -104(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq %rax, -16(%rbp)
	shlq $32, -16(%rbp)
	sarq $32, -16(%rbp)
	movq $12, -104(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -112(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_114
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_114:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r11), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq 24(%rsi), %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -104(%rbp), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -112(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_115
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_115:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -112(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_116
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_116:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -104(%rbp)
	movq -104(%rbp), %rdx
	movq %rdx, -104(%rbp)
	movq $0, -112(%rbp)
	movq -104(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_117
	movq $66, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_117:
	cltq
	cqto
	idivq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq -16(%rbp), %rax
	movq -104(%rbp), %rdx
	movq %rdx, -16(%rbp)
	subq -16(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -16(%rbp)
	popq %rax
	movq -16(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -104(%rbp)
	pushq -16(%rbp)
	pushq %rbx
	call *-104(%rbp)
	addq $16, %rsp
	movq 24(%r12), %rax
	movq 24(%r14), %rdx
	movq %rdx, -104(%rbp)
	imulq -104(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -104(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -104(%rbp)
	shlq $32, -104(%rbp)
	sarq $32, -104(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -112(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r10), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -128(%rbp)
	movq 24(%r10), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_118
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_118:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq 24(%r11), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_119
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_119:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq $12, -128(%rbp)
	movq 24(%r12), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_120
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_120:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -112(%rbp), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -112(%rbp)
	subq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rsi), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	addq -112(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	negq -112(%rbp)
	shlq $32, -112(%rbp)
	sarq $32, -112(%rbp)
	movq %rax, -8(%rbp)
	movq -112(%rbp), %rax
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -112(%rbp)
	movq 24(%r10), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_121
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_121:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r14), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -112(%rbp)
	imulq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -112(%rbp)
	movq 24(%r12), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_122
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_122:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	negq -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq $12, -112(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq $0, -112(%rbp)
	movq -48(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_123
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_123:
	cltq
	cqto
	idivq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -48(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq $0, -112(%rbp)
	movq -48(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_124
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_124:
	cltq
	cqto
	idivq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -48(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq $0, -112(%rbp)
	movq -48(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_125
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_125:
	cltq
	cqto
	idivq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	addq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	imulq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	movq 24(%rdi), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	imulq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $12, -24(%rbp)
	movq 24(%r14), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq $0, -48(%rbp)
	movq -24(%rbp), %rdx
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
	je .Main.main_126
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_126:
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r10), %rdx
	movq %rdx, -48(%rbp)
	imulq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	movq $12, -112(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -112(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq $0, -128(%rbp)
	movq -112(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_127
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_127:
	cltq
	cqto
	idivq -112(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -48(%rbp)
	subq %rax, -48(%rbp)
	shlq $32, -48(%rbp)
	sarq $32, -48(%rbp)
	movq 24(%r9), %rax
	movq 24(%r11), %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r9
	movq $0, -112(%rbp)
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %r9
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_128
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_128:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %r9
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -48(%rbp)
	movq 24(%r15), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq $0, -112(%rbp)
	movq -48(%rbp), %rdx
	pushq %rax
	movq -112(%rbp), %rax
	cmpq -112(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -112(%rbp)
	popq %rax
	xorq $1, -112(%rbp)
	cmpq $1, -112(%rbp)
	je .Main.main_129
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_129:
	cltq
	cqto
	idivq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -24(%rbp), %rax
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %r9
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -8(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq $0, -24(%rbp)
	movq -8(%rbp), %rdx
	pushq %rax
	movq -24(%rbp), %rax
	cmpq -24(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -24(%rbp)
	popq %rax
	xorq $1, -24(%rbp)
	cmpq $1, -24(%rbp)
	je .Main.main_130
	movq $69, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_130:
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -104(%rbp), %rax
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq 24(%r12), %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq 24(%r12), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rsi), %rdx
	movq %rdx, -8(%rbp)
	imulq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -8(%rbp)
	negq -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	imulq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq %r9, %rax
	movq -8(%rbp), %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r9
	popq %rax
	movq %rax, 24(%r9)
	movq %r9, -104(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r9
	pushq -104(%rbp)
	pushq %rbx
	call *%r9
	addq $16, %rsp
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r11), %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r9
	popq %rax
	movq %rax, 24(%r9)
	movq %r9, -112(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r9
	pushq -112(%rbp)
	pushq %rbx
	call *%r9
	addq $16, %rsp
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq 24(%rcx), %r12
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $12, -8(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq $0, -16(%rbp)
	movq -8(%rbp), %rdx
	pushq %rax
	movq -16(%rbp), %rax
	cmpq -16(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -16(%rbp)
	popq %rax
	xorq $1, -16(%rbp)
	cmpq $1, -16(%rbp)
	je .Main.main_131
	movq $75, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_131:
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq 24(%r14), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	negq -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq %r12, %rax
	movq -8(%rbp), %r12
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r9, %rax
	movq 24(%rsi), %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r9
	popq %rax
	movq %rax, 24(%r9)
	movq %r9, -16(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r9
	pushq -16(%rbp)
	pushq %rbx
	call *%r9
	addq $16, %rsp
	movq 24(%rcx), %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r9
	popq %rax
	movq %rax, 24(%r9)
	movq %r9, -48(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r9
	pushq -48(%rbp)
	pushq %rbx
	call *%r9
	addq $16, %rsp
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq 24(%rdi), %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq %r9, %rax
	movq %r12, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r9
	popq %rax
	movq %rax, 24(%r9)
	movq %r9, %r12
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r9
	pushq %r12
	pushq %rbx
	call *%r9
	addq $16, %rsp
	movq 24(%r14), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r9
	popq %rax
	movq %rax, 24(%r9)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -8(%rbp)
	pushq %r9
	pushq %rbx
	call *-8(%rbp)
	addq $16, %rsp
	movq $12, -8(%rbp)
	movq 24(%rsi), %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq $0, -24(%rbp)
	movq -8(%rbp), %rdx
	pushq %rax
	movq -24(%rbp), %rax
	cmpq -24(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -24(%rbp)
	popq %rax
	xorq $1, -24(%rbp)
	cmpq $1, -24(%rbp)
	je .Main.main_132
	movq $87, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_132:
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq $0, -24(%rbp)
	movq -8(%rbp), %rdx
	pushq %rax
	movq -24(%rbp), %rax
	cmpq -24(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -24(%rbp)
	popq %rax
	xorq $1, -24(%rbp)
	cmpq $1, -24(%rbp)
	je .Main.main_133
	movq $87, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_133:
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -8(%rbp)
	popq %rax
	movq -8(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -24(%rbp)
	pushq -8(%rbp)
	pushq %rbx
	call *-24(%rbp)
	addq $16, %rsp
	movq %r8, -48(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -24(%rbp)
	pushq -48(%rbp)
	pushq %rbx
	call *-24(%rbp)
	addq $16, %rsp
	movq %rdi, -56(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -24(%rbp)
	pushq -56(%rbp)
	pushq %rbx
	call *-24(%rbp)
	addq $16, %rsp
	movq $12, -24(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq $0, -48(%rbp)
	movq -24(%rbp), %rdx
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
	je .Main.main_134
	movq $96, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_134:
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	call Int.new
	movq -24(%rbp), %rdx
	movq %rdx, 24(%rax)
	movq %rax, -104(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -24(%rbp)
	pushq -104(%rbp)
	pushq %rbx
	call *-24(%rbp)
	addq $16, %rsp
	movq 24(%r8), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq $0, -48(%rbp)
	movq -24(%rbp), %rdx
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
	je .Main.main_135
	movq $99, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_135:
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	call Int.new
	movq -24(%rbp), %rdx
	movq %rdx, 24(%rax)
	movq %rax, -72(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -24(%rbp)
	pushq -72(%rbp)
	pushq %rbx
	call *-24(%rbp)
	addq $16, %rsp
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -24(%rbp)
	movq 24(%r10), %rax
	subq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq 24(%rcx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	addq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -48(%rbp)
	imulq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r11), %rdx
	movq %rdx, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -56(%rbp)
	imulq -56(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -56(%rbp)
	movq 24(%r13), %rax
	addq %rax, -56(%rbp)
	shlq $32, -56(%rbp)
	sarq $32, -56(%rbp)
	movq -48(%rbp), %rax
	movq -56(%rbp), %rdx
	movq %rdx, -48(%rbp)
	imulq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -48(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq $0, -56(%rbp)
	movq -48(%rbp), %rdx
	pushq %rax
	movq -56(%rbp), %rax
	cmpq -56(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -56(%rbp)
	popq %rax
	xorq $1, -56(%rbp)
	cmpq $1, -56(%rbp)
	je .Main.main_136
	movq $102, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_136:
	cltq
	cqto
	idivq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	subq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq $12, -48(%rbp)
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq $0, -56(%rbp)
	movq -48(%rbp), %rdx
	pushq %rax
	movq -56(%rbp), %rax
	cmpq -56(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -56(%rbp)
	popq %rax
	xorq $1, -56(%rbp)
	cmpq $1, -56(%rbp)
	je .Main.main_137
	movq $102, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_137:
	cltq
	cqto
	idivq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -48(%rbp)
	imulq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -48(%rbp)
	movq -48(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq $0, -56(%rbp)
	movq -48(%rbp), %rdx
	pushq %rax
	movq -56(%rbp), %rax
	cmpq -56(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -56(%rbp)
	popq %rax
	xorq $1, -56(%rbp)
	cmpq $1, -56(%rbp)
	je .Main.main_138
	movq $102, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_138:
	cltq
	cqto
	idivq -48(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -48(%rbp)
	movq -24(%rbp), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -24(%rbp)
	addq -24(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq 24(%r11), %rax
	subq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -24(%rbp)
	shlq $32, -24(%rbp)
	sarq $32, -24(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	imulq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	call Int.new
	movq -24(%rbp), %rdx
	movq %rdx, 24(%rax)
	movq %rax, -56(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -24(%rbp)
	pushq -56(%rbp)
	pushq %rbx
	call *-24(%rbp)
	addq $16, %rsp
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -24(%rbp)
	imulq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq $0, -48(%rbp)
	movq -24(%rbp), %rdx
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
	je .Main.main_139
	movq $105, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_139:
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	subq -24(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, -24(%rbp)
	popq %rax
	movq -24(%rbp), %rdx
	movq %rax, 24(%rdx)
	movq -24(%rbp), %rdx
	movq %rdx, -48(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -24(%rbp)
	pushq -48(%rbp)
	pushq %rbx
	call *-24(%rbp)
	addq $16, %rsp
	movq -72(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq -24(%rbp)
	pushq %rbx
	call *-128(%rbp)
	addq $16, %rsp
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r11), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	movq -136(%rbp), %rdx
	addq %rdx, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq -136(%rbp), %rdx
	addq %rdx, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq 24(%rcx), %rdx
	movq %rdx, -128(%rbp)
	movq -128(%rbp), %rdx
	subq %rdx, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq 24(%rdi), %rdx
	movq %rdx, -136(%rbp)
	movq -136(%rbp), %rdx
	subq %rdx, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rdi), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_140
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_140:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%rsi), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_141
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_141:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rax
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_142
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_142:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%r14), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_143
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_143:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq 24(%r12), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_144
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_144:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq 24(%rsi), %rax
	subq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	movq 24(%r12), %rdx
	movq %rdx, -136(%rbp)
	addq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r13), %rdx
	movq %rdx, -136(%rbp)
	subq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	addq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq $12, -136(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_145
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_145:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	movq 24(%r13), %r13
	addq %r13, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %r13
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq 24(%r12), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_146
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_146:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq $0, -136(%rbp)
	movq -128(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_147
	movq $111, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_147:
	cltq
	cqto
	idivq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq %r13, %rax
	movq -128(%rbp), %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rdi), %r13
	subq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r13
	popq %rax
	movq %rax, 24(%r13)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -128(%rbp)
	pushq %r13
	pushq %rbx
	call *-128(%rbp)
	addq $16, %rsp
	movq 24(%r8), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r14), %rdx
	movq %rdx, -128(%rbp)
	subq -128(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq 24(%r10), %rax
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq 24(%r15), %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq 24(%r8), %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -152(%rbp)
	imulq -152(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -144(%rbp), %rdx
	movq %rdx, -144(%rbp)
	subq %rax, -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -152(%rbp)
	subq -152(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %r15
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -152(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -152(%rbp), %rdx
	movq %rdx, -152(%rbp)
	addq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq -152(%rbp), %rdx
	movq %rdx, -152(%rbp)
	movq 24(%rcx), %rax
	subq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq -152(%rbp), %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -152(%rbp)
	addq -152(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -160(%rbp)
	negq -160(%rbp)
	shlq $32, -160(%rbp)
	sarq $32, -160(%rbp)
	movq %rax, -152(%rbp)
	movq -160(%rbp), %rax
	addq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq $12, -160(%rbp)
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -160(%rbp), %rdx
	movq %rdx, -160(%rbp)
	movq $0, -168(%rbp)
	movq -160(%rbp), %rdx
	pushq %rax
	movq -168(%rbp), %rax
	cmpq -168(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -168(%rbp)
	popq %rax
	xorq $1, -168(%rbp)
	cmpq $1, -168(%rbp)
	je .Main.main_148
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_148:
	cltq
	cqto
	idivq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -160(%rbp)
	imulq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -160(%rbp)
	imulq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -152(%rbp), %rdx
	movq %rdx, -152(%rbp)
	subq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq $12, -160(%rbp)
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -160(%rbp), %rdx
	movq %rdx, -160(%rbp)
	movq $0, -168(%rbp)
	movq -160(%rbp), %rdx
	pushq %rax
	movq -168(%rbp), %rax
	cmpq -168(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -168(%rbp)
	popq %rax
	xorq $1, -168(%rbp)
	cmpq $1, -168(%rbp)
	je .Main.main_149
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_149:
	cltq
	cqto
	idivq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -160(%rbp)
	imulq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -160(%rbp)
	movq -152(%rbp), %rax
	movq -160(%rbp), %rdx
	movq %rdx, -152(%rbp)
	addq -152(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -152(%rbp)
	subq -152(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -152(%rbp)
	movq 24(%r11), %rax
	addq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq 24(%r8), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -160(%rbp)
	movq -160(%rbp), %rdx
	movq %rdx, -160(%rbp)
	movq $0, -168(%rbp)
	movq -160(%rbp), %rdx
	pushq %rax
	movq -168(%rbp), %rax
	cmpq -168(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -168(%rbp)
	popq %rax
	xorq $1, -168(%rbp)
	cmpq $1, -168(%rbp)
	je .Main.main_150
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_150:
	cltq
	cqto
	idivq -160(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -152(%rbp), %rdx
	movq %rdx, -152(%rbp)
	subq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq -152(%rbp), %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -152(%rbp)
	addq -152(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -152(%rbp)
	movq 24(%rsi), %rax
	addq %rax, -152(%rbp)
	shlq $32, -152(%rbp)
	sarq $32, -152(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -152(%rbp), %rdx
	movq %rdx, -152(%rbp)
	imulq -152(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -152(%rbp)
	movq %r15, %rax
	movq -152(%rbp), %r15
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %rdx
	movq 24(%rdx), %r15
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	negq %r15
	shlq $32, %r15
	sarq $32, %r15
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r15
	movq $0, -120(%rbp)
	pushq %rax
	movq -120(%rbp), %rax
	cmpq -120(%rbp), %r15
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -120(%rbp)
	popq %rax
	xorq $1, -120(%rbp)
	cmpq $1, -120(%rbp)
	je .Main.main_151
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_151:
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r15
	movq $0, -120(%rbp)
	pushq %rax
	movq -120(%rbp), %rax
	cmpq -120(%rbp), %r15
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -120(%rbp)
	popq %rax
	xorq $1, -120(%rbp)
	cmpq $1, -120(%rbp)
	je .Main.main_152
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_152:
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r13), %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq -144(%rbp), %r13
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rcx), %r15
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r13, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r13
	movq $0, %r15
	cmpq %r15, %r13
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_153
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_153:
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %r13
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r13, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $12, %r15
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
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
	je .Main.main_154
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_154:
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r15
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
	je .Main.main_155
	movq $114, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_155:
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq %r13, %rax
	movq %r15, %r13
	subq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %r13
	addq %r13, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %r15
	negq %r15
	shlq $32, %r15
	sarq $32, %r15
	movq 24(%rcx), %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r15, %rcx
	addq %r13, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rax, %r13
	movq %rcx, %rax
	addq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq 24(%rdi), %rax
	movq %r13, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rcx
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %r13
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rcx
	pushq %r13
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $12, %rcx
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rax
	movq $0, %r15
	cmpq %r15, %rcx
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_156
	movq $117, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_156:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	call Int.new
	movq %rcx, 24(%rax)
	movq %rax, -120(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rcx
	pushq -120(%rbp)
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq 24(%rsi), %rax
	movq 24(%r14), %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, -24(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rcx
	pushq -24(%rbp)
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq -48(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rcx
	pushq -24(%rbp)
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $12, %rcx
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	movq $0, %r15
	cmpq %r15, %rcx
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_157
	movq $126, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_157:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq 24(%r13), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r13
	movq $0, %r15
	cmpq %r15, %r13
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_158
	movq $126, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_158:
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq %rcx, %rax
	movq %r13, %rcx
	addq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r13
	pushq %rcx
	pushq %rbx
	call *%r13
	addq $16, %rsp
	movq 24(%r12), %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %r12
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r12
	popq %rax
	movq %rax, 24(%r12)
	movq %r12, -112(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r12
	pushq -112(%rbp)
	pushq %rbx
	call *%r12
	addq $16, %rsp
	movq $12, %r12
	movq 24(%rsi), %rax
	movq $0, %r13
	cmpq %r13, %r12
	movq $0, %r13
	movq $1, %rdx
	cmoveq %rdx, %r13
	xorq $1, %r13
	cmpq $1, %r13
	je .Main.main_159
	movq $132, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_159:
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq 24(%r9), %rax
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r12
	popq %rax
	movq %rax, 24(%r12)
	movq %r12, %r15
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r12
	pushq %r15
	pushq %rbx
	call *%r12
	addq $16, %rsp
	movq -24(%rbp), %r13
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r12
	pushq %r13
	pushq %rbx
	call *%r12
	addq $16, %rsp
	movq %rdi, -8(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r12
	pushq -8(%rbp)
	pushq %rbx
	call *%r12
	addq $16, %rsp
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq 24(%r14), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rdi), %rdx
	movq %rdx, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq 24(%r11), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	negq -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	imulq -128(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -128(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -128(%rbp), %rdx
	movq %rdx, -128(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rax
	movq 24(%r9), %rdx
	movq %rdx, -136(%rbp)
	addq -136(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r11), %rdx
	movq %rdx, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -144(%rbp)
	negq -144(%rbp)
	shlq $32, -144(%rbp)
	sarq $32, -144(%rbp)
	movq %rax, -136(%rbp)
	movq -144(%rbp), %rax
	addq %rax, -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq $12, -144(%rbp)
	movq -120(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -144(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_160
	movq $141, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_160:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -136(%rbp), %rdx
	movq %rdx, -120(%rbp)
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq 24(%r9), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -56(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -136(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_161
	movq $141, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_161:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -64(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -136(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq -128(%rbp), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	addq -120(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r9), %rdx
	movq %rdx, -120(%rbp)
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq 24(%r13), %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $12, -120(%rbp)
	movq 24(%r9), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_162
	movq $141, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_162:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_163
	movq $141, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_163:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r12, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %rax, %r12
	movq -120(%rbp), %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $12, -120(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_164
	movq $141, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_164:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq %r12, %rax
	movq -120(%rbp), %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rcx), %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -72(%rbp), %rdx
	movq 24(%rdx), %r12
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r12, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq %rax, %r12
	movq -120(%rbp), %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq 24(%rcx), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	negq -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%rsi), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq $0, -128(%rbp)
	movq -120(%rbp), %rdx
	pushq %rax
	movq -128(%rbp), %rax
	cmpq -128(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -128(%rbp)
	popq %rax
	xorq $1, -128(%rbp)
	cmpq $1, -128(%rbp)
	je .Main.main_165
	movq $141, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_165:
	cltq
	cqto
	idivq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq %r12, %rax
	movq -120(%rbp), %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r12
	popq %rax
	movq %rax, 24(%r12)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rdx
	movq %rdx, -120(%rbp)
	pushq %r12
	pushq %rbx
	call *-120(%rbp)
	addq $16, %rsp
	movq 24(%r15), %rax
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	imulq -120(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -120(%rbp)
	movq 24(%r14), %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq -120(%rbp), %rdx
	movq %rdx, -120(%rbp)
	movq 24(%r12), %rax
	subq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq 24(%r9), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdx
	movq %rdx, -128(%rbp)
	subq %rax, -128(%rbp)
	shlq $32, -128(%rbp)
	sarq $32, -128(%rbp)
	movq 24(%r14), %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%rsi), %rdx
	movq %rdx, -144(%rbp)
	imulq -144(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -144(%rbp)
	movq -136(%rbp), %rax
	movq -144(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	addq -80(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq 24(%rcx), %rax
	subq %rax, -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq $12, -136(%rbp)
	movq 24(%rsi), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_166
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_166:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_167
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_167:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	negq -136(%rbp)
	shlq $32, -136(%rbp)
	sarq $32, -136(%rbp)
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	imulq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_168
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_168:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -136(%rbp)
	movq -136(%rbp), %rdx
	movq %rdx, -136(%rbp)
	movq $0, -144(%rbp)
	movq -136(%rbp), %rdx
	pushq %rax
	movq -144(%rbp), %rax
	cmpq -144(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -144(%rbp)
	popq %rax
	xorq $1, -144(%rbp)
	cmpq $1, -144(%rbp)
	je .Main.main_169
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_169:
	cltq
	cqto
	idivq -136(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -136(%rbp)
	movq -80(%rbp), %rax
	movq -136(%rbp), %rdx
	movq %rdx, -80(%rbp)
	subq -80(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r14), %rdx
	movq %rdx, -80(%rbp)
	negq -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq %rax, %r14
	movq -80(%rbp), %rax
	addq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -80(%rbp)
	movq 24(%r8), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -136(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_170
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_170:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -80(%rbp)
	movq 24(%r11), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -136(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_171
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_171:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -80(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -136(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_172
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_172:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -80(%rbp)
	movq 24(%r8), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -136(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -136(%rbp), %rax
	cmpq -136(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -136(%rbp)
	popq %rax
	xorq $1, -136(%rbp)
	cmpq $1, -136(%rbp)
	je .Main.main_173
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_173:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq %r14, %rax
	movq -80(%rbp), %r14
	addq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %r14
	imulq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r14
	movq 24(%rdi), %rax
	addq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -96(%rbp), %rdx
	movq 24(%rdx), %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	subq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %r14
	addq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r14
	movq $0, -80(%rbp)
	pushq %rax
	movq -80(%rbp), %rax
	cmpq -80(%rbp), %r14
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -80(%rbp)
	popq %rax
	xorq $1, -80(%rbp)
	cmpq $1, -80(%rbp)
	je .Main.main_174
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_174:
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq -128(%rbp), %r14
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %r14, %rax
	movq 24(%r9), %r14
	addq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r11), %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	addq %r14, -80(%rbp)
	shlq $32, -80(%rbp)
	sarq $32, -80(%rbp)
	movq %rax, %r14
	movq -80(%rbp), %rax
	addq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq 24(%r13), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -96(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -96(%rbp), %rax
	cmpq -96(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -96(%rbp)
	popq %rax
	xorq $1, -96(%rbp)
	cmpq $1, -96(%rbp)
	je .Main.main_175
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_175:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -80(%rbp)
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	subq -80(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -80(%rbp)
	subq -80(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -80(%rbp)
	movq -80(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq $0, -96(%rbp)
	movq -80(%rbp), %rdx
	pushq %rax
	movq -96(%rbp), %rax
	cmpq -96(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -96(%rbp)
	popq %rax
	xorq $1, -96(%rbp)
	cmpq $1, -96(%rbp)
	je .Main.main_176
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_176:
	cltq
	cqto
	idivq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r9), %rdx
	movq %rdx, -80(%rbp)
	imulq -80(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq 24(%r9), %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %r14, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %r14
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $12, -80(%rbp)
	movq 24(%r11), %rax
	movq -80(%rbp), %r11
	movq $0, -80(%rbp)
	pushq %rax
	movq -80(%rbp), %rax
	cmpq -80(%rbp), %r11
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -80(%rbp)
	popq %rax
	xorq $1, -80(%rbp)
	cmpq $1, -80(%rbp)
	je .Main.main_177
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_177:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, %r11
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $12, %r14
	movq 24(%r15), %rax
	movq $0, -80(%rbp)
	pushq %rax
	movq -80(%rbp), %rax
	cmpq -80(%rbp), %r14
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -80(%rbp)
	popq %rax
	xorq $1, -80(%rbp)
	cmpq $1, -80(%rbp)
	je .Main.main_178
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_178:
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %r14
	imulq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r14
	movq $0, -80(%rbp)
	pushq %rax
	movq -80(%rbp), %rax
	cmpq -80(%rbp), %r14
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -80(%rbp)
	popq %rax
	xorq $1, -80(%rbp)
	cmpq $1, -80(%rbp)
	je .Main.main_179
	movq $144, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_179:
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r14
	movq %r11, %rax
	movq %r14, %r11
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %r11
	popq %rax
	movq %rax, 24(%r11)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r14
	pushq %r11
	pushq %rbx
	call *%r14
	addq $16, %rsp
	movq -24(%rbp), %rdx
	movq %rdx, -80(%rbp)
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %r14
	pushq -80(%rbp)
	pushq %rbx
	call *%r14
	addq $16, %rsp
	movq 24(%r13), %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -96(%rbp)
	imulq -96(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -96(%rbp)
	addq %rax, -96(%rbp)
	shlq $32, -96(%rbp)
	sarq $32, -96(%rbp)
	movq -48(%rbp), %rdx
	movq 24(%rdx), %rdx
	movq %rdx, -120(%rbp)
	movq -88(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, -120(%rbp)
	shlq $32, -120(%rbp)
	sarq $32, -120(%rbp)
	movq 24(%r10), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -56(%rbp), %rdx
	movq 24(%rdx), %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq 24(%rcx), %rax
	subq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq 24(%r11), %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq 24(%r9), %rax
	movq 24(%r9), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq -32(%rbp), %rdx
	movq 24(%rdx), %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq -72(%rbp), %rdx
	movq 24(%rdx), %rax
	movq -64(%rbp), %rdx
	movq 24(%rdx), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq %r10, %rax
	movq %r11, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -48(%rbp), %rdx
	movq 24(%rdx), %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq 24(%rdx), %r10
	subq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -120(%rbp), %r10
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq -104(%rbp), %rdx
	movq 24(%rdx), %rax
	movq 24(%r13), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r11
	movq $0, -32(%rbp)
	pushq %rax
	movq -32(%rbp), %rax
	cmpq -32(%rbp), %r11
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -32(%rbp)
	popq %rax
	xorq $1, -32(%rbp)
	cmpq $1, -32(%rbp)
	je .Main.main_180
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_180:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r11
	movq $0, -32(%rbp)
	pushq %rax
	movq -32(%rbp), %rax
	cmpq -32(%rbp), %r11
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -32(%rbp)
	popq %rax
	xorq $1, -32(%rbp)
	cmpq $1, -32(%rbp)
	je .Main.main_181
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_181:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r11
	movq $0, -32(%rbp)
	pushq %rax
	movq -32(%rbp), %rax
	cmpq -32(%rbp), %r11
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -32(%rbp)
	popq %rax
	xorq $1, -32(%rbp)
	cmpq $1, -32(%rbp)
	je .Main.main_182
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_182:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq %r10, %rax
	movq %r11, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_183
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_183:
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq -96(%rbp), %rax
	subq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %r10
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $12, %r11
	movq 24(%r13), %rax
	movq $0, %r13
	cmpq %r13, %r11
	movq $0, %r13
	movq $1, %rdx
	cmoveq %rdx, %r13
	xorq $1, %r13
	cmpq $1, %r13
	je .Main.main_184
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_184:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r11
	movq $0, %r13
	cmpq %r13, %r11
	movq $0, %r13
	movq $1, %rdx
	cmoveq %rdx, %r13
	xorq $1, %r13
	cmpq $1, %r13
	je .Main.main_185
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_185:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq 24(%rsi), %rax
	movq -24(%rbp), %rdx
	movq 24(%rdx), %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq 24(%rdi), %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq 24(%r8), %rax
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rdi
	movq $0, %r11
	cmpq %r11, %rdi
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_186
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_186:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rdi
	movq $0, %r11
	cmpq %r11, %rdi
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_187
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_187:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rdi
	movq $0, %r11
	cmpq %r11, %rdi
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_188
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_188:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, %rdi
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $12, %r10
	movq 24(%r9), %rax
	movq %r10, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_189
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_189:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r8), %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $12, %r8
	movq -8(%rbp), %rdx
	movq 24(%rdx), %rax
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_190
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_190:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq -80(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq -112(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %rdi
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
	je .Main.main_191
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_191:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r15), %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq -16(%rbp), %rdx
	movq 24(%rdx), %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq 24(%r12), %rdi
	subq %rdi, %rax
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
	je .Main.main_192
	movq $150, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_192:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq -40(%rbp), %rdx
	movq 24(%rdx), %rax
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %r14, %rdi
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq 24(%rsi), %rsi
	movq 24(%rcx), %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq 24(%r15), %rax
	movq %rsi, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq %rdi, %rax
	addq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	pushq %rax
	call Int.new
	movq %rax, %rcx
	popq %rax
	movq %rax, 24(%rcx)
	movq %rcx, %r15
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 56(%rdx), %rcx
	pushq %r15
	pushq %rbx
	call *%rcx
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
