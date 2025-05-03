#Do the same as the above. Type the following code out in RARS.
.text
	#these comments are not very helpful!
	andi t1, t1, 0 # clear t1
	lw t3, mydata # get the data -> 85
	addi t4, t0, 1 # load the mask into t4 (mask = 1)
	and t1, t3, t4 # and t3 and t4, put results in t1
	sw t1, myrslt, t2 # store answer in myrslt
	
.data		
mydata:	.word 0x55
myrslt:	.word 0
#Use “step” to simulate the program. Show the result of execution. Explain
#what this program does. Screenshot your work and paste it below. (15 points)
