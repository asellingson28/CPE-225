.text
.globl greeting, runOperation, printstring, reprompt
greeting:
	la a0, greetingStr
	jal printstring
	# above here only runs once
	
	la a0, operations
	jal printstring
	
	
runOperation:

	li a4, 0
	li a5, 0
	li a6, 0
	li t5, 0
	lw s8, completedOperations
	
	jal printNumOperations
	
	la a0, num1Print
	jal printstring

	
	jal readint
	mv a4, a0
		
	la a0, num2Print
	jal printstring
	
	jal readint
	mv a5, a0
	
	la a0, operationPrint
	jal printstring
	
	jal readint
	mv a6, a0
	
	la a0, resultPrint
	jal printstring

	jal chooseOperation # switch operation statement
	mv a0, a3
	jal printint

reprompt:
	addi s8, s8, 1
	sw s8, completedOperations, s9
	li a7,  4
	la a0, continuePrint
	ecall
	
	jal readchar
	
	li t0, 110 #ASCII value of n is 110
	beq a0, t0, exit #if a0 doesnt matches value of t0, branch exitFunc 
	
	j runOperation
	

exit:
	jal printNumOperations

	la a0, exiting 
	jal printstring
	
	li a7, 10
	ecall 
	

printint:
# load into a0 beforehand
	li a7, 1
	ecall
	ret
printstring:
# load into a0 beforehand
	li a7, 4
	ecall
	ret
readint:
	li a7, 5
	ecall
	ret
readchar:
	li a7, 12 #syscall 12 - reads input (char)
	ecall
	ret
	
printNumOperations:
	mv t6, ra
	la a0, numOperationsPrint
	jal printstring
	
	lw a0, completedOperations
	jal printint
	
	jr t6
	
	
	
.data
	greetingStr: .string "Welcome to the Calculator Program."
	operations: .string "\nOperations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor"
	num1Print: .string "\nEnter number: "
	num2Print: .string "Enter second number: "
	operationPrint: .string "Select operation: "
	resultPrint: .string "Result: "
	continuePrint: .string "\nContinue (y/n)?: "
	numOperationsPrint: .string "\n\nNumber of operations performed: "
	completedOperations: .word 0
	exiting: .string "\nExiting\n"
