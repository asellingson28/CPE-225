.globl swap 
.globl selectionSort

 
#void selectionSort(int arr[], int i, int n){
selectionSort:
# callee setup goes here
# a0 = arr - > never changes
# a1 = i
# a2 = n -> never changes

    # /* find the minimum element in the unsorted subarray `[i…n-1]`
    # // and swap it with `arr[i]`  */
    
#    int j;
#    int min = i; # min = s1
# PROLOGUE

# allocate memory for preserving stack ordered allocations
    addi  sp, sp, -20
    sw    ra, 16(sp)
    sw    s0, 12(sp)
    sw    s1,  8(sp)
    sw    s2,  4(sp)
    sw    s3,  0(sp)

    mv    s1,  a1      #  initialize min = i
    mv    s2,  a2      #  save n
    mv    s3,  a1      #  save original i


#    for (j = i + 1; j < n; j++)    {
for:

#j = i + 1;
addi  s0, a1, 1    # s0 = j



forloop:
# j < n
bgeu s0, a2, endfor

#        /* if `arr[j]` is less, then it is the new minimum */
#        if (arr[j] < arr[min]) {

# define arr[min]
# define arr[j]

slli t3, s0, 2        # Multiply j by 4
add t3, a0, t3	     # t3 = &arr[j]
lw t2, 0(t3)         # t2 = arr[j]

slli t4, s1, 2        # Multiply min by 4
add t4, a0, t4 	     # t4 = &arr[min]
lw t5, 0(t4)          # t5 = arr[min]


if1:
bge t2, t5, endif1
#            min = j;    /* update the index of minimum element */
mv s1, s0
#        }

endif1:
addi s0, s0, 1 # j++
j forloop
#    }

endfor:
 
#    /* swap the minimum element in subarray `arr[i…n-1]` with `arr[i] */
#    swap(arr, min, i);
#caller setup and subroutine call for swap goes here.
# min is in s1 at the end of this for loop

    mv    a1, s1      # a1 = min
    mv    a2, s3      # a2 = original i
    jal   swap

    mv    a2, s2      # restore n for the recursive test


#caller teardown for swap goes here (if needed).
 
#    if (i + 1 < n) {
if2:

   mv   t6, s3         # t6 = original i
   addi t6, t6, 1      # t6 = i+1
    bge   t6, s2, endif2    # if i+1 ≥ n  skip recursion
    mv    a1, t6          # a1 = i+1

    jal   selectionSort
    # a1 = new i



#        selectionSort(arr, i + 1, n);
#caller setup and subroutine call for selectionSort goes here.

#caller teardown for selectionSort goes here (if needed).



#    }
endif2:
# stop recurse

# callee teardown goes here
# EPILOGUE
    lw    ra, 16(sp)
    lw    s0, 12(sp)
    lw    s1,  8(sp)
    lw    s2,  4(sp)
    lw    s3,  0(sp)
    addi  sp, sp,  20
   ret
 # goes back to whereever it was called from recursively
#}

 

#/* Utility function to swap values at two indices in an array*/
#void swap(int arr[], int i, int j) {


#   a0 = arr, a1 = i, a2 = j
swap: 
# swap callee setup goes here
# FROM PRINTSORT
# 	sb t2, 1(t4) # reverses order of the bytes
#	sb t3, 0(t4)

# no need for temp
#    int temp = arr[i];
#    arr[i] = arr[j];
#    arr[j] = temp;

  # temp = arr[i]
  slli t0, a1, 2       # t0 = i*4
  add  t0, a0, t0      # t0 = &arr[i]
  lw   t1, 0(t0)       # t1 = arr[i]

  # t2 = &arr[j]
  slli t2, a2, 2
  add  t2, a0, t2
  lw   t3, 0(t2)       # t3 = arr[j]

  # arr[i] = old arr[j]
  sw   t3, 0(t0)

  # arr[j] = old arr[i]
  sw   t1, 0(t2)

  ret

# swap callee teardown goes here

#}

.data
helper: .string "Test"
