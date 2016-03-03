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
	movq $12591, %rax
	movq $38801, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_0
	movq $11435, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_1
Main_main_0:
	call in_int
	movq %rax, %rcx
	movq $14352, %rax
	cmpq %rax, %rcx
	movq $1, %rax
	movq $0, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_2
	movq $15234, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_3
Main_main_2:
	movq $1170, %rcx
	movq $33472, %rax
	movq $7201, %rsi
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	addq %rcx, %rax
	movq $46167, %rsi
	movq %rax, %rcx
	movq %rsi, %rax
	addq %rax, %rcx
	movq $1823, %rax
	movq $177, %rsi
	cqto
	idivq %rsi
	movq $32704, %rsi
	imulq %rsi
	movq $16280, %rsi
	imulq %rsi
	subq %rax, %rcx
	call in_int
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmoveq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_4
	movq $47279, %rcx
	movq $47879, %rax
	cmpq %rax, %rcx
	movq $1, %rax
	movq $0, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_5
	call in_int
	movq %rax, %rbx
	movq $61456, %rax
	cmpq %rax, %rbx
	movq $1, %rax
	movq $0, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_6
	movq $53748, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_7
Main_main_6:
	movq $10280, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_7:
	jmp Main_main_8
Main_main_5:
	movq $48298, %rax
	negq %rax
	movq $11440, %rbx
	imulq %rbx
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_8:
	jmp Main_main_9
Main_main_4:
	movq $17155, %rcx
	movq $30215, %rax
	subq %rax, %rcx
	call in_int
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_10
	movq $10152, %rax
	movq $18046, %rcx
	movq $29790, %rsi
	subq %rsi, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_11
	movq $32151, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_12
Main_main_11:
	movq $30102, %rcx
	movq $25895, %rax
	cmpq %rax, %rcx
	movq $1, %rax
	movq $0, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_13
	movq $62343, %rcx
	call in_int
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_14
	call in_int
	movq %rax, %rcx
	movq $3966, %rax
	cmpq %rax, %rcx
	movq $1, %rax
	movq $0, %rdx
	cmovlq %rdx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_15
	call in_int
	movq %rax, %rcx
	movq $60606, %rax
	cmpq %rax, %rcx
	movq $1, %rax
	movq $0, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_16
	call in_int
	movq $58921, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_17
	movq $29524, %rcx
	call in_int
	cmpq %rax, %rcx
	movq $1, %rax
	movq $0, %rdx
	cmovleq %rdx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_18
	call in_int
	movq $18391, %rcx
	negq %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmovlq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_19
	movq $48027, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_20
Main_main_19:
	movq $63133, %rax
	movq $31786, %rcx
	cqto
	idivq %rcx
	movq %rax, %rcx
	call in_int
	movq %rcx, %rbx
	cmpq %rax, %rbx
	movq $1, %rax
	movq $0, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_21
	movq $8937, %rax
	movq $45402, %rbx
	cqto
	idivq %rbx
	movq $12855, %rbx
	addq %rbx, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_22
Main_main_21:
	movq $17107, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_22:
Main_main_20:
	jmp Main_main_23
Main_main_18:
	movq $51816, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_23:
	jmp Main_main_24
Main_main_17:
	movq $62649, %rcx
	call in_int
	movq %rax, %rbx
	movq %rcx, %rax
	cmpq %rbx, %rax
	movq $1, %rbx
	movq $0, %rdx
	cmovlq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_25
	movq $46404, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_26
Main_main_25:
	movq $60750, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_26:
Main_main_24:
	jmp Main_main_27
Main_main_16:
	movq $48985, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_27:
	jmp Main_main_28
Main_main_15:
	movq $21613, %rcx
	call in_int
	movq %rcx, %rbx
	cmpq %rax, %rbx
	movq $1, %rax
	movq $0, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_29
	movq $24092, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_30
Main_main_29:
	movq $29773, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_30:
Main_main_28:
	jmp Main_main_31
Main_main_14:
	movq $10174, %rax
	movq $22520, %rbx
	movq $40813, %rcx
	addq %rcx, %rbx
	cmpq %rbx, %rax
	movq $1, %rbx
	movq $0, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_32
	movq $61139, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_33
Main_main_32:
	movq $2234, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_33:
Main_main_31:
	jmp Main_main_34
Main_main_13:
	movq $53961, %rax
	movq $30773, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_35
	movq $9042, %rax
	movq $58652, %rcx
	cqto
	idivq %rcx
	movq %rax, %rcx
	movq $38511, %rax
	subq %rax, %rcx
	call in_int
	movq %rax, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cmpq %rcx, %rax
	movq $1, %rcx
	movq $0, %rdx
	cmovleq %rdx, %rcx
	movq %rcx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_36
	call in_int
	movq %rax, %rbx
	movq $45332, %rax
	cmpq %rax, %rbx
	movq $1, %rax
	movq $0, %rdx
	cmoveq %rdx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_37
	movq $3453, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_38
Main_main_37:
	movq $49656, %rax
	negq %rax
	movq $33636, %rbx
	imulq %rbx
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_38:
	jmp Main_main_39
Main_main_36:
	movq $8800, %rcx
	call in_int
	movq %rax, %rbx
	movq %rcx, %rax
	cmpq %rbx, %rax
	movq $1, %rbx
	movq $0, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_40
	movq $55166, %rax
	negq %rax
	movq $15469, %rbx
	cqto
	idivq %rbx
	movq $12618, %rbx
	negq %rbx
	addq %rbx, %rax
	movq $57963, %rbx
	subq %rbx, %rax
	movq $43177, %rbx
	subq %rbx, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_41
Main_main_40:
	movq $26355, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_41:
Main_main_39:
	jmp Main_main_42
Main_main_35:
	movq $51925, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_42:
Main_main_34:
Main_main_12:
	jmp Main_main_43
Main_main_10:
	movq $4844, %rax
	movq $42968, %rbx
	imulq %rbx
	movq $9556, %rbx
	cmpq %rbx, %rax
	movq $1, %rbx
	movq $0, %rdx
	cmovleq %rdx, %rbx
	movq %rbx, %rax
	xorq $1, %rax
	cmpq $0, %rax
	je Main_main_44
	movq $21060, %rax
	movq $19990, %rbx
	imulq %rbx
	pushq %rax
	call out_int
	addq $8, %rsp
	jmp Main_main_45
Main_main_44:
	movq $34313, %rax
	pushq %rax
	call out_int
	addq $8, %rsp
Main_main_45:
Main_main_43:
Main_main_9:
Main_main_3:
Main_main_1:
	movq %rbp, %rsp
	popq %rbp
	ret
