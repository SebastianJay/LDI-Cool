	.section	.rodata
.name_Object_l:
	.string "Object"
.name_Object:
	.quad	3
	.quad	String_vtable
	.quad	1
	.quad	.name_Object_l
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
	pushq	%rsi
	pushq	%rdi
	movl	$24, %esi
	movl	$1, %edi
	call	calloc
	movq	$0, (%rax) # Object ID is 0
	movq	$Object_vtable, 8(%rax)
	movq	$0, 16(%rax)	# 0 fields
	popq	%rdi
	popq	%rsi
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	Object.new, .-Object.new
.LC3:
	.string	"abort\\n"
.abort_string:
	.quad	3
	.quad	String_vtable
	.quad	1
	.quad	.LC3
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
	movq 	$.abort_string, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	IO.out_string
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
	movq	%rsp, %rbp
	movq	16(%rbp), %rax	# Get self
	movq	8(%rax), %rax	# Get vtable
	movq	(%rax), %rax	# String reference at index 0
	leave
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
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	movq	16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	16(%rax), %rax
	addq	$3, %rax
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
	popq	%rcx
	popq	%rdi
	popq	%rsi
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Object.copy, .-Object.copy
	.section	.rodata
.name_Int_l:		
	.string "Int"
.name_Int:
	.quad	3
	.quad	String_vtable
	.quad	1
	.quad	.name_Int_l
Int_vtable:
	.quad	.name_Int
	.quad	Int.new
	.quad	Object.abort
	.quad	Object.copy
	.quad	Object.type_name
	.text
	.globl	Int.new
	.type	Int.new, @function
Int.new:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	pushq	%rsi
	pushq	%rdi
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	$1, (%rax)	# Int id is 1
	movq	$Int_vtable, 8(%rax)
	movq	$1, 16(%rax)	# 1 field
	movq	$0, 24(%rax)
	popq	%rdi
	popq	%rsi
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc	
	.size	Int.new, .-Int.new
	.section	.rodata
.name_Bool_l:
	.string "Bool"
.name_Bool:
	.quad	3
	.quad	String_vtable
	.quad	1
	.quad	.name_Bool_l
Bool_vtable:
	.quad	.name_Bool
	.quad	Bool.new
	.quad	Object.abort
	.quad	Object.copy
	.quad	Object.type_name
	.text	
	.globl	Bool.new
	.type	Bool.new, @function
Bool.new:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	pushq	%rsi
	pushq	%rdi
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	$2, (%rax)	# Bool id is 2
	movq	$Bool_vtable, 8(%rax)
	movq	$1, 16(%rax)	# 1 field
	movq	$0, 24(%rax)
	popq	%rdi
	popq	%rsi
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size	Bool.new, .-Bool.new
	.section	.rodata
.name_String_l:
	.string	"String"
.name_String:
	.quad	3
	.quad	String_vtable
	.quad	1
	.quad	.name_String_l
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
	pushq	%rsi
	pushq	%rdi
	movl	$32, %esi
	movl	$1, %edi
	call	calloc
	movq	$3, (%rax)	# String id is 3
	movq	$String_vtable, 8(%rax)
	movq	$1, 16(%rax)	# 1 field
	movq	$.LC4, 24(%rax)
	popq	%rdi
	popq	%rsi
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
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
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
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	.cfi_offset 3, -24
	movq	16(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -64(%rbp)
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
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
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
.LC5_l:
	.string	"ERROR: String index out of bounds"
.LC5:
	.quad	3
	.quad 	String_vtable
	.quad	1
	.quad	.LC5_l
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
	pushq	%rsi
	pushq	%rdi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	24(%rbp), %rax
	movl	%eax, -44(%rbp)
	movq	32(%rbp), %rax
	movl	%eax, -48(%rbp)
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
	pushq	$.LC5
	call	IO.out_string
	add 	8, %rsp
	movq	1, %rdi
	call 	exit
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
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdi
	popq	%rsi
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	String.substr, .-String.substr
	.section	.rodata
.name_IO_l:
	.string	"IO"
.name_IO:
	.quad	3
	.quad	String_vtable
	.quad	1
	.quad	.name_IO_l
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
	pushq	%rsi
	pushq	%rdi
	movl	$24, %esi
	movl	$1, %edi
	call	calloc
	movq	$4, (%rax)	#IO id is 3
	movq	$IO_vtable, 8(%rax)
	movq	$0, 16(%rax)	#0 fields
	popq	%rdi
	popq	%rsi
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
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%r10
	pushq	%r11
	movq	24(%rbp), %rsi
	movl	$.LC00, %edi
	movl	$0, %eax
	call	printf
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%rdi
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
	movq	24(%rbp), %rsi # Get first arg
	movq	24(%rsi), %rsi # Get c-string attribute
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leave
	ret
.LFE5:
	.size	IO.out_string, .-IO.out_string
	.globl	main
	.type	main, @function
main:
	call Main.new
	pushq %rax
	call Main.main
	addq $8, %rsp
	ret
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
.string4_l:
	.string "ERROR: %lld: Exception: stack overflow"
.string4:
	.quad 3
	.quad String_vtable
	.quad 1
	.quad .string4_l
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
Main.new:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rsi
	pushq %rdi
	movq $8, %rsi
	movq $3, %rdi
	call calloc
	popq %rdi
	popq %rsi
	movq $10, (%rax)
	movq $Main_vtable, 8(%rax)
	movq $0, 16(%rax)
	leave
	ret
Main.main:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rbx
	movq 16(%rbp), %rbx
	movq 8(%rbx), %rdx
	movq 48(%rdx), %rax
	pushq %rbx
	call *%rax
	addq $8, %rsp
	movq %rax, %rcx
	movq 8(%rbx), %rdx
	movq 64(%rdx), %rax
	pushq %rcx
	pushq %rbx
	call *%rax
	addq $16, %rsp
	popq %rbx
	leave
	ret