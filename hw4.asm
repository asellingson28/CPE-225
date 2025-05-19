.text
main:

li a2, 7
li a3, 4

jal subtract_ints

addi t0, a0, 3



li a7, 10
ecall

subtract_ints:
	sub a0 a2, a3
	ret

