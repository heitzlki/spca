	.file	"pointer.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"=== TESTING ARRAY OF POINTERS ==="
.LC1:
	.string	"Memory addresses:"
.LC2:
	.string	"a: %p, b: %p, c: %p\n"
.LC3:
	.string	"arr_of_ptrs: %p\n"
	.align 8
.LC4:
	.string	"arr_of_ptrs[0]: %p, arr_of_ptrs[1]: %p, arr_of_ptrs[2]: %p\n"
.LC5:
	.string	"\nPointer arithmetic:"
	.align 8
.LC6:
	.string	"arr_of_ptrs + 1: %p (difference: %ld bytes)\n"
.LC7:
	.string	"\nAccessing values:"
	.align 8
.LC8:
	.string	"arr_of_ptrs[%d] = %p, *arr_of_ptrs[%d] = %d\n"
	.text
	.globl	test_array_of_pointers
	.type	test_array_of_pointers, @function
test_array_of_pointers:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$10, -48(%rbp)
	movl	$20, -44(%rbp)
	movl	$30, -40(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	leaq	-44(%rbp), %rax
	movq	%rax, -24(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-40(%rbp), %rcx
	leaq	-44(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	addq	$8, %rax
	movl	$8, %edx
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -36(%rbp)
	jmp	.L2
.L3:
	movl	-36(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movl	(%rax), %esi
	movl	-36(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rdx
	movl	-36(%rbp), %ecx
	movl	-36(%rbp), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -36(%rbp)
.L2:
	cmpl	$2, -36(%rbp)
	jle	.L3
	movl	$10, %edi
	call	putchar@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	test_array_of_pointers, .-test_array_of_pointers
	.section	.rodata
	.align 8
.LC9:
	.string	"=== TESTING POINTER TO ARRAY ==="
.LC10:
	.string	"actual_array: %p\n"
.LC11:
	.string	"ptr_to_arr: %p\n"
	.align 8
.LC12:
	.string	"&actual_array[0]: %p, &actual_array[1]: %p, &actual_array[2]: %p\n"
	.align 8
.LC13:
	.string	"ptr_to_arr + 1: %p (difference: %ld bytes)\n"
	.align 8
.LC14:
	.string	"(*ptr_to_arr)[%d] = %d, &(*ptr_to_arr)[%d] = %p\n"
	.text
	.globl	test_pointer_to_array
	.type	test_pointer_to_array, @function
test_pointer_to_array:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$100, -20(%rbp)
	movl	$200, -16(%rbp)
	movl	$300, -12(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-20(%rbp), %rax
	leaq	4(%rax), %rdx
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	addq	$12, %rax
	subq	-32(%rbp), %rax
	movq	-32(%rbp), %rdx
	leaq	12(%rdx), %rcx
	movq	%rax, %rdx
	movq	%rcx, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -36(%rbp)
	jmp	.L6
.L7:
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movq	-32(%rbp), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %edx
	movl	-36(%rbp), %ecx
	movl	-36(%rbp), %eax
	movq	%rsi, %r8
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -36(%rbp)
.L6:
	cmpl	$2, -36(%rbp)
	jle	.L7
	movl	$10, %edi
	call	putchar@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	test_pointer_to_array, .-test_pointer_to_array
	.section	.rodata
	.align 8
.LC15:
	.string	"=== TESTING 2D ARRAY SCENARIO ==="
.LC16:
	.string	"Matrix memory layout:"
.LC17:
	.string	"matrix[0]: %p, matrix[1]: %p\n"
	.align 8
.LC18:
	.string	"Difference between rows: %ld bytes\n"
.LC19:
	.string	"\nArray of pointers access:"
.LC20:
	.string	"arr_of_ptrs[%d][%d] = %d "
.LC21:
	.string	"\nPointer to array access:"
.LC22:
	.string	"ptr_to_arr[%d][%d] = %d "
	.align 8
.LC23:
	.string	"\nPointer arithmetic comparison:"
	.align 8
.LC24:
	.string	"arr_of_ptrs + 1: %p (moves by sizeof pointer)\n"
	.align 8
.LC25:
	.string	"ptr_to_arr + 1: %p (moves by sizeof 3 ints)\n"
	.text
	.globl	test_2d_array_scenario
	.type	test_2d_array_scenario, @function
test_2d_array_scenario:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, -32(%rbp)
	movl	$2, -28(%rbp)
	movl	$3, -24(%rbp)
	movl	$4, -20(%rbp)
	movl	$5, -16(%rbp)
	movl	$6, -12(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, -48(%rbp)
	leaq	-32(%rbp), %rax
	addq	$12, %rax
	movq	%rax, -40(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, -56(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rax
	leaq	12(%rax), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$12, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -72(%rbp)
	jmp	.L10
.L13:
	movl	$0, -68(%rbp)
	jmp	.L11
.L12:
	movl	-72(%rbp), %eax
	cltq
	movq	-48(%rbp,%rax,8), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-68(%rbp), %edx
	movl	-72(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -68(%rbp)
.L11:
	cmpl	$2, -68(%rbp)
	jle	.L12
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -72(%rbp)
.L10:
	cmpl	$1, -72(%rbp)
	jle	.L13
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -64(%rbp)
	jmp	.L14
.L17:
	movl	$0, -60(%rbp)
	jmp	.L15
.L16:
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movl	-60(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %ecx
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -60(%rbp)
.L15:
	cmpl	$2, -60(%rbp)
	jle	.L16
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -64(%rbp)
.L14:
	cmpl	$1, -64(%rbp)
	jle	.L17
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	addq	$12, %rax
	movq	%rax, %rsi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	test_2d_array_scenario, .-test_2d_array_scenario
	.section	.rodata
	.align 8
.LC26:
	.string	"=== TESTING DYNAMIC ALLOCATION ==="
	.align 8
.LC27:
	.string	"Dynamically allocated pointers:"
	.align 8
.LC28:
	.string	"dynamic_arr_of_ptrs[%d] = %p, value = %d\n"
.LC29:
	.string	"\nDynamically allocated array:"
.LC30:
	.string	"dynamic_ptr_to_arr = %p\n"
	.align 8
.LC31:
	.string	"(*dynamic_ptr_to_arr)[%d] = %d\n"
	.text
	.globl	test_dynamic_allocation
	.type	test_dynamic_allocation, @function
test_dynamic_allocation:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -56(%rbp)
	jmp	.L20
.L21:
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movl	-56(%rbp), %eax
	cltq
	movq	%rdx, -32(%rbp,%rax,8)
	movl	-56(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movl	-56(%rbp), %edx
	imull	$1000, %edx, %edx
	movl	%edx, (%rax)
	addl	$1, -56(%rbp)
.L20:
	cmpl	$2, -56(%rbp)
	jle	.L21
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -52(%rbp)
	jmp	.L22
.L23:
	movl	-52(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movl	(%rax), %ecx
	movl	-52(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rdx
	movl	-52(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -52(%rbp)
.L22:
	cmpl	$2, -52(%rbp)
	jle	.L23
	movl	$12, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$7000, (%rax)
	movq	-40(%rbp), %rax
	movl	$8000, 4(%rax)
	movq	-40(%rbp), %rax
	movl	$9000, 8(%rax)
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -48(%rbp)
	jmp	.L24
.L25:
	movq	-40(%rbp), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %edx
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -48(%rbp)
.L24:
	cmpl	$2, -48(%rbp)
	jle	.L25
	movl	$0, -44(%rbp)
	jmp	.L26
.L27:
	movl	-44(%rbp), %eax
	cltq
	movq	-32(%rbp,%rax,8), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -44(%rbp)
.L26:
	cmpl	$2, -44(%rbp)
	jle	.L27
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	test_dynamic_allocation, .-test_dynamic_allocation
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	test_array_of_pointers
	movl	$0, %eax
	call	test_pointer_to_array
	movl	$0, %eax
	call	test_2d_array_scenario
	movl	$0, %eax
	call	test_dynamic_allocation
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
