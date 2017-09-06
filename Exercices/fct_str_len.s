# This is a MIPS assembly code that compute the length of a string
# TODO : Add more comments

.data
str:	.asciiz "Eduardo"

.text

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0 , str # address of first character
	li $s0, 0  # len
	jal loop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	move $a0, $v0
	li $v0, 1
	syscall
	jr $ra

loop:
	lb $t0, 0($a0) 
	beq $zero, $t0, end_loop
	addi $s0,$s0, 1
	addi $a0,$a0, 1
	j loop

end_loop:
	move $v0, $s0
	jr $ra


