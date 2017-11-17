# def power(x, n):
#	if n == 0:
#		return 1
#	return x * power(x , n - 1)


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 2 # x
	li $a1, 8 # n
	jal power
	move $a0, $v0
	li $v0, 1
	syscall # will print 256
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

power:
	beq $a1 , $zero, returnOne
	addi $sp , $sp , -4
	sw $ra, 0($sp)
	addi $a1, $a1, -1
	jal power
	mult $v0 , $a0
	mflo $v0
	lw $ra , 0($sp)
	addi $sp, $sp, 4
	jr $ra

returnOne:
	li $v0, 1
	jr $ra
