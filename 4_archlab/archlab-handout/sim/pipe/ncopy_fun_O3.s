	.file	"ncopy_fun.c"
	.text
	.p2align 4,,15
	.globl	ncopy
	.type	ncopy, @function
ncopy:
.LFB0:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	xorl	%eax, %eax
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%esp), %edx
	movl	16(%esp), %ecx
	movl	20(%esp), %ebx
	testl	%edx, %edx
	jle	.L2
	.p2align 4,,7
	.p2align 3
.L3:
	addl	$4, %ecx
	movl	-4(%ecx), %esi
	addl	$4, %ebx
	leal	1(%eax), %edi
	testl	%esi, %esi
	cmovg	%edi, %eax
	subl	$1, %edx
	movl	%esi, -4(%ebx)
	jne	.L3
.L2:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE0:
	.size	ncopy, .-ncopy
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
