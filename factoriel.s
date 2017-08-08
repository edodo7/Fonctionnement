# This is a MIPS assembly code that compute factoriel of 4
# TODO : Ask the number to the user as an input
# TODO : Add more comments

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 4
	jal fact
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

fact:
	li $s0, 1
	bne $a0, $s0, fact_recurse
	li $a1, 2
	li $v0, 1
	jr $ra
fact_recurse:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	sub $a0, $a0, 1
	jal fact
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	mult $v0, $a1
	mflo $v0
	addi $a1, $a1, 1
	jr $ra