.global fact

fact:	
	pushq	%rbp
	movq 	%rsp,	%rbp
	movq	%rdi,	%rbx
	movq 	$1,		%rax 
	jmp loop

mul:
	imulq	%rbx
	dec		%rbx

loop:
	cmp		$0,		%rbx
	jg mul
	jl done

done:
	movq	%rbp,	%rsp
	popq	%rbp
	ret 
