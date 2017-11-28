# This is a MIPS assembly program that compute the sum from 0 to n.
#  def sum(n):
#		if n == 0:
#			return 0
#		return n + sum(n - 1)

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 100 # limit of sum
	jal sum
	move $a0, $v0
	li $v0, 1
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

sum:
	beq $a0 , $zero, returnZero
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	addi $a0, $a0, -1
	jal sum
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	add $v0, $v0, $a0
	addi $sp, $sp, 8
	jr $ra



returnZero:
	li $v0, 0
	jr $ra