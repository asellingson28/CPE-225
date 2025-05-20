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
	#j readstring
	
sortalpha:
    li   t0, 0       #var pass = 0
    la   s0, arr       # s0 = base ptr of arr
    mv   s2, s2 # is this redundant lol

outer_for:
    bgeu t0, s2, endouter_for   # if pass >= length, done
    lb   a0, 0(s0)     # load arr[0] into t3
    #li   a7, 11        # print char
    #ecall
	
	
    # beginning of inner for	
    li t1, 0 # i = 0
    sub s3, s2, t0  #  n - 1 - pass
	
inner_for:

        bgeu t1, s3, endouter_for # i < n - 1 - pass
	
	lb t2, 0(s0)
	lb t3, 1(s0)
	bgeu t2, t3, swap # arr[i] > arr[i+1]
	
	sb t2, 1(s0)
	sb t3, 0(s0)
	j repeat_outer_for
	
swap:
mv t4, t2
mv t2, t3
mv t3, t4
j repeat_outer_for


endinner_for:
addi t1, t1, 1
j inner_for

repeat_outer_for:
    addi s0, s0, 1     # advance pointer of arr by one byte (ie index ++)
    addi t0, t0, 1     # for loop ctr
    j    outer_for        # repeat

endouter_for:
j printalpha



printalpha:
    li   t0, 0       
    la   s0, arr      
    mv   s2, s2 

printfor:
    bgeu t0, s2, exit   # if pass >= length, done
    lb   a0, 0(s0)     # load arr[0] into t3
    li   a7, 11        # print char
    ecall

endprint_for:
    addi s0, s0, 1     # advance pointer of arr by one byte (ie index ++)
    addi t0, t0, 1     # for loop ctr
    j printfor

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
alphawordtext: .string "\n Alphabetized word: "
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


