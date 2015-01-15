	.file	"ncopy_fun.c"
	.text
	.globl	ncopy
	.type	ncopy, @function
ncopy:
.LFB0:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %ecx
	movl	20(%esp), %ebx
	movl	24(%esp), %edi
	testl	%edi, %edi
	jle	.L5
	movl	$0, %eax
.L4:
	addl	$4, %ecx
	movl	-4(%ecx), %esi
	addl	$4, %ebx
	movl	%esi, -4(%ebx)
	testl	%esi, %esi
	setg	%dl
	movzbl	%dl, %edx
	addl	%edx, %eax
	subl	$1, %edi
	jne	.L4
	jmp	.L2
.L5:
	movl	$0, %eax
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
