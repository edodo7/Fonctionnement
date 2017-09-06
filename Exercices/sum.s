# This is a MIPS assembly program that compute the sum of the first 100 numbers and print it to the console

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $s0, 0 # initialize the counter
	li $s1, 100 # limit of sum
	li $v0, 0 
	jal sum
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

sum:
	addi $s0, $s0, 1
	add $v0, $v0, $s0
	beq $s0, $s1, end_sum
	j sum



end_sum:
	move $a0, $v0
	li $v0, 1
	syscall
	jr $ra