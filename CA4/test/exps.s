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
	.globl	Object.cmp
	.type	Object.cmp, @function
Object.cmp:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rcx
	movq	16(%rbp), %rax
	movq	24(%rbp), %rbx
	andq	%rax, %rax
	jz	.Object.cmp_1
	andq	%rbx, %rbx
	jz	.Object.cmp_1
	movq	0(%rax), %rcx
	movq	0(%rbx), %rdx
	cmpq	%rcx, %rdx
	jne	.Object.cmp_1
	cmpq	$1, %rcx
	je	.Object.cmp_2
	cmpq	$4, %rcx
	je	.Object.cmp_2
	cmpq	$2, %rcx
	je	.Object.cmp_3
.Object.cmp_1:
	cmpq	%rax, %rbx
	movq	$1, %rax
	movq	$0, %rdx
	cmoveq	%rdx, %rax
	jmp .Object.cmp_4
.Object.cmp_2:
	movq	24(%rax), %rax
	movq	24(%rbx), %rbx
	subq	%rbx, %rax
	jmp .Object.cmp_4
.Object.cmp_3:
	pushq	%rbx
	pushq	%rax
	call String.cmp
.Object.cmp_4:
	popq	%rcx
	popq	%rbx
	leave
	ret
	.size	Object.cmp, .-Object.cmp
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
.string6_l:
	.string "\\n"
.string6:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string6_l
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
	.globl main
	.type main, @function
main:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rbx
	pushq %rcx
.main:
	pushq %rax
	call Main.new
	movq %rax, %rbx
	popq %rax
	cmpq $0, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je ..main_1
	movq $0, %rsi
	movq $.string1_l, %rdi
	call out_error
..main_1:
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 72(%rdx), %rcx
	pushq %rbx
	call *%rcx
	addq $8, %rsp
	popq %rcx
	popq %rbx
	leave
	ret
	.size main, .-main
	.globl Main.main
	.type Main.main, @function
