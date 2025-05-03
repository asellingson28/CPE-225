.text
.globl main
main:


	
while: 	
	li a7,  4 # print string
	la a0, prompt 
	ecall # syscall
	
	li a7, 5
	lw t1, usernum # t1 = 0

	li a7, 5 #syscall 5 - reads input (int)
	ecall
	
	sw a0, usernum, t6

	li t4, -1
	beq a0, t4, endWhile

	
	li a7,  4 # print string
	la a0, entered 
	ecall # syscall
	

	lw a0, usernum 
	li a7,  1 # print int
	ecall # syscall
	
	
	li a7,  4 # print string
	la a0, newLine 
	ecall # syscall
	
	j while

	
endWhile:
	li a7, 10
	ecall 

	



.data
prompt: .string "Enter an integer, or -1 to exit: "
entered: .string "You entered: "
newLine: .string "\n"
usernum: .word 0

