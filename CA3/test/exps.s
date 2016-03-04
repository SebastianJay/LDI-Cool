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
	subq $16, %rsp
	movq $34533, %rax
	movq $48880, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq $50538, %rax
	movq $12757, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $46509, %rax
	movq %rax, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $3306, %rsi
	movq $61695, %rax
	movq $50213, %rdi
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq $8423, %rax
	movq $34498, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $56453, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $60575, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $53667, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $60858, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $2438, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $34422, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $18841, %rax
	movq $54759, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $17815, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $58210, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $28379, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $12660, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $19369, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $55318, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $48608, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $3828, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $2739, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $8340, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $45807, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $29181, %rdi
	movq %rdi, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %rax, %rdi
	movq %r8, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $51233, %rax
	movq $33158, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $47308, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $229, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $25241, %rax
	movq $13257, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $840, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $62420, %rax
	movq $31735, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $17376, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $9569, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $54460, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $28260, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $18310, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $14379, %rax
	movq $61731, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $20908, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $59714, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $5456, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $46032, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $34526, %rcx
	movq %rax, %rbx
	movq %rcx, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $2730, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $13765, %rax
	movq $5137, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $3850, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $21018, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $16210, %rbx
	movq $23599, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $8997, %rax
	movq $30996, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $27231, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $15755, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $23071, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	subq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $62331, %rcx
	movq %rax, %rbx
	movq %rcx, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $9856, %rax
	movq $8640, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq $11282, %rax
	movq $39523, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $57869, %rcx
	movq $49695, %rax
	movq $13131, %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $18119, %rdi
	movq %rax, %rsi
	movq %rdi, %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $14461, %rax
	movq $15505, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33976, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $36010, %rdi
	movq %rdi, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $16029, %rax
	movq $19302, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $39267, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $3175, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $19020, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $16420, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $53595, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $43617, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $55348, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $8271, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $63080, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $50998, %r8
	movq %rax, %rdi
	movq %r8, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $25947, %r8
	movq $22130, %rax
	movq $60913, %r9
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $6550, %r9
	cltq
	cqto
	idivq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $29011, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $43604, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $46874, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $29252, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25351, %r10
	movq %rax, %r9
	movq %r10, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r8, %rax
	movq %r9, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $36212, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $30605, %rax
	movq $35043, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $63562, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $14901, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $46154, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $53085, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $24923, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $20995, %rax
	movq $47127, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $53587, %rax
	movq $6934, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $23915, %rax
	movq $63399, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $52290, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $52486, %rax
	movq $20968, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $37473, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $14802, %rax
	movq $39506, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33866, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $16693, %rax
	movq $2211, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	addq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $30018, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20384, %rdi
	imulq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	addq %rsi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25036, %rdi
	movq %rax, %rsi
	movq %rdi, %rax
	subq %rax, %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq %rcx, %rax
	movq %rsi, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	addq %rbx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $38737, %rcx
	movq %rax, %rbx
	movq %rcx, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $19322, %rax
	movq $38661, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $21514, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq $604, %rcx
	movq $21813, %rsi
	movq $25099, %rdi
	movq $52033, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $34320, %r8
	movq $25316, %rax
	movq $8214, %r9
	imulq %r9
	shlq $32, %rax
	sarq $32, %rax
	movq $22802, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $5660, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $10478, %r10
	movq %rax, %r9
	movq %r10, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $10464, %r10
	movq $32716, %r11
	movq $49288, %rax
	movq $5606, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $2985, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $59495, %r12
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq %r11, %rax
	movq %r12, %r11
	addq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $60127, %r12
	movq %rax, %r11
	movq %r12, %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $63664, %rax
	movq $60238, %r12
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $28227, %r12
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $7429, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $50691, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq %r11, %rax
	movq %r12, %r11
	subq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $5411, %r12
	movq %rax, %r11
	movq %r12, %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq $18444, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	negq %r12
	shlq $32, %r12
	sarq $32, %r12
	movq $48391, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $58688, %r13
	cltq
	cqto
	idivq %r13
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r13
	negq %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r12, %rax
	movq %r13, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $8738, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $36519, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq $27940, %r12
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq %r11, %rax
	movq %r12, %r11
	subq %r11, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $50929, %r12
	movq %rax, %r11
	movq %r12, %rax
	addq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %r10, %rax
	movq %r11, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $47963, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $15735, %rax
	movq $932, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $27409, %r10
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
	movq $35237, %r10
	movq %rax, %r9
	movq %r10, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $53642, %rax
	movq $21521, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r10
	movq %r9, %rax
	movq %r10, %r9
	addq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $53181, %r10
	movq %rax, %r9
	movq %r10, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $24320, %rax
	movq $3520, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r8, %rax
	movq %r9, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $40488, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $58419, %r8
	imulq %r8
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
	movq $17975, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $43856, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $52306, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $55626, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $11513, %rsi
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
	movq $41765, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $39037, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $28968, %rax
	movq $32079, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq $64947, %rax
	movq %rax, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $38220, %rsi
	movq $48887, %rax
	movq %rax, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $7493, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $26972, %rax
	movq %rax, %r8
	negq %r8
	shlq $32, %r8
	sarq $32, %r8
	movq $62150, %rax
	movq %rax, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $30797, %r10
	movq $3233, %r11
	movq $26083, %rax
	movq $56556, %r12
	cltq
	cqto
	idivq %r12
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r12
	movq $55273, %r13
	movq $38801, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $17979, %r14
	imulq %r14
	shlq $32, %rax
	sarq $32, %rax
	movq $14356, %r14
	subq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $61208, %r14
	negq %r14
	shlq $32, %r14
	sarq $32, %r14
	subq %r14, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $25185, %r15
	movq %rax, %r14
	movq %r15, %rax
	addq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $47041, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $65097, %r15
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $5880, %rax
	movq $12843, %r15
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $38600, %r15
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq $25834, %r15
	imulq %r15
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $47353, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $2951, %r15
	cltq
	cqto
	idivq %r15
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r15
	movq $63252, %rax
	subq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $35037, -0(%rbp)
	movq $56918, %rax
	movq $55662, -8(%rbp)
	cltq
	cqto
	idivq -8(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -8(%rbp)
	movq -0(%rbp), %rax
	movq -8(%rbp), %rdx
	movq %rdx, -0(%rbp)
	cltq
	cqto
	idivq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r15
	shlq $32, %r15
	sarq $32, %r15
	movq $15079, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $64582, -0(%rbp)
	cltq
	cqto
	idivq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq $7741, -0(%rbp)
	cltq
	cqto
	idivq -0(%rbp)
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, -0(%rbp)
	movq %r15, %rax
	movq -0(%rbp), %r15
	addq %r15, %rax
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq $18422, %rax
	subq %rax, %r14
	shlq $32, %r14
	sarq $32, %r14
	movq %r14, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r13
	shlq $32, %r13
	sarq $32, %r13
	movq %r12, %rax
	movq %r13, %r12
	imulq %r12
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r11
	shlq $32, %r11
	sarq $32, %r11
	movq %r10, %rax
	movq %r11, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $2469, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	negq %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r8, %rax
	movq %r9, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $37073, %rax
	movq $6195, %r8
	imulq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq $29789, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20509, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $48672, %rax
	movq $3326, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $6765, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $15487, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $55049, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $57936, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq $1317, %rax
	movq $47218, %r9
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
	addq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $27399, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq %rcx, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $30631, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $13076, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
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
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	movq $6821, %rcx
	movq $45379, %rax
	subq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $48457, %rax
	movq $18781, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq $47988, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $41455, %rax
	movq $64464, %rsi
	cltq
	cqto
	idivq %rsi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rsi
	movq $49119, %rdi
	movq $40570, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $28147, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $15714, %r8
	cltq
	cqto
	idivq %r8
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r8
	movq %rdi, %rax
	movq %r8, %rdi
	subq %rdi, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $10809, %r8
	movq %rax, %rdi
	movq %r8, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq %rsi, %rax
	movq %rdi, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $48118, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $20470, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	imulq %rsi
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	movq $50347, %rax
	movq %rax, %rsi
	negq %rsi
	shlq $32, %rsi
	sarq $32, %rsi
	movq $1202, %rax
	movq $51824, %rdi
	negq %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	cltq
	cqto
	idivq %rdi
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rdi
	movq $33161, %rax
	subq %rax, %rdi
	shlq $32, %rdi
	sarq $32, %rdi
	movq $18429, %r8
	movq $52820, %r9
	movq $38686, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $8022, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	negq %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $33788, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
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
	movq $17594, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $15798, %r9
	subq %r9, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $62723, %r9
	movq %r9, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	movq %rax, %r9
	movq %r10, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $63899, %rax
	movq $18189, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $60159, %rax
	movq %rax, %r10
	negq %r10
	shlq $32, %r10
	sarq $32, %r10
	movq $1357, %rax
	movq $9886, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq $27696, %r11
	imulq %r11
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %r11
	movq %r10, %rax
	movq %r11, %r10
	cltq
	cqto
	idivq %r10
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq $61569, %rax
	movq $2562, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $38208, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	movq $19892, %r10
	imulq %r10
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %r9
	shlq $32, %r9
	sarq $32, %r9
	movq %r8, %rax
	movq %r9, %r8
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
	movq $14546, %rcx
	subq %rcx, %rax
	shlq $32, %rax
	sarq $32, %rax
	movq $49411, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	addq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	movq $9508, %rax
	movq $60323, %rcx
	imulq %rcx
	shlq $32, %rax
	sarq $32, %rax
	movq $7258, %rcx
	negq %rcx
	shlq $32, %rcx
	sarq $32, %rcx
	cltq
	cqto
	idivq %rcx
	shlq $32, %rax
	sarq $32, %rax
	subq %rax, %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $31515, %rax
	movq %rax, %rbx
	negq %rbx
	shlq $32, %rbx
	sarq $32, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $51549, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $2147483647, %rax
	movq $2, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $2, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq $1073741824, %rax
	movq $4, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq $2, %rbx
	cltq
	cqto
	idivq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	pushq %rbx
	call out_int
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
