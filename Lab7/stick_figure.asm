.text
main:




li a0, 0
li a1, 0
li a2, 0xFFFFFF # load hex color value - colr	
li t1, 0x10010000     # base address
li t2, 0x1004FFFC # max value of coord
add t1, t1, t2

outer_loop:
    li s1, 0              # s1 = y (inner loop)

inner_loop:
    mv a0, s0             # x
    mv a1, s1             # y
    jal plot

    addi s1, s1, 1        # y++
    li t0, 256
    blt s1, t0, inner_loop

    addi s0, s0, 1        # x++
    li t0, 256
    blt s0, t0, outer_loop

    # done
    j done

done:
li a7, 10
ecall
#1. Circle(30,100,20) #head
#2. Line(30,80,30,30) #body
#3. Line(20,1,30,30) #left leg
#4. Line(40,1,30,30) #right leg
#5. Line(15,60,30,50) #left arm
#6. Line(30,50,45,60) #right arm
#7. Circle(24,105,3) #left eye
#8. Circle(36,105,3) #right eye
#9. Line(25,90,35,90) #mouth center
#10. Line(25,90,20,95) #mouth left
#11. Line(35,90,40,95) #mouth right
