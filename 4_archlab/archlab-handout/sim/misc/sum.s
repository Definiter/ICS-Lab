	.file	"sum.c"
	.text
	.globl	sum_list
	.type	sum_list, @function
sum_list:
.LFB0:
	.cfi_startproc
	movl	4(%esp), %edx
	testl	%edx, %edx
	je	.L4
	movl	$0, %eax
.L3:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L3
	rep ret
.L4:
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	sum_list, .-sum_list
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
