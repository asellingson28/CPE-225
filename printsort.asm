.text
main:
	j readstring


readstring:
	li a7, 4
	la a0, entertext
	ecall
	la s0, arr 
	li t1, 10 # new line char
	li s2, 0 # counter
	j whileread
	# while char != enter
	# read char
	# add char to full word
	

whileread:
	# this calls for each char entered to be put in an array
	li a7, 12
	ecall
	
	beq a0, t1, endwhilereadstring
	sb a0, 0(s0) # offset into contiguous memory at label arr
	addi s0, s0, 1 #move offset by 1
	addi s2, s2, 1 # counter++
	
	j whileread

endwhilereadstring:
	beq s2, zero, exit # branches if the counter for entered chars is 0 
	
	li a7, 4
	la a0, originaltext
	ecall
	li a7, 4
	la a0, arr
	ecall
	j readstring
sortalpha:
#def bubbleSort(A: list) -> list:  
 #   n = len(A)  
  #  for i in range(n):  
   #     swapped = False  
    #    for j in range(0, n-i-1):  
     #       if A[j] > A[j+1]:  
      #          A[j], A[j+1] = A[j+1], A[j]  
       #         swapped = True  
        #if not swapped: break  
    # return A
     
printalpha:

exit:
    #la   t0, arr
    #mv   a0, t0
    #lb a0, 3(a0) # gets the 4th entered char
    #li   a7, 11
    #ecall

li a7, 4
la a0, exitingtext
ecall
li a7, 10
ecall



.data
arr: .space 20
sortedArr: .space 20
entertext: .string "\nEnter word: "
originaltext: .string "Original word: "
alphawordtext: .string "\n Alphabetized word: "
exitingtext: .string "Exiting"


# Bubble Sort in C

#void bubble_sort(unsigned char arr[], int n) {
#   for (int pass = 0; pass < n - 1; pass++) {
 #       for (int i = 0; i < n - 1 - pass; i++) {
  #          if (arr[i] > arr[i + 1]) {
   #             unsigned char tmp = arr[i];
    #            arr[i] = arr[i + 1];
     #           arr[i + 1] = tmp;
      #      }
       # }
    #}
#}






# iterate through arr

# li t0, 0
# la s0, arr
# li s2, 20
# for_it
	# bge t0, s2, end
	# sb t3, 0(s0)
	# addi s0, s0, 1
	# addi t0, t0, 1
# end


