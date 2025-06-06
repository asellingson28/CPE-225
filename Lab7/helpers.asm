.globl plot, abs

.text

# formula for a certain pixel ( x * cols + y ) * 4 (bytes)
# starting location 0x1001 0000


# plot assumes: a0 = x, a1 = y, a2 = color
plot:
    li t1, 0x10010000     # base address
    li t2, 256            # number of columns
    mul t3, a0, t2        # t3 = x * cols
    add t3, t3, a1        # t3 = (x * cols) + y
    li t4, 4
    mul t3, t3, t4        # byte offset (mult t3 by 4)
    add t3, t3, t1        # address in t3
    sw a2, 0(t3)          # store the color
    ret




abs:
    bge a0, zero, end_abs   
    neg a0, a0  
end_abs:
ret
