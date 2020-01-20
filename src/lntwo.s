.global lntwo

lntwo:
	pushq	%rbp
	movq	%rsp,	%rbp
	bsr		%rdi, 	%rax
	popq 	%rbp
	ret
