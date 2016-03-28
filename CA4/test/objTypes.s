	.section	.rodata
.id_Object:
	.quad	0
.name_Object:
	.string "Object"
Object_vtable:
	.quad	.name_Object	# A pointer to class name string
	.quad	Object.new
	.quad	Object.abort
	.quad	Object.copy
	.quad	Object.type_name
	.text
	.globl	Object.new
	.type	Object.new, @function
Object.new:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$24, %esi
	movl	$1, %edi
	call	calloc
	movq	$0, (%rax) # Object ID is 0
	movq	$Object_vtable, 8(%rax)
	movq	$0, 16(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	Object.new, .-Object.new
.LC3:
	.string	"abort\n"
	.text
	.globl	Object.abort
	.type	Object.abort, @function
Object.abort:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$.LC3, %edi
	call	IO.out_string
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE7:
	.size	Object.abort, .-Object.abort
	.globl	Object.type_name
	.type	Object.type_name, @function
Object.type_name:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, %eax
	call	String.new
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Object.type_name, .-Object.type_name
	.globl	Object.copy
	.type	Object.copy, @function
Object.copy:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	addq	$2, %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	leaq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, (%rdx)
	movl	$0, -12(%rbp)
	jmp	.L16
.L17:
	movl	-12(%rbp), %eax
	addl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	addl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	addl	$1, -12(%rbp)
.L16:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jl	.L17
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Object.copy, .-Object.copy
	.section	.rodata
.name_String:
	.string	"String"
String_vtable:
	.quad	.name_String
	.quad	String.new
	.quad	Object.abort
	.quad	Object.copy
	.quad	Object.type_name
	.quad 	String.concat
	.quad	String.length
	.quad	String.substr
.LC4:
	.string	""
	.text
	.globl	String.new
	.type	String.new, @function
String.new:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	$2, (%rax)	# String id is 2
	movq	$String_vtable, 8(%rax)
	movq	$1, 16(%rax)
	movq	$.LC4, 24(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	String.new, .-String.new
	.globl	String.length
	.type	String.length, @function
String.length:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	String.length, .-String.length
	.globl	String.concat
	.type	String.concat, @function
String.concat:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %ebx
	movq	-64(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	addl	%ebx, %eax
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-64(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	movl	$0, %eax
	call	String.new
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-24(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	String.concat, .-String.concat
	.section	.rodata
	.align 8
.LC5:
	.string	"ERROR: String index out of bounds"
	.text
	.globl	String.substr
	.type	String.substr, @function
String.substr:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -20(%rbp)
	movl	-44(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L26
	movl	-48(%rbp), %eax
	movl	-44(%rbp), %edx
	addl	%edx, %eax
	cmpl	-20(%rbp), %eax
	jle	.L27
.L26:
	movl	$.LC5, %edi
	call	IO.out_string
.L27:
	movl	$0, %eax
	call	String.new
	movq	%rax, -16(%rbp)
	movl	-48(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L28
.L29:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	24(%rax), %rcx
	movl	-44(%rbp), %eax
	movl	-24(%rbp), %esi
	addl	%esi, %eax
	cltq
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -24(%rbp)
.L28:
	movl	-24(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jl	.L29
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	String.substr, .-String.substr
	.section	.rodata
.name_IO:
	.string	"IO"
IO_vtable:
	.quad	.name_IO
	.quad	IO.new
	.quad	Object.abort
	.quad	Object.copy
	.quad	Object.type_name
	.quad	IO.in_int
	.quad	IO.in_string
	.quad	IO.out_int
	.quad	IO.out_string
	.text
IO.new:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$24, %esi
	movl	$1, %edi
	call	calloc
	movq	$3, (%rax)	#IO id is 3
	movq	$IO_vtable, 8(%rax)
	movq	$0, 16(%rax)	#0 fields
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size	IO.new, .-IO.new
	.section	.rodata
.LC0:
	.string	"%ld"
.LC00:
	.string	"%d"
	.text
	.globl	IO.in_int
	.type	IO.in_int, @function
IO.in_int:
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
	.size	IO.in_int, .-IO.in_int
	.globl	IO.out_int
	.type	IO.out_int, @function
IO.out_int:
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
	.size	IO.out_int, .-IO.out_int
	.globl	IO.in_string
	.type	IO.in_string, @function
IO.in_string:
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
	call	String.new
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	leave
	ret
.LFE4:
	.size	IO.in_string, .-IO.in_string
	.section	.rodata
.LC1:
	.string	"%s"
	.text
	.globl	IO.out_string
	.type	IO.out_string, @function
IO.out_string:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rax
	movq	24(%rsi), %rsi
	movl	$.LC1, %edi
	movl	$0, %eax		#not sure if necessary
	call	printf
	popq	%rax
	leave
	ret
.LFE5:
	.size	IO.out_string, .-IO.out_string
	.globl	main
	.globl main
	.type main, @function
main:
	pushq %rbp
	movq %rsp, %rbp
Main.new:
	UNHANDLED: t1 <- malloc Main
.Main.new_1:
	pushq t1
	call Object.new_2
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
Foo.new:
	UNHANDLED: t1 <- malloc Foo
.Foo.new_1:
	pushq t1
	call Object.new_2
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
Bar.new:
	UNHANDLED: t1 <- malloc Bar
.Bar.new_1:
	pushq t1
	call Foo.new_2
	addq $8, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
Main.main:
	movq $0, %rax
	movq %rax, %rbx
	movq $3, %rcx
	UNHANDLED: t7 <- vtable t5 Foo.setX
	pushq t5
	pushq t6
	call t7
	addq $16, %rsp
	UNHANDLED: t9 <- vtable t5 Foo.getX
	pushq t5
	call t9
	addq $8, %rsp
	movq %rax, %rcx
	UNHANDLED: t11 <- vtable t5 Foo.setX
	pushq t5
	pushq t10
	call t11
	addq $16, %rsp
	UNHANDLED: t13 <- vtable t1 Main.func
	pushq t1
	pushq t5
	call t13
	addq $16, %rsp
	movq $12, %rcx
	UNHANDLED: t16 <- vtable t5 Foo.setX
	pushq t5
	pushq t15
	call t16
	addq $16, %rsp
	movq %rax, %rcx
	UNHANDLED: t18 <- vtable t17 Foo.getX
	pushq t17
	call t18
	addq $8, %rsp
	movq %rax, %rcx
	UNHANDLED: t20 <- vtable t5 Foo.setX
	pushq t5
	pushq t19
	call t20
	addq $16, %rsp
	movq %rax, %rcx
	UNHANDLED: t22 <- vtable t1 Main.func
	pushq t1
	pushq t21
	call t22
	addq $16, %rsp
	movq $0, %rcx
	movq $2, %rsi
	UNHANDLED: t27 <- vtable t25 Bar.setX
	pushq t25
	pushq t26
	call t27
	addq $16, %rsp
	UNHANDLED: t29 <- vtable t1 Main.func
	pushq t1
	pushq t25
	call t29
	addq $16, %rsp
	movq $10, %rax
	UNHANDLED: t32 <- vtable t5 Foo.setX
	pushq t5
	pushq t31
	call t32
	addq $16, %rsp
	movq $12, %rbx
	UNHANDLED: t35 <- vtable t33 Foo.setX
	pushq t33
	pushq t34
	call t35
	addq $16, %rsp
	movq $324, %rbx
	UNHANDLED: t38 <- vtable t36 Foo.setX
	pushq t36
	pushq t37
	call t38
	addq $16, %rsp
	UNHANDLED: t40 <- vtable t39 Foo.getX
	pushq t39
	call t40
	addq $8, %rsp
	UNHANDLED: t42 <- vtable t25 Bar.setX
	pushq t25
	pushq t41
	call t42
	addq $16, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
Main.func:
	UNHANDLED: t3 <- vtable t2 Foo.getX
	pushq t2
	call t3
	addq $8, %rsp
	UNHANDLED: t5 <- vtable t2 Foo.getX
	pushq t2
	call t5
	addq $8, %rsp
	movq %rax, %rcx
	movq %rcx, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rax, %rbx
	UNHANDLED: t10 <- vtable t2 Foo.setX
	pushq t2
	pushq t9
	call t10
	addq $16, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret
Foo.getX:
	movq %rbp, %rsp
	popq %rbp
	ret
Foo.setX:
	movq %rbp, %rsp
	popq %rbp
	ret
Bar.getX:
	movq %rax, %rbx
	imulq %rbx
	shlq $32, %rax
	sarq $32, %rax
	movq %rbp, %rsp
	popq %rbp
	ret