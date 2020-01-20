.global gcd

gcd:
	pushq	%rbp
	movq	%rsp,	%rbp
	jmp loop

loop:
	cmp		%rsi,	%rdi
	je 	done
	jg handle
	subq	%rsi,	%rdi
	jmp loop

handle:
	subq	%rdi,	%rsi
	jmp	loop

done:
	movq	%rdi,	%rax
	popq	%rbp
	ret
