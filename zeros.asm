.globl main
.text

main: 
	li a7,  4 #syscall 4 - sets where to output

	la a0, greeting # address of greeting in a0
	ecall # syscall
mainLoop:


	la a0, prompt # promp str (enter a number)
	ecall
	
	li a7, 5 #syscall 5 - reads input (int)
	ecall

	add t0, a0, zero # transfers a0 to t0

	lw t3, counter # load counter into t3
	li t1, 32 # reset values
	li t3, 0
	
	li t4, 31        # init of loop
	li t5, 1  # mask of 1 inserted in t5
forMask:
	 blt t4, zero, endLoop # exit when t4 < 0
	

	srl t2, t0, t4            # t2 = input >> i (shifted by i)
	and t2, t2, t5            # t2 = (input >> i) & 1
	bne t2, zero, endLoop     # if bit is 1, break
	
	addi t3, t3, 1          # counter++
	addi t4, t4, -1	 # decrement i

	b forMask # branch again

endLoop:
	sw t3, counter, t6
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
	greeting: .string "Welcome to the Zeros Program."
	prompt: .string "\n\nPlease enter a number: "
	numBits: .string "The number of leading zeros is: "
	continue: .string "\nContinue (y/n)?: "
	exiting: .string "\n\nExiting\n"

	input: .word

	counter: .word 0
	charInput: .byte 0

