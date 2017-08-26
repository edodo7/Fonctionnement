
# def combinaison(n, p):
# 	if p == 0 or n == p:
# 		return 1
# 	else:
# 		return combinaison(n - 1,p - 1) + combinaison(n - 1,p)


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 5 # $a0 == n
	li $a1, 3 # $a1 == p
	jal combinaison
	move $a0, $v0
	li $v0, 1
	syscall
	lw $ra 0($sp)
	addi $sp, $sp, 4
	jr $ra


combinaison:
	beq $a1, $zero, returnOne
	beq $a1 , $a0, returnOne
	addi $a0, $a0, -1
	addi $sp, $sp , -16
	sw $ra, 12($sp)
	sw $a0, 8($sp)
	sw $a1, 4($sp)
	jal combinaison
	sw $v0, 0($sp)
	lw $a0, 8($sp)
	lw $a1, 4($sp)
	addi $a1, $a1, -1
	jal combinaison
	lw $t0, 0($sp)
	add $v0, $v0, $t0
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	jr $ra

returnOne:
	li $v0, 1
	jr $ra