# This is a MIPS assembly implementation of the following factorial algorithm
# TODO : Ask the number to the user as an input
#
#	int factoriel(int n){
#		if (n <= 1)
#			return 1;
#		else
#			return n * factoriel(n - 1);
#   }

main:
	addi $sp , $sp , -4
	sw $ra, 0($sp)
	li $a0, 4 
	jal factoriel
	lw $ra, 0($sp)
	move $a0, $v0 
	li $v0, 1
	syscall # this syscall will print  $a0's factorial
	addi $sp, $sp , 4
	jr $ra

factoriel:
	li $t0 , 1
	ble $a0, $t0, returnOne
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	sub $a0, $a0, $t0
	jal factoriel  # call factoriel(n - 1)
	lw $t1, 0($sp) # get back n
	mult $v0, $t1
	mflo $v0 # $v0 = n * factoriel(n - 1)
	lw $ra ,4($sp)
	addi $sp, $sp, 8
	jr $ra

returnOne:
	li $v0, 1
	jr $ra