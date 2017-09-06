# This is a MIPS assembly implementation of these following methods

#   void f1() {
#		return f2(4) + 5;
#	}
#
#	void f2(int a) {
#		return a + a;
#	}
#
#	void main() {
#		return f1() + f2(3);
#	}


main:
	addi $sp, $sp, -4
	sw $ra , 0($sp)
	jal mainFunction
	move $a0, $v0
	li $v0, 1
	syscall
	lw $ra , 0($sp)
	addi $sp, $sp, 4
	jr $ra

mainFunction:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal f1
	li $a0, 3
	jal f2
	add $v0, $v0, $v1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

f1:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 4 # argument for f2()'s call inside f1's call
	jal f2
	addi $v0, $v1, 5
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

f2:
	add $v1, $a0, $a0
	jr $ra