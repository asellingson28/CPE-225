.globl addnums, subnums, multnums,andnums, ornums, xornums, divnums, chooseOperation
 .text
 # a4 num1, a5 num2, a6 opr
addnums:
	add a3, a4, a5
	ret
subnums:
	sub a3, a4, a5
	ret
multnums:
	# for a amount of times
	li a3, 0 # sum
    	addi t5, a5, 0     
multLoop:
	beqz t5, endMult
	add a3, a3, a4 # result += a4 
	addi t5, t5, -1
	j multLoop
endMult:
	ret

divnums: #floor division since no remainder
    li a3, 0       
# while (a>=) {
#a=a-b
# i++

divLoop:
    blt a4, a5, endDiv  
    sub a4, a4, a5      # a = a - b
    addi a3, a3, 1      # add to quotient
    j divLoop
endDiv:
	ret

andnums:
	and a3, a4, a5
	ret
ornums:
	or a3, a4, a5
	ret
xornums:
	xor a3, a4, a5
	ret

chooseOperation:
	addi t2, zero, 7
	bgt a6, t2, invalidOperation
	addi t3, zero, 1
	blt a6, t3, invalidOperation
	beq a6, t3, addnums
	addi t3, zero, 2
	beq a6, t3, subnums
	addi t3, zero, 3
	beq a6, t3, multnums
	addi t3, zero, 4
	beq a6, t3, divnums
	addi t3, zero, 5
	beq a6, t3, andnums
	addi t3, zero, 6
	beq a6, t3, ornums
	addi t3, zero, 7
	beq a6, t3, xornums
	
invalidOperation:
	la a0, invalid
	jal printstring
	j reprompt
	
.data
invalid: .string "Invalid Operation\n"
