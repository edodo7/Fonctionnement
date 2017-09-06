# This is a MIPS assembly implementation of this Java Code:
#     for (int i = 0; true ; i++) {
#	  	  System.out.println(i);
#      }

# TODO : Add more comments to the code

.data
str:	.asciiz "\n"

.text
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $t0, 0
	jal print_str
	lw $ra , 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_str:
	addi $t0, $t0, 1
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, str 
	li $v0, 4
	syscall
	j print_str