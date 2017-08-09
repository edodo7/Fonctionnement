# This is a MIPS assembly implementation of this PGCD algorithm
#  public static int pgcd(int a, int b) {
#		int reste;
#		if( b == 0) {
#			return a;
#		}
#		else {
#			reste = a % b;
#			return pgcd(b , reste);
#		}
#  }

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 221 # a
	li $a1, 782 # b
	jal pgcd
	move $a0, $v0
	li $v0, 1
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


pgcd: # cas de base
	bne $a1, $zero, else 
	move $v0, $a0
	jr $ra # return a

else:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	div $a0, $a1 # now HI register contains a % b
	move $a0, $a1 
	mfhi $a1 # reste
	jal pgcd
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
