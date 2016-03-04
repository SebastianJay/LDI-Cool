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
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movl	$1, %esi
	movl	$4096, %edi
	call	calloc
	movq	%rax, -8(%rbp)
	movq	stdin(%rip), %rdx
	movq	-8(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	fgets
	leaq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$1, %eax
	je	.L2
	movl	$0, %eax
	jmp	.L6
.L2:
	movq	-16(%rbp), %rax
	cmpq	$2147483647, %rax
	jg	.L4
	movq	-16(%rbp), %rax
	cmpq	$-2147483648, %rax
	jge	.L5
.L4:
	movl	$0, %eax
	jmp	.L6
.L5:
	movq	-16(%rbp), %rax
.L6:
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
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
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	16(%rbp), %rsi
	movl	$.LC00, %edi
	movl	$0, %eax		# Apparently sets the number of float args
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
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
	movq $1, %rbx
	movq $2, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $2, %rbx
	movq $1, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_0
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_1
.Main_main_0:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_1:
	movq $1, %rbx
	movq $2, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $1, %rcx
	movq $2, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_2
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_3
.Main_main_2:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_3:
	movq $2, %rbx
	movq $1, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $2, %rcx
	movq $1, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_4
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_5
.Main_main_4:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_5:
	movq $2, %rbx
	movq $1, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $1, %rcx
	movq $2, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_6
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_7
.Main_main_6:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_7:
	movq $9, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	movq $1, %rbx
	movq $2, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $2, %rcx
	movq $1, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_8
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_9
.Main_main_8:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_9:
	movq $1, %rbx
	movq $2, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $1, %rcx
	movq $2, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_10
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_11
.Main_main_10:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_11:
	movq $2, %rbx
	movq $1, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $2, %rcx
	movq $1, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_12
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_13
.Main_main_12:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_13:
	movq $2, %rbx
	movq $1, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $1, %rcx
	movq $2, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_14
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_15
.Main_main_14:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_15:
	movq $9, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	movq $1, %rbx
	movq $2, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $2, %rbx
	movq $1, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_16
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_17
.Main_main_16:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_17:
	movq $1, %rbx
	movq $2, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $1, %rbx
	movq $2, %rcx
	cmpq %rcx, %rbx
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_18
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_19
.Main_main_18:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_19:
	movq $2, %rbx
	movq $1, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $2, %rcx
	movq $1, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_20
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_21
.Main_main_20:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_21:
	movq $2, %rbx
	movq $1, %rax
	cmpq %rax, %rbx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	movq $1, %rcx
	movq $2, %rbx
	cmpq %rbx, %rcx
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_22
	movq $1, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp .Main_main_23
.Main_main_22:
	movq $0, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
.Main_main_23:
	movq %rbp, %rsp
	popq %rbp
	ret
