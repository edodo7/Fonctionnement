	.data
	.globl str
str:
	.asciiz "Hello World of MIPS!\n"


	.text

main:
	la  $a0,str
	li $a1, 5
	li $v0, 4 #print str

loop:
	addi $a1,$a1,-1
	syscall
	bne $a1,$zero,loop

jr $ra
