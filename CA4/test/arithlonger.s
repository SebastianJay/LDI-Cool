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
	.globl	String.cmp
	.type	String.cmp, @function
String.cmp:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	16(%rbp), %rdi
	movq	24(%rbp), %rsi
	movq	24(%rdi), %rdi
	movq	24(%rsi), %rsi
	call	strcmp
	shlq $32, %rax # strcmp returns a 32bit int, sign extend
	sarq $32, %rax
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
	leave
	ret
	.size	String.cmp, .-String.cmp
	.p2align 4,,15
	.globl	String.concat
	.type	String.concat, @function
String.concat:
.LFB77:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
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
	movq	16(%rbp), %rdi
	movq	24(%rbp), %rsi
	movq	%rsi, %r12
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
	popq	%rbp
	ret
	.cfi_endproc
.LFE77:
	.size	String.concat, .-String.concat
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
	pushq %rbx
	pushq %rcx
	pushq %rsi
	pushq %rdi
	pushq %r8
	pushq %r9
	movq 16(%rbp), %rbx
	movq $2, %rax
	movq $2, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq $3, %rax
	movq $4, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_1
	movq $14, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $35, %rsi
	movq $90, %rcx
	subq %rcx, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rax, %rcx
	movq %rsi, %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $0, %rsi
	movq $44, %rdi
	movq $22, %rax
	movq $11, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_2
	movq $4, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_2:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_3
	movq $2, %rcx
	movq $2, %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $2, %rax
	movq $2, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main.main_4
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
	jmp .Main.main_5
.Main.main_4:
	movq $2, %rax
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
.Main.main_5:
	jmp .Main.main_6
.Main.main_3:
	movq $3, %rax
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
.Main.main_6:
	jmp .Main.main_7
.Main.main_1:
	movq $4, %rax
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
.Main.main_7:
	popq %r9
	popq %r8
	popq %rdi
	popq %rsi
	popq %rcx
	popq %rbx
	leave
	ret
	.size Main.main, .-Main.main
