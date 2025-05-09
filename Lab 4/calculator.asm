.globl main
.text

main:
	jal greeting
	jal runOperation
	
	
	li a7, 10
	ecall
.data
	
test: .string "testing"




