# def contains(number , digit):
#	if number % 10 == digit:
#		return True
#	else:
#		lastDigitRemoved = int(number / 10)
#		if lastDigitRemoved > 0:
#			return contains(lastDigitRemoved , digit)
#		return False


main:
	addi $sp, $sp , -4
	sw $ra, 0($sp)
	li $a0 , 1579803 # number
	li $a1 , 7 # digit
	jal contains
	move $a0, $v0
	li $v0, 1
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


contains:
	li $t0, 10
	div $a0, $t0
	mfhi $t1 # $t1 = number % 10
	beq $t1 , $a1, returnTrue
	mflo $t2 # $t2 = int(number / 10)
	blez $t2, returnFalse
	addi $sp, $sp, -4
	sw $ra , 0($sp)
	move $a0, $t2
	jal contains
	lw $ra ,0($sp)
	addi $sp, $sp, 4
	jr $ra

returnTrue:
	li $v0, 1
	jr $ra

returnFalse:
	li $v0, 0
	jr $ra