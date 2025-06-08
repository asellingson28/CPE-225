
.data

    # Bitmap display base address
    display_base: .word 0x10010000
   
   
    white: .word 0x00FFFFFF

   
    # Display dimensions
    width: .word 256
    height: .word 256

.text
.globl main

main:
    # Initialize bitmap to white
    jal initialize_bitmap
   
    # Draw stick figure
    # 1. Circle(30,100,20) #head
    li a0, 30      # xc
    li a1, 100     # yc
    li a2, 20      # radius
    jal circle
   
    # 2. Line(30,80,30,30) #body
    li a0, 30      # x0
    li a1, 80      # y0
    li a2, 30      # x1
    li a3, 30      # y1
    jal line
   
    # 3. Line(20,1,30,30) #left leg
    li a0, 20      # x0
    li a1, 1       # y0
    li a2, 30      # x1
    li a3, 30      # y1
    jal line
   
    # 4. Line(40,1,30,30) #right leg
    li a0, 40      # x0
    li a1, 1       # y0
    li a2, 30      # x1
    li a3, 30      # y1
    jal line
   
    # 5. Line(15,60,30,50) #left arm
    li a0, 15      # x0
    li a1, 60      # y0
    li a2, 30      # x1
    li a3, 50      # y1
    jal line
   
    # 6. Line(30,50,45,60) #right arm
    li a0, 30      # x0
    li a1, 50      # y0
    li a2, 45      # x1
    li a3, 60      # y1
    jal line
   
    # 7. Circle(24,105,3) #left eye
    li a0, 24      # xc
    li a1, 105     # yc
    li a2, 3       # radius
    jal circle
   
    # 8. Circle(36,105,3) #right eye
    li a0, 36      # xc
    li a1, 105     # yc
    li a2, 3       # radius
    jal circle
   
    # 9. Line(25,90,35,90) #mouth center
    li a0, 25      # x0
    li a1, 90      # y0
    li a2, 35      # x1
    li a3, 90      # y1
    jal line
   
    # 10. Line(25,90,20,95) #mouth left
    li a0, 25      # x0
    li a1, 90      # y0
    li a2, 20      # x1
    li a3, 95      # y1
    jal line
   
    # 11. Line(35,90,40,95) #mouth right
    li a0, 35      # x0
    li a1, 90      # y0
    li a2, 40      # x1
    li a3, 95      # y1
    jal line
   
    # Exit program
    li a0, 0
    li a7, 93      # exit system call
    ecall

