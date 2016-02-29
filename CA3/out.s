movq $2, %rax
movq $2, %rbx
imulq %rax, %rbx
movq $4, %rax
cmp %rbx, %rax
movq $0, %rax
cmovl $1, %rax
cmp %rax, %rax
movq $0, %rax
cmovz $1, %rax
cmp %rax, %rax
jnz Main_main_0
movq $25, %rax
jmp Main_main_1
Main_main_0:
movq $52, %rax
Main_main_1:
ret
