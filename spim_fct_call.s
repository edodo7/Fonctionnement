main:
	li $a0, 1
	li $a1, 2
	li $a2, 3
	li $a3, 4
	li $t0, 5
	li $t1, 6
	addiu $sp,$sp,-12
	sw $ra, 8($sp)
	sw $t0,4($sp)
	sw $t1,0($sp)
	jal fct
	lw $ra, 8($sp)
	addiu $sp,$sp,12
	jr $ra

fct:
	mult $a0,$a1
	mflo $a0
	mult $a0,$a2
	mflo $a0
	mult $a0,$a3
	mflo $a0
	lw $t2, 4($sp) # t2 contient t0
	lw $t3, 0($sp) # t3 contient t1
	mult $a0,$t2
	mflo $a0
	mult $a0,$t3
	jr $ra
