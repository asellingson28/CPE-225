# Line function: line(x0, y0, x1, y1)
# a0 = x0, a1 = y0, a2 = x1, a3 = y1
.globl line
.text
line: # prologue
    addi sp, sp, -48
    sw ra, 44(sp)
    sw s0, 40(sp)     # x0
    sw s1, 36(sp)     # y0
    sw s2, 32(sp)     # x1
    sw s3, 28(sp)     # y1
    sw s4, 24(sp)     # st 
    sw s5, 20(sp)     # deltax
    sw s6, 16(sp)     # deltay
    sw s7, 12(sp)     # error
    sw s8, 8(sp)      # y
    sw s9, 4(sp)      # ystep
    sw s10, 0(sp)     # x 
   
    mv s0, a0          # x0
    mv s1, a1          # y0
    mv s2, a2          # x1
    mv s3, a3          # y1
   
    # Check if steep: abs(y1-y0) > abs(x1-x0)
    sub a0, s3, s1     # y1 - y0
    jal abs
    mv t0, a0          # abs(y1-y0)
   
    sub a0, s2, s0     # x1 - x0
    jal abs
    mv t1, a0          # abs(x1-x0)
   
    slt s4, t1, t0     # st = abs(x1-x0) < abs(y1-y0)
   
    #  swap x and y coordinates
    beqz s4, line_not_steep
    # Swap x0,y0 and x1,y1
    mv t0, s0
    mv s0, s1
    mv s1, t0
    mv t0, s2
    mv s2, s3
    mv s3, t0
   
line_not_steep:
    # Ensure x0 <= x1
    ble s0, s2, line_x_regular
    # Swap (x0,y0) with (x1,y1)
    mv t0, s0
    mv s0, s2
    mv s2, t0
    mv t0, s1
    mv s1, s3
    mv s3, t0
   
line_x_regular:

    sub s5, s2, s0     # dx = x1 - x0
    sub a0, s3, s1     # y1 - y0
    jal abs
    mv s6, a0          # dy = abs(y1 - y0)
   

    li s7, 0          
    mv s8, s1         
   
    # Determine ystep
    blt s1, s3, line_ystep_pos
    li s9, -1          # ystep = -1
    j line_ystep_done
line_ystep_pos:
    li s9, 1           # ystep = 1
line_ystep_done:
   
    # Main loop: for x from x0 to x1
    mv s10, s0         # x = x0
   
line_loop:
    bgt s10, s2, line_done
   
    # Plot point
    beqz s4, line_plot_normal
    # Steep case: plot(y, x)
    mv a0, s8
    mv a1, s10
    jal plot
    j line_plot_done
line_plot_normal:
    # Normal case: plot(x, y)
    mv a0, s10
    mv a1, s8
    jal plot
   
line_plot_done:
    # Update error and y
    add s7, s7, s6     # error = error + deltay
    slli t0, s7, 1     # 2 * error
    blt t0, s5, line_no_step
   
    # Step in y direction
    add s8, s8, s9     # y = y + ystep
    sub s7, s7, s5     # error = error - deltax
   
line_no_step:
    addi s10, s10, 1   # x++
    j line_loop
   
line_done: #epilogue
    lw ra, 44(sp)
    lw s0, 40(sp)
    lw s1, 36(sp)
    lw s2, 32(sp)
    lw s3, 28(sp)
    lw s4, 24(sp)
    lw s5, 20(sp)
    lw s6, 16(sp)
    lw s7, 12(sp)
    lw s8, 8(sp)
    lw s9, 4(sp)
    lw s10, 0(sp)
    addi sp, sp, 48
    jr ra