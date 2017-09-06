# This is a MIPS assembly implementation of this hanoi function

#	  int hanoi(int n){ 
#			if ( n > 1 )
#				return 2 * hanoi( n - 1) + 1;
#			else
#				return 1;
#    }
# 



main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 16
	jal hanoi
	move $a0, $v0
	li $v0, 1
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

hanoi:
	li $t0, 1
	beq $a0, $t0, elseCase
	addi $sp , $sp , -4
	sw $ra, 0($sp)
	addi $a0, $a0, -1
	jal hanoi
	sll $v0, $v0, 1
	addi $v0, $v0, 1
	lw $ra 0($sp)
	addi $sp, $sp, 4
	jr $ra

elseCase:
	li $v0, 1
	jr $ra