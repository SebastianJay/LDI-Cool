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
	subq $120, %rsp
	call in_int
	movq %rax, %rcx
	call in_int
	movq %rax, %rdi
	call in_int
	movq %rax, -40(%rbp)
	call in_int
	movq %rax, -32(%rbp)
	call in_int
	movq %rax, -72(%rbp)
	call in_int
	movq %rax, -0(%rbp)
	call in_int
	movq %rax, -16(%rbp)
	call in_int
	movq %rax, -104(%rbp)
	call in_int
	movq %rax, %r9
	call in_int
	movq %rax, -64(%rbp)
	call in_int
	movq %rax, %r10
	call in_int
	movq %rax, %r11
	call in_int
	movq %rax, %r13
	call in_int
	movq %rax, %rsi
	call in_int
	movq %rax, -56(%rbp)
	call in_int
	movq %rax, %r12
	call in_int
	movq %rax, %rbx
	call in_int
	movq %rax, -88(%rbp)
	call in_int
	movq %rax, -24(%rbp)
	call in_int
	movq %rax, -80(%rbp)
	call in_int
	movq %rax, %r14
	call in_int
	movq %rax, -96(%rbp)
	call in_int
	movq %rax, -8(%rbp)
	call in_int
	movq %rax, %r15
	call in_int
	movq %rax, %r8
	call in_int
	movq %rax, -48(%rbp)
	movq %rdi, %rax
	movq -24(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_0
	movq %r15, %rax
	movq -0(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_1
.Main_main_0:
	movq -40(%rbp), %rax
	movq %rdi, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_2
	movq -8(%rbp), %rax
	movq %r8, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_3
.Main_main_2:
	movq %r12, %rax
	movq %rbx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_4
	movq -64(%rbp), %rax
	movq -56(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_5
.Main_main_4:
	movq %r13, -112(%rbp)
	movq -48(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_6
	movq %rsi, %rax
	movq %r10, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_7
.Main_main_6:
	movq -88(%rbp), %rax
	movq -8(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_8
	movq -64(%rbp), %rax
	movq -24(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_9
.Main_main_8:
	movq -32(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -72(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_10
	movq -40(%rbp), %rax
	movq -32(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_11
.Main_main_10:
	movq -8(%rbp), %rax
	movq %r14, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_12
	movq %r8, %rax
	movq -32(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_13
.Main_main_12:
	movq -56(%rbp), %rax
	movq %rbx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_14
	movq -16(%rbp), %rax
	movq -64(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_15
.Main_main_14:
	movq %rbx, %rax
	movq %r10, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_16
	movq -56(%rbp), %rax
	movq -0(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_17
.Main_main_16:
	movq -40(%rbp), %rax
	movq %r12, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_18
	movq %r11, %rax
	movq -0(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_19
.Main_main_18:
	movq %r11, -112(%rbp)
	movq %r9, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_20
	movq %r12, %rax
	movq %r15, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_21
.Main_main_20:
	movq %r14, -112(%rbp)
	movq %rcx, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_22
	movq -64(%rbp), %rax
	movq %rdi, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_23
.Main_main_22:
	movq -0(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -56(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_24
	movq -48(%rbp), %rax
	movq -8(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_25
.Main_main_24:
	movq %r12, %rax
	movq %rdi, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_26
	movq -40(%rbp), %rax
	movq %r14, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_27
.Main_main_26:
	movq -8(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %r10, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_28
	movq -24(%rbp), %rax
	movq -0(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_29
.Main_main_28:
	movq -16(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %r9, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_30
	movq %r11, %rax
	movq %r15, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_31
.Main_main_30:
	movq %rdi, -112(%rbp)
	movq %r8, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_32
	movq %r13, %rax
	movq -72(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_33
.Main_main_32:
	movq -8(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %r9, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_34
	movq -56(%rbp), %rax
	movq %rdi, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_35
.Main_main_34:
	movq %r15, -112(%rbp)
	movq -8(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_36
	movq -40(%rbp), %rax
	movq -56(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_37
.Main_main_36:
	movq -72(%rbp), %rax
	movq %r10, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_38
	movq -8(%rbp), %rax
	movq -40(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_39
.Main_main_38:
	movq -72(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -56(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_40
	movq %r12, %rax
	movq -48(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_41
.Main_main_40:
	movq %r11, %rax
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_42
	movq %r13, %rax
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_43
.Main_main_42:
	movq -56(%rbp), %rax
	movq %r13, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_44
	movq %rsi, %rax
	movq -40(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_45
.Main_main_44:
	movq %r11, -112(%rbp)
	movq %r9, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_46
	movq -24(%rbp), %rax
	movq -80(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_47
.Main_main_46:
	movq -16(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %r8, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_48
	movq -40(%rbp), %rax
	movq -64(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_49
.Main_main_48:
	movq %r12, %rax
	movq %r8, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_50
	movq %r8, %rax
	movq -48(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_51
.Main_main_50:
	movq -64(%rbp), %rax
	movq %rsi, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_52
	movq -32(%rbp), %rax
	movq -8(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_53
.Main_main_52:
	movq -32(%rbp), %rax
	movq %rbx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_54
	movq -64(%rbp), %rax
	movq %r13, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_55
.Main_main_54:
	movq -96(%rbp), %rax
	movq -88(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_56
	movq %r9, %rax
	movq -72(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_57
.Main_main_56:
	movq %r14, -112(%rbp)
	movq -96(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_58
	movq -56(%rbp), %rax
	movq -88(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_59
.Main_main_58:
	movq -8(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %rsi, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_60
	movq %r8, -112(%rbp)
	movq -88(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_61
	movq %r9, %rax
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_62
.Main_main_61:
	movq %r9, %rax
	movq %r8, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_63
	movq -56(%rbp), %rax
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_64
.Main_main_63:
	movq %rdi, %rax
	movq -0(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_65
	movq -104(%rbp), %rax
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_66
.Main_main_65:
	movq -32(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -0(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_67
	movq -64(%rbp), %rax
	movq -0(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_68
.Main_main_67:
	movq %rcx, %rax
	movq -104(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_69
	movq -96(%rbp), %rax
	movq %r8, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_70
.Main_main_69:
	movq %r15, %rax
	movq -96(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_71
	movq %rsi, %rax
	movq %r14, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_72
	movq %r12, %rax
	movq -24(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_73
.Main_main_72:
	movq -8(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -72(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_74
	movq -8(%rbp), %rax
	movq -32(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_75
.Main_main_74:
	movq %rcx, -112(%rbp)
	movq -56(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_76
	movq -32(%rbp), %rax
	movq %r11, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_77
	movq -96(%rbp), %rax
	movq %r14, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_78
.Main_main_77:
	movq %rcx, -112(%rbp)
	movq -32(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_79
	movq -88(%rbp), %rax
	movq %r13, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_80
.Main_main_79:
	movq -8(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -104(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_81
	movq -96(%rbp), %rax
	movq %r8, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_82
.Main_main_81:
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %r12, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_83
	movq -64(%rbp), %rax
	movq %r9, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_84
.Main_main_83:
	movq %r14, -112(%rbp)
	movq %r9, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_85
	movq %r10, %rax
	movq %r11, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_86
.Main_main_85:
	movq -96(%rbp), %rax
	movq -104(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_87
	movq -72(%rbp), %rax
	movq -24(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_88
.Main_main_87:
	movq -72(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -64(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_89
	movq -24(%rbp), %rax
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	jmp .Main_main_90
.Main_main_89:
	movq -24(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -24(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_91
	movq %r8, %rax
	movq %r9, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_92
	movq -72(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq %rdi, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	xorq $1, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_93
	movq %rbx, -112(%rbp)
	movq %rcx, %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_94
	movq -48(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -56(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_95
	movq %r10, %rax
	movq %rsi, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_96
.Main_main_95:
	movq %rsi, -112(%rbp)
	movq -48(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_97
	movq -8(%rbp), %rax
	movq %rsi, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_98
.Main_main_97:
	movq %r14, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_99
	movq -0(%rbp), %rax
	movq %r8, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_100
.Main_main_99:
	movq %rsi, -112(%rbp)
	movq -24(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_101
	movq -56(%rbp), %rax
	movq -96(%rbp), %rdx
	movq %rdx, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_102
	movq %rcx, %rax
	movq -80(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_103
.Main_main_102:
	movq -104(%rbp), %rdx
	movq %rdx, -112(%rbp)
	movq -80(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_104
	movq %r14, %rax
	movq %r13, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_105
.Main_main_104:
	movq %r15, -112(%rbp)
	movq -0(%rbp), %rax
	cmpq %rax, -112(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_106
	movq -80(%rbp), %rax
	movq -72(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_107
.Main_main_106:
	movq %rdi, %rax
	movq %r14, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_108
	movq %r9, %rax
	movq %r9, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_109
.Main_main_108:
	movq %r13, %rax
	movq %rsi, -112(%rbp)
	pushq %rbx
	movq -112(%rbp), %rbx
	cmpq -112(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -112(%rbp)
	popq %rbx
	movq -112(%rbp), %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_110
	movq -88(%rbp), %rax
	movq %r12, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_111
.Main_main_110:
	movq -104(%rbp), %rax
	pushq %rbx
	movq -16(%rbp), %rbx
	cmpq -16(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -16(%rbp)
	popq %rbx
	movq -16(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_112
	movq %r9, %rax
	movq %r11, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_113
.Main_main_112:
	movq -40(%rbp), %rax
	movq -48(%rbp), %rdx
	movq %rdx, -16(%rbp)
	pushq %rbx
	movq -16(%rbp), %rbx
	cmpq -16(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, -16(%rbp)
	popq %rbx
	movq -16(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_114
	movq %r11, %rax
	movq %rdi, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_115
.Main_main_114:
	movq -72(%rbp), %rax
	movq %r13, -16(%rbp)
	pushq %rbx
	movq -16(%rbp), %rbx
	cmpq -16(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -16(%rbp)
	popq %rbx
	movq -16(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_116
	movq -96(%rbp), %rax
	movq %r11, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_117
.Main_main_116:
	movq -0(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq -96(%rbp), %rax
	cmpq %rax, -16(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_118
	movq -72(%rbp), %rax
	movq %r13, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	jmp .Main_main_119
.Main_main_118:
	movq %r8, -16(%rbp)
	movq %rdi, %rax
	cmpq %rax, -16(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_120
	movq %rcx, %rax
	movq -72(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_121
.Main_main_120:
	movq -96(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq -72(%rbp), %rax
	cmpq %rax, -16(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_122
	movq %r12, %rax
	movq -64(%rbp), %rdx
	movq %rdx, -16(%rbp)
	pushq %rbx
	movq -16(%rbp), %rbx
	cmpq -16(%rbp), %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, -16(%rbp)
	popq %rbx
	movq -16(%rbp), %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_123
	movq %rsi, %rax
	movq %r8, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	jmp .Main_main_124
.Main_main_123:
	movq -72(%rbp), %rdx
	movq %rdx, -16(%rbp)
	movq %r13, %rax
	cmpq %rax, -16(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_125
	movq %r8, -16(%rbp)
	movq -48(%rbp), %rax
	cmpq %rax, -16(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_126
	movq %r9, %rax
	movq %r13, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_127
.Main_main_126:
	movq %rcx, -16(%rbp)
	movq %rdi, %rax
	cmpq %rax, -16(%rbp)
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_128
	movq -104(%rbp), %rcx
	movq %r8, %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	jmp .Main_main_129
.Main_main_128:
	movq -24(%rbp), %rax
	cmpq %r15, %rax
	movq $0, %r15
	movq $1, %rdx
	cmovleq %rdx, %r15
	movq %r15, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_130
	movq %r9, %rax
	movq -48(%rbp), %r15
	cmpq %r15, %rax
	movq $0, %r15
	movq $1, %rdx
	cmovlq %rdx, %r15
	movq %r15, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_131
	movq -96(%rbp), %rax
	movq -80(%rbp), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_132
.Main_main_131:
	movq -0(%rbp), %r15
	movq -64(%rbp), %rax
	cmpq %rax, %r15
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_133
	movq %rdi, %rax
	movq %r14, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_134
.Main_main_133:
	movq %rsi, %r15
	movq -40(%rbp), %rax
	cmpq %rax, %r15
	movq $0, %rax
	movq $1, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_135
	movq -8(%rbp), %rcx
	movq %r8, %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	jmp .Main_main_136
.Main_main_135:
	movq -104(%rbp), %rax
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmovlq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_137
	movq -80(%rbp), %rax
	movq -96(%rbp), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_138
.Main_main_137:
	movq -64(%rbp), %rax
	movq %r13, %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_139
	movq -24(%rbp), %rax
	movq -56(%rbp), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_140
.Main_main_139:
	movq -64(%rbp), %rax
	movq -56(%rbp), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmoveq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_141
	movq -72(%rbp), %rcx
	movq %r9, %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	jmp .Main_main_142
.Main_main_141:
	movq -48(%rbp), %r14
	movq -64(%rbp), %rax
	cmpq %rax, %r14
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_143
	movq -24(%rbp), %rax
	movq -96(%rbp), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_144
.Main_main_143:
	movq %r12, %r14
	movq %r12, %rax
	cmpq %rax, %r14
	movq $0, %rax
	movq $1, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_145
	movq -24(%rbp), %rax
	movq -80(%rbp), %r14
	cmpq %r14, %rax
	movq $0, %r14
	movq $1, %rdx
	cmovleq %rdx, %r14
	movq %r14, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_146
	movq %r10, %rcx
	movq %r8, %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
	jmp .Main_main_147
.Main_main_146:
	movq -56(%rbp), %rax
	movq %r12, %r10
	cmpq %r10, %rax
	movq $0, %r10
	movq $1, %rdx
	cmovleq %rdx, %r10
	movq %r10, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_148
	movq %r8, %rax
	movq %r8, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	jmp .Main_main_149
.Main_main_148:
	movq %r8, %rax
	movq %rcx, %r10
	cmpq %r10, %rax
	movq $0, %r10
	movq $1, %rdx
	cmovleq %rdx, %r10
	movq %r10, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_150
	movq -8(%rbp), %rax
	movq -64(%rbp), %r10
	cmpq %r10, %rax
	movq $0, %r10
	movq $1, %rdx
	cmoveq %rdx, %r10
	movq %r10, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_151
	movq %r11, %rax
	movq %r11, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_152
.Main_main_151:
	movq %r9, %rax
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_153
	movq -40(%rbp), %rax
	movq %r9, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_154
.Main_main_153:
	movq %rdi, %rax
	movq %rbx, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_155
	movq -32(%rbp), %rax
	movq %r8, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	jmp .Main_main_156
.Main_main_155:
	movq -32(%rbp), %rax
	movq -56(%rbp), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rax
.Main_main_156:
.Main_main_154:
.Main_main_152:
	jmp .Main_main_157
.Main_main_150:
	movq %r8, %rax
	movq %r13, %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
.Main_main_157:
.Main_main_149:
.Main_main_147:
	jmp .Main_main_158
.Main_main_145:
	movq -64(%rbp), %rcx
	movq %rbx, %rax
	cmpq %rax, %rcx
	movq $0, %rax
	movq $1, %rdx
	cmovleq %rdx, %rax
.Main_main_158:
.Main_main_144:
.Main_main_142:
.Main_main_140:
.Main_main_138:
.Main_main_136:
.Main_main_134:
.Main_main_132:
	jmp .Main_main_159
.Main_main_130:
	movq %r12, %rax
	movq -40(%rbp), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rax
.Main_main_159:
.Main_main_129:
.Main_main_127:
	jmp .Main_main_160
.Main_main_125:
	movq -88(%rbp), %rax
	movq -48(%rbp), %rcx
	cmpq %rcx, %rax
	movq $0, %rcx
	movq $1, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
.Main_main_160:
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_161
	movq %rsi, %rax
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	jmp .Main_main_162
.Main_main_161:
	movq %r9, %rax
	movq %r8, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
.Main_main_162:
.Main_main_124:
	jmp .Main_main_163
.Main_main_122:
	movq -24(%rbp), %rax
	movq %r14, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
.Main_main_163:
.Main_main_121:
.Main_main_119:
.Main_main_117:
.Main_main_115:
.Main_main_113:
.Main_main_111:
.Main_main_109:
.Main_main_107:
.Main_main_105:
.Main_main_103:
	jmp .Main_main_164
.Main_main_101:
	movq %rdi, %rax
	movq %r9, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
.Main_main_164:
.Main_main_100:
.Main_main_98:
.Main_main_96:
	jmp .Main_main_165
.Main_main_94:
	movq %rsi, %rax
	movq -96(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
.Main_main_165:
	jmp .Main_main_166
.Main_main_93:
	movq -96(%rbp), %rax
	movq %r9, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
.Main_main_166:
	jmp .Main_main_167
.Main_main_92:
	movq %r11, %rax
	movq %r15, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
.Main_main_167:
	jmp .Main_main_168
.Main_main_91:
	movq %r12, %rax
	movq %r14, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
.Main_main_168:
.Main_main_90:
.Main_main_88:
.Main_main_86:
.Main_main_84:
.Main_main_82:
.Main_main_80:
.Main_main_78:
	jmp .Main_main_169
.Main_main_76:
	movq %rcx, %rax
	movq -88(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
.Main_main_169:
.Main_main_75:
.Main_main_73:
	jmp .Main_main_170
.Main_main_71:
	movq -96(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, -32(%rbp)
	imulq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq -80(%rbp), %rdx
	movq %rdx, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq -32(%rbp), %rdx
	movq %rdx, -40(%rbp)
	negq -40(%rbp)
	shlq $32, -40(%rbp)
	sarq $32, -40(%rbp)
	movq %rax, -32(%rbp)
	movq -40(%rbp), %rax
	addq %rax, -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq %rdi, %rax
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r9
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r15, %rax
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -32(%rbp), %rax
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, %r9
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
	movq %r13, -32(%rbp)
	negq -32(%rbp)
	shlq $32, -32(%rbp)
	sarq $32, -32(%rbp)
	movq %rax, %r9
	movq -32(%rbp), %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -32(%rbp)
	movq -16(%rbp), %rax
	cltq
	cqto
	idivq -32(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -32(%rbp)
	movq %r9, %rax
	movq -32(%rbp), %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r9
	movq -88(%rbp), %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -32(%rbp)
	movq -24(%rbp), %rax
	movq -32(%rbp), %rdx
	movq %rdx, -24(%rbp)
	cltq
	cqto
	idivq -24(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq -8(%rbp), %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $12, -8(%rbp)
	movq %rdi, %rax
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $12, -8(%rbp)
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r13, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r8, %rax
	movq %r14, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %r9, %r8
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq -0(%rbp), %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %r9
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $12, %r9
	movq %rsi, %rax
	movq %r9, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %r8, %rsi
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $12, %r8
	movq %r15, %rax
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rbx, %rax
	movq %r8, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq %rsi, %rax
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq -16(%rbp), %rax
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq %rdi, %rax
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r11, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r12, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %r10, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rcx, %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmoveq %rdx, %rbx
	movq %rbx, %rax
.Main_main_170:
.Main_main_70:
.Main_main_68:
.Main_main_66:
.Main_main_64:
.Main_main_62:
	jmp .Main_main_171
.Main_main_60:
	movq $12, %rsi
	movq %r8, %rax
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq %r10, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $12, %rdi
	movq %r15, %rax
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rbx, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq %rsi, %rax
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq %r14, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $12, %rsi
	movq %r9, %rax
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $12, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq %rbx, %rax
	movq -48(%rbp), %rbx
	cmpq %rbx, %rax
	movq $0, %rbx
	movq $1, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
.Main_main_171:
.Main_main_59:
.Main_main_57:
.Main_main_55:
.Main_main_53:
.Main_main_51:
.Main_main_49:
.Main_main_47:
.Main_main_45:
.Main_main_43:
.Main_main_41:
.Main_main_39:
.Main_main_37:
.Main_main_35:
.Main_main_33:
.Main_main_31:
.Main_main_29:
.Main_main_27:
.Main_main_25:
.Main_main_23:
.Main_main_21:
.Main_main_19:
.Main_main_17:
.Main_main_15:
.Main_main_13:
.Main_main_11:
.Main_main_9:
.Main_main_7:
.Main_main_5:
.Main_main_3:
.Main_main_1:
	xorq $1, %rax
	cmpq $1, %rax
	je .Main_main_172
	movq $1, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	jmp .Main_main_173
.Main_main_172:
	movq $0, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
.Main_main_173:
	movq %rbp, %rsp
	popq %rbp
	ret
