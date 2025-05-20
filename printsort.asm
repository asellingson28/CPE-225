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
	sb   zero, 0(s0)       
	li a7, 4
	la a0, originaltext
	ecall
	li a7, 4
	la a0, arr
	ecall
	#j readstring
	
sortalpha:
    li   t0, 0       #var pass = 0
    addi s2, s2, -1
outer_for:
    la   s0, arr       # s0 = base ptr of arr
    bgeu t0, s2, endouter_for   # if pass >= length, done
    add  t3, t0, zero   # t3 = pass 
    #lb   a0, 0(s0)     # load arr[0] into t3
    
    # beginning of inner for	
    li t1, 0 # i = 0
    sub  t5, s2, t0           # t5 = n-1-pass
    addi t5, t5, -1           # t5 = n-1-pass-1 

    
inner_for:
    add  t4, s0, t1           # t4 = &arr[i]
    bgtu t1, t5, repeat_outer_for # i < n - 1 - pass

    lb    t2, 0(t4)           # arr[i]
    lb    t3, 1(t4)           # arr[i+1]
    bgtu  t2, t3, swap        # swap if arr[i] > arr[i+1]

    j next_i


	
swap:
	sb t2, 1(t4)
	sb t3, 0(t4)
	
next_i:
    addi  t1, t1, 1             # i++
    j     inner_for



repeat_outer_for:
    addi t0, t0, 1     # for loop ctr
    j    outer_for        # repeat

endouter_for:
j printalpha




printalpha:
    la a0, alphawordtext
    li a7, 4
    ecall


    la   s0, arr      
    mv   a0, s0 
    
    li a7, 4
    ecall





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
entertext: .string "\nEnter word: "
originaltext: .string "Original word: "
alphawordtext: .string "\nAlphabetized word: "
exitingtext: .string "\nExiting"


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


