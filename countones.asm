.globl main
.text

main: 
	li a7,  4 #syscall 4 - sets where to output

	la a0, greeting # address of greeting in a0
	ecall # syscall
mainLoop:


	la a0, prompt # promp str
	ecall
	
	li a7, 5 #syscall 5 - reads input (int)
	ecall

	add t0, a0, zero # transfers a0 to t0
	lw t1, mask # loads mask into t1
	lw t3, counter # load counter into t3
	li t1, 1 # reset values
	li t3, 0
	

whileMask:
	beq zero, t1, endLoop # check condition: if mask = 0, run end loop sect.
	and t2, t0, t1 # bitwise and of input and 1
	
	beq t2, zero, skipInc   # if result == 0, skip increment
	addi t3, t3, 1          # counter++
	sw t3, counter, t6 # update counter with the value in t3 (t6 temp)

skipInc:
	# sw t2, result, t6 # saves result into t2
	
	slli t1, t1, 1 # left shift :)
	b whileMask # branch again

endLoop:
	#li a7, 1
	#lw a0, result
	#ecall
	
	# the next 3 are prints
	li a7,  4
	la a0, numBits
	ecall
	
	li a7,  1 # prints counter, 1 is print int
	lw a0, counter
	ecall
	
	li a7,  4
	la a0, continue 
	ecall
	
	li a7, 12 #syscall 12 - reads input (cahr)
	ecall
	
	li t0, 121 #ASCII value of y is 121
	bne a0, t0, exitFunc #if a0 doesnt matches value of t0, branch exitFunc 
	
	li a7, 4 # print syscall str method

	 		
# 	sw a7, continueRes, t6
	b mainLoop
	
	


exitFunc:
	
	li a7,  4
	la a0, exiting 
	ecall
	
	li a7, 10
	ecall 

.data
	greeting: .string "Welcome to the CountOnes Program."
	prompt: .string "\n\nPlease enter a number: "
	numBits: .string "The number of bits set is: "
	continue: .string "\nContinue (y/n)?: "
	exiting: .string "\n\nExiting\n"

	input: .word
	mask: .word 1
	counter: .word 0
	charInput: .byte 0

