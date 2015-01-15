	.file	"ncopy_fun.c"
	.text
	.globl	ncopy
	.type	ncopy, @function
ncopy:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -8(%ebp)
	jmp	.L2
.L4:
	movl	8(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, 8(%ebp)
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	cmpl	$0, -4(%ebp)
	jle	.L3
	addl	$1, -8(%ebp)
.L3:
	subl	$1, 16(%ebp)
.L2:
	cmpl	$0, 16(%ebp)
	jg	.L4
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	ncopy, .-ncopy
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
