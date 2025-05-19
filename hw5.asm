.globl main
main:
la t0, myquestions
lw a0, 0(t0)
jal printstring # printstring code not provided on purpose.
lw a0, 4(t0)
jal printstring
jal getanswer
b main
getanswer:
la t0, scoretbl
jal readint
srli s0, a0, 2 # multiply by 4
lw a0, 0(s0)
ret