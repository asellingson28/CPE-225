# Plot function: plot(x, y)
# a0 = x coordinate, a1 = y coordinate
.globl plot, abs, initialize_bitmap
.text
plot:
    addi sp, sp, -8
    sw t0, 4(sp)
    sw t1, 0(sp)
   
    # Check bounds
    bltz a0, plot_return   # x < 0
    bltz a1, plot_return   # y < 0
    li t0, 256
    bge a0, t0, plot_return   # x >= 256
    bge a1, t0, plot_return   # y >= 256
   
    # Flip Y coordinate: a1 = 255 - a1
    li t2, 255
    sub a1, t2, a1

    # Calculate address: base + (y * 256 + x) * 4
    li t0, 0x10010000      # base address
    slli t1, a1, 8         # y * 256
    add t1, t1, a0         # y * 256 + x
    slli t1, t1, 2         # * 4 (word address)
    add t0, t0, t1         # final address

    # Store black pixel
    li t1, 0x24c9c9 # hehe teal blue
    sw t1, 0(t0)

plot_return:
    lw t0, 4(sp)
    lw t1, 0(sp)
    addi sp, sp, 8
    jr ra



# a0 = input, a0 = |input| (return in a0)
abs:
    bgez a0, abs_return
    sub a0, zero, a0
abs_return:
    jr ra
    
    # initiiallize bitmap to all white
    

initialize_bitmap:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s0, 8(sp)
    sw s1, 4(sp)
    sw s2, 0(sp)
   
    li s0, 0x10010000     
    li s1, 0x00FFFFFF     
    li s2, 0               
    li t0, 65536           # 256 * 256 
   
init_loop:
    beq s2, t0, init_done
    sw s1, 0(s0)           # Store white pixel
    addi s0, s0, 4         # Next pixel address
    addi s2, s2, 1         # Increment counter
    j init_loop
   
init_done:
    lw ra, 12(sp)
    lw s0, 8(sp)
    lw s1, 4(sp)
    lw s2, 0(sp)
    addi sp, sp, 16
    jr ra