Main.main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
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
	movq $34533, %rax
	movq $48880, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq $50538, %rax
	movq $12757, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $46509, %rax
	movq %rax, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $3306, %rdi
	movq $61695, %rax
	movq $50213, %r8
	movq $0, %r9
	cmpq %r9, %r8
	movq $0, %r9
	movq $1, %rdx
	cmoveq %rdx, %r9
	xorq $1, %r9
	cmpq $1, %r9
	je .Main.main_1
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_1:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq $8423, %rax
	movq $34498, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $56453, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $60575, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $53667, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_2
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_2:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $60858, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $2438, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_3
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_3:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $34422, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $18841, %rax
	movq $54759, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_4
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_4:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $17815, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_5
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_5:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $58210, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $28379, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_6
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_6:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $12660, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_7
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_7:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $19369, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $55318, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $48608, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $3828, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_8
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_8:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $2739, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_9
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_9:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $8340, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $45807, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $29181, %r8
	movq %r8, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %rax, %r8
	movq %r9, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $51233, %rax
	movq $33158, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_10
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_10:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $47308, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_11
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_11:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $229, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_12
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_12:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $25241, %rax
	movq $13257, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $840, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_13
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_13:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $62420, %rax
	movq $31735, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $17376, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $9569, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $54460, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $28260, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $18310, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $14379, %rax
	movq $61731, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_14
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_14:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $20908, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $59714, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_15
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_15:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $5456, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_16
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_16:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $46032, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_17
	movq $3, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_17:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	addq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $34526, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rcx
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rsi
	pushq %rcx
	pushq %rbx
	call *%rsi
	addq $16, %rsp
	movq $2730, %rax
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
	movq $.string6, %rcx
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rsi
	pushq %rcx
	pushq %rbx
	call *%rsi
	addq $16, %rsp
	movq $13765, %rax
	movq $5137, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $3850, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_18
	movq $7, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_18:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rcx
	pushq %rsi
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $21018, %rax
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
	movq $.string6, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rcx
	pushq %rsi
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $16210, %rcx
	movq $23599, %rax
	subq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $8997, %rax
	movq $30996, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_19
	movq $11, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_19:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $27231, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_20
	movq $11, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_20:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $15755, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $23071, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_21
	movq $11, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_21:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $62331, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rcx
	pushq %rsi
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $9856, %rax
	movq $8640, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq $11282, %rax
	movq $39523, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $57869, %rsi
	movq $49695, %rax
	movq $13131, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $18119, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $14461, %rax
	movq $15505, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33976, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $36010, %r8
	movq %r8, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $16029, %rax
	movq $19302, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_22
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_22:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $39267, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_23
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_23:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $3175, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $19020, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_24
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_24:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $16420, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_25
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_25:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $53595, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $43617, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $55348, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_26
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_26:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $8271, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $63080, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_27
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_27:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $50998, %r9
	movq %rax, %r8
	movq %r9, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $25947, %r9
	movq $22130, %rax
	movq $60913, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_28
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_28:
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $6550, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_29
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_29:
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $29011, %r10
	subq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $43604, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $46874, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $29252, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25351, %r11
	movq %rax, %r10
	movq %r11, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq %r9, %rax
	movq %r10, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_30
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_30:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $36212, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $30605, %rax
	movq $35043, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_31
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_31:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $63562, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_32
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_32:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $14901, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_33
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_33:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $46154, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $53085, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $24923, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $20995, %rax
	movq $47127, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $53587, %rax
	movq $6934, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_34
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_34:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $23915, %rax
	movq $63399, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $52290, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $52486, %rax
	movq $20968, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_35
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_35:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $37473, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_36
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_36:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $14802, %rax
	movq $39506, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_37
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_37:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33866, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $16693, %rax
	movq $2211, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	addq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $30018, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20384, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25036, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_38
	movq $13, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_38:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	addq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $38737, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rcx
	pushq %rsi
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $19322, %rax
	movq $38661, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $21514, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq $604, %rsi
	movq $21813, %rdi
	movq $25099, %r8
	movq $52033, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $34320, %r9
	movq $25316, %rax
	movq $8214, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $22802, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $5660, %r10
	subq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $10478, %r11
	movq %rax, %r10
	movq %r11, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $10464, %r11
	movq $32716, %r12
	movq $49288, %rax
	movq $5606, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq $2985, %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq $59495, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_39
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_39:
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq %r12, %rax
	movq %r13, %r12
	addq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $60127, %r13
	movq %rax, %r12
	movq %r13, %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $63664, %rax
	movq $60238, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_40
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_40:
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq $28227, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_41
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_41:
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $7429, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $50691, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq %r12, %rax
	movq %r13, %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $5411, %r13
	movq %rax, %r12
	movq %r13, %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $18444, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	movq $48391, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $58688, %r14
	movq $0, %r15
	cmpq %r15, %r14
	movq $0, %r15
	movq $1, %rdx
	cmoveq %rdx, %r15
	xorq $1, %r15
	cmpq $1, %r15
	je .Main.main_42
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_42:
	cltq
	cqto
	idivq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %r13, %rax
	movq %r14, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq $8738, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq $36519, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq $27940, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_43
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_43:
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq %r12, %rax
	movq %r13, %r12
	subq %r12, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $50929, %r13
	movq %rax, %r12
	movq %r13, %rax
	addq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r11, %rax
	movq %r12, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_44
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_44:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $47963, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $15735, %rax
	movq $932, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_45
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_45:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $27409, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_46
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_46:
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
	movq $35237, %r11
	movq %rax, %r10
	movq %r11, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $53642, %rax
	movq $21521, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq %r10, %rax
	movq %r11, %r10
	addq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $53181, %r11
	movq %rax, %r10
	movq %r11, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $24320, %rax
	movq $3520, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_47
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_47:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq %r9, %rax
	movq %r10, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $40488, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $58419, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $17975, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_48
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_48:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $43856, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_49
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_49:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $52306, %rdi
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
	je .Main.main_50
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_50:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $55626, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $11513, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_51
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_51:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	subq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $41765, %rsi
	subq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $39037, %rsi
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
	je .Main.main_52
	movq $15, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_52:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rcx
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rsi
	pushq %rcx
	pushq %rbx
	call *%rsi
	addq $16, %rsp
	movq $28968, %rax
	movq $32079, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_53
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_53:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq $64947, %rax
	movq %rax, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $38220, %rdi
	movq $48887, %rax
	movq %rax, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $7493, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $26972, %rax
	movq %rax, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $62150, %rax
	movq %rax, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $30797, %r11
	movq $3233, %r12
	movq $26083, %rax
	movq $56556, %r13
	movq $0, %r14
	cmpq %r14, %r13
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	xorq $1, %r14
	cmpq $1, %r14
	je .Main.main_54
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_54:
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	movq $55273, %r14
	movq $38801, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $17979, %r15
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $14356, %r15
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $61208, %r15
	negq %r15
	shlq $32, %r15
	sarq $32, %r15
	subq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25185, -8(%rbp)
	movq %rax, %r15
	movq -8(%rbp), %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $47041, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $65097, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	imulq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $5880, %rax
	movq $12843, -8(%rbp)
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
	je .Main.main_55
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_55:
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $38600, -8(%rbp)
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
	je .Main.main_56
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_56:
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $25834, -8(%rbp)
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	imulq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $47353, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $2951, -8(%rbp)
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
	je .Main.main_57
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_57:
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq $63252, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	subq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $35037, -16(%rbp)
	movq $56918, %rax
	movq $55662, -24(%rbp)
	movq -24(%rbp), %rdx
	movq %rdx, -24(%rbp)
	movq $0, -32(%rbp)
	movq -24(%rbp), %rdx
	pushq %rax
	movq -32(%rbp), %rax
	cmpq -32(%rbp), %rdx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	movq %rax, -32(%rbp)
	popq %rax
	xorq $1, -32(%rbp)
	cmpq $1, -32(%rbp)
	je .Main.main_58
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_58:
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -24(%rbp)
	movq -16(%rbp), %rax
	movq -24(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq $0, -24(%rbp)
	movq -16(%rbp), %rdx
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
	je .Main.main_59
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_59:
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -8(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq %rax, -8(%rbp)
	shlq $32, -8(%rbp)
	sarq $32, -8(%rbp)
	movq $15079, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $64582, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq $0, -24(%rbp)
	movq -16(%rbp), %rdx
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
	je .Main.main_60
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_60:
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $7741, -16(%rbp)
	movq -16(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq $0, -24(%rbp)
	movq -16(%rbp), %rdx
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
	je .Main.main_61
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_61:
	cltq
	cqto
	idivq -16(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	movq -16(%rbp), %rdx
	movq %rdx, -8(%rbp)
	addq -8(%rbp), %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $18422, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq %r15, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %r13, %rax
	movq %r14, %r13
	imulq %r13
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r12
	shlq $32, %r12
	sarq $32, %r12
	movq %r11, %rax
	movq %r12, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $2469, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_62
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_62:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	movq %r9, %rax
	movq %r10, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_63
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_63:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $37073, %rax
	movq $6195, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $29789, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_64
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_64:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20509, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $48672, %rax
	movq $3326, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_65
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_65:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $6765, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $15487, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $55049, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $57936, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_66
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_66:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq $1317, %rax
	movq $47218, %r10
	movq $0, %r11
	cmpq %r11, %r10
	movq $0, %r11
	movq $1, %rdx
	cmoveq %rdx, %r11
	xorq $1, %r11
	cmpq $1, %r11
	je .Main.main_67
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_67:
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq %r9, %rax
	movq %r10, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $27399, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rsi, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $30631, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_68
	movq $17, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_68:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $13076, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rcx
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rsi
	pushq %rcx
	pushq %rbx
	call *%rsi
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
	movq $38915, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_69
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_69:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq $6821, %rsi
	movq $45379, %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $48457, %rax
	movq $18781, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq $47988, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_70
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_70:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $41455, %rax
	movq $64464, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_71
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_71:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq $49119, %r8
	movq $40570, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $28147, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $15714, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_72
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_72:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq %r8, %rax
	movq %r9, %r8
	subq %r8, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $10809, %r9
	movq %rax, %r8
	movq %r9, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $48118, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20470, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $50347, %rax
	movq %rax, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $1202, %rax
	movq $51824, %r8
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
	je .Main.main_73
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_73:
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq $33161, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $18429, %r9
	movq $52820, %r10
	movq $38686, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $8022, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33788, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_74
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_74:
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
	movq $17594, %r10
	subq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $15798, %r10
	subq %r10, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $62723, %r10
	movq %r10, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %rax, %r10
	movq %r11, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $63899, %rax
	movq $18189, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_75
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_75:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $60159, %rax
	movq %rax, %r11
	negq %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $1357, %rax
	movq $9886, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $27696, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq %r11, %rax
	movq %r12, %r11
	movq $0, %r12
	cmpq %r12, %r11
	movq $0, %r12
	movq $1, %rdx
	cmoveq %rdx, %r12
	xorq $1, %r12
	cmpq $1, %r12
	je .Main.main_76
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_76:
	cltq
	cqto
	idivq %r11
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $61569, %rax
	movq $2562, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $38208, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $19892, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r10
	shlq $32, %r10
	sarq $32, %r10
	movq %r9, %rax
	movq %r10, %r9
	movq $0, %r10
	cmpq %r10, %r9
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	xorq $1, %r10
	cmpq $1, %r10
	je .Main.main_77
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_77:
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	movq $0, %r8
	cmpq %r8, %rdi
	movq $0, %r8
	movq $1, %rdx
	cmoveq %rdx, %r8
	xorq $1, %r8
	cmpq $1, %r8
	je .Main.main_78
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_78:
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $14546, %rsi
	subq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $49411, %rsi
	movq $0, %rdi
	cmpq %rdi, %rsi
	movq $0, %rdi
	movq $1, %rdx
	cmoveq %rdx, %rdi
	xorq $1, %rdi
	cmpq $1, %rdi
	je .Main.main_79
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_79:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $9508, %rax
	movq $60323, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $7258, %rsi
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
	je .Main.main_80
	movq $19, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_80:
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rcx
	pushq %rsi
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $31515, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rcx
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rsi
	pushq %rcx
	pushq %rbx
	call *%rsi
	addq $16, %rsp
	movq $51549, %rax
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
	movq $.string6, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rcx
	pushq %rsi
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $2147483647, %rax
	movq $2, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $2, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_81
	movq $25, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_81:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
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
	movq $.string6, %rsi
	movq %rbx, %rdx
	movq 8(%rdx), %rdx
	movq 64(%rdx), %rcx
	pushq %rsi
	pushq %rbx
	call *%rcx
	addq $16, %rsp
	movq $1073741824, %rax
	movq $4, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $2, %rcx
	movq $0, %rsi
	cmpq %rsi, %rcx
	movq $0, %rsi
	movq $1, %rdx
	cmoveq %rdx, %rsi
	xorq $1, %rsi
	cmpq $1, %rsi
	je .Main.main_82
	movq $27, %rsi
	movq $.string2_l, %rdi
	call out_error
.Main.main_82:
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
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
