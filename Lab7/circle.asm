.globl circle
.text
# Circle function: circle(xc, yc, r)
# a0 = xc (center x), a1 = yc (center y), a2 = r (radius)
circle:
    addi sp, sp, -32
    sw ra, 28(sp)
    sw s0, 24(sp)     # xc
    sw s1, 20(sp)     # yc
    sw s2, 16(sp)     # r
    sw s3, 12(sp)     # x
    sw s4, 8(sp)      # y
    sw s5, 4(sp)      # g
    sw s6, 0(sp)      # diagonalInc, rightInc
   
    mv s0, a0          # xc
    mv s1, a1          # yc
    mv s2, a2          # r
   
    # Initialize variables
    li s3, 0           # x = 0
    mv s4, s2          # y = r
    li t0, 3
    slli t1, s2, 1     # 2 * r
    sub s5, t0, t1     # g = 3 - 2*r
   
    # diagonalInc = 10 - 4*r
    li t0, 10
    slli t1, s2, 2     # 4 * r
    sub s6, t0, t1     # diagonalInc = 10 - 4*r
   
    li t6, 6           # rightInc = 6
   
circle_loop:
    bgt s3, s4, circle_done
   
    # Plot 8 points of the circle
    # plot(xc+x, yc+y)
    add a0, s0, s3
    add a1, s1, s4
    jal plot
   
    # plot(xc+x, yc-y)
    add a0, s0, s3
    sub a1, s1, s4
    jal plot
   
    # plot(xc-x, yc+y)
    sub a0, s0, s3
    add a1, s1, s4
    jal plot
   
    # plot(xc-x, yc-y)
    sub a0, s0, s3
    sub a1, s1, s4
    jal plot
   
    # plot(xc+y, yc+x)
    add a0, s0, s4
    add a1, s1, s3
    jal plot
   
    # plot(xc+y, yc-x)
    add a0, s0, s4
    sub a1, s1, s3
    jal plot
   
    # plot(xc-y, yc+x)
    sub a0, s0, s4
    add a1, s1, s3
    jal plot
   
    # plot(xc-y, yc-x)
    sub a0, s0, s4
    sub a1, s1, s3
    jal plot
   
    # Update variables
    bgez s5, circle_diagonal
   
    # g < 0: move right
    add s5, s5, t6     # g += rightInc
    addi s6, s6, 4     # diagonalInc += 4
    j circle_update_common
   
circle_diagonal:
    # g >= 0: move diagonally
    add s5, s5, s6     # g += diagonalInc
    addi s6, s6, 8     # diagonalInc += 8
    addi s4, s4, -1    # y -= 1
   
circle_update_common:
    addi t6, t6, 4     # rightInc += 4
    addi s3, s3, 1     # x += 1
    j circle_loop
   
circle_done:
    lw ra, 28(sp)
    lw s0, 24(sp)
    lw s1, 20(sp)
    lw s2, 16(sp)
    lw s3, 12(sp)
    lw s4, 8(sp)
    lw s5, 4(sp)
    lw s6, 0(sp)
    addi sp, sp, 32
    jr ra