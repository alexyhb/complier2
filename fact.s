.section .data
print_int:
	.asciz	"%d\n"

.section .text
.global fact
.global gcd
.global lntwo

.global main

main:
	movq	$0, %rbp
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rax, %rdi

	pushq	$0
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$1
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$1
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$1
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$2
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$2
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$3
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$6
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$4
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$24
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$5
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$120
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$6
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$720
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$7
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$5040
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$8
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$40320
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$9
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$362880
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$10
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$3628800
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	pushq	$11
	popq	%rdi
	call	fact
	pushq	%rax
	pushq	$39916800
	popq	%rbx
	popq	%rax
	subq	%rbx, %rax
	pushq	%rax
	movq	$print_int, %rdi
	popq	%rax
	movq	%rax, %rsi
	call	printf
	xor	%rax, %rax
	popq	%rbp
	call	exit

.bss

.global a
a: .quad 0
.global b
b: .quad 0
.global c
c: .quad 0
.global d
d: .quad 0
.global e
e: .quad 0
.global f
f: .quad 0
.global g
g: .quad 0
.global h
h: .quad 0
.global i
i: .quad 0
.global j
j: .quad 0
.global k
k: .quad 0
.global l
l: .quad 0
.global m
m: .quad 0
.global n
n: .quad 0
.global o
o: .quad 0
.global p
p: .quad 0
.global q
q: .quad 0
.global r
r: .quad 0
.global s
s: .quad 0
.global t
t: .quad 0
.global u
u: .quad 0
.global v
v: .quad 0
.global w
w: .quad 0
.global x
x: .quad 0
.global y
y: .quad 0
.global z
z: .quad 0
