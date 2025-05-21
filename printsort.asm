.text
main:
    # read word ---------------------------------------------------
    	la   a0, arr            # base ptr
	li   a1, 20             # buffer size
	jal  readstring         #  a0 = len
	mv   s2, a0             # save length into t2
    # print original ---------------------------------------------
	la   a0, originaltext
	jal printstring
	la a0, arr
	jal printstring
    # bubble sort and alphabetize input
	mv a1, s2
	jal bubble_sort

readstring:
    addi sp, sp, -16
    sw   ra, 12(sp)        # 4-byte slots when using sw/lw
    sw   s0, 8(sp)

    mv   s0, a0            # s0 = base pointer (arr) ***before*** you overwrite a0
    li   t1, 10            # newline sentinel
    li   t2, 0             # len = 0

prompt:
    li   a7, 4
    la   a0, entertext
    ecall

read_loop:
    li   a7, 12
    ecall
    beq  a0, t1, done_read
    sb   a0, 0(s0)
    addi s0, s0, 1
    addi t2, t2, 1
    j    read_loop

done_read:
    sb   zero, 0(s0)       # terminator
    mv   a0, t2            # counter = length of arr

    # epilogue
    lw   ra, 12(sp)
    lw   s0, 8(sp)
    addi sp, sp, 16
    ret

bubble_sort:
# assume
# a0 - arr
# a1 - arr len (not -1)


sortalpha:
    li   t0, 0       #var pass = 0
    addi s2, s2, -1 # remove one from length of array for termination char
    
outer_for:
    la   s0, arr       # s0 = base ptr of arr
    bgeu t0, s2, endouter_for   # if pass >= length, done
    add  t3, t0, zero   # t3 = pass 
    
    # inner for set up
    li t1, 0		     # i = 0, used as offset
    sub  t5, s2, t0           # t5 = n-1-pass
    addi t5, t5, -1           # t5 = n-1-pass-1 

    
inner_for:
    add  t4, s0, t1           # t4 = s0 + t1 -> t4 = array start addr + offset

    bgtu t1, t5,next_pass # i < n - 1 - pass

    lb    t2, 0(t4)           # arr[i]
    lb    t3, 1(t4)           # arr[i+1]
    bgtu  t2, t3, swap        # swap if arr[i] > arr[i+1], skip if not out of order

    j next_i

swap:
	sb t2, 1(t4) # reverses order of the bytes
	sb t3, 0(t4)
	
next_i:
    addi  t1, t1, 1             # i++
    j     inner_for



next_pass:
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


    j main




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

printstring:
# assumes value is in a0
li a7, 4
ecall
ret

.data
arr: .space 20
entertext: .string "\nEnter word: "
originaltext: .string "Original word: "
alphawordtext: .string "\nAlphabetized word: "
exitingtext: .string "\nExiting"

#---

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


