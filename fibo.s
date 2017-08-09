# This is a MIPS assembly implementation of fibonacci algorithm
# TODO : Add more comments

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 24
	jal fibo
	move $a0, $v0
	li $v0, 1
	syscall 
	lw $ra, 0($sp)
	addi $sp, $sp , 4
	jr $ra

fibo:
	li $s0, 1
	bgt $a0, $s0, fibo_recur
	move $v0, $a0
	jr $ra

fibo_recur:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	jal fibo1
	lw $a0, 0($sp)
	sw $v0, 0($sp)
	jal fibo2
	lw $t0, 0($sp)
	add $v0, $v0, $t0
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

fibo1:
	addi $a0, $a0, -1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal fibo
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

fibo2:
	addi $a0, $a0, -2
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal fibo
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra