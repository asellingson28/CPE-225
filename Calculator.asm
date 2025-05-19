.globl main
.text

main:
	li a7,  4 # print str

	la a0, greeting 
	ecall
	# above here only runs once
	
	la a0, operations
	ecall 
	

	


.data
	greeting: .string "Welcome to the Calculator Program."
	operations: .string "\nOperations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor"
	num1Print: .string "\nEnter number: "
	num2Print: .string "\nEnter second number: "
	operationPrint: .string "\nSelect operation: "
	resultPrint: .string "\nResult: "
	continuePrint: .string "\nContinue (y/n)?: "
	
