# This is a MIPS assembly program that reads two integer numbers A and B. 
# The program indicate if one of these numbers is multiple of the other one and print a message.
.data
str1:  .asciiz " is multiple of "
str2:  .asciiz " and "
str3:  .asciiz " are not multiples each other "

.text
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $v0, 5
	syscall # read an integer from standard input and put it in $v0
	move $a0, $v0 # $a0 == A
	li $v0, 5
	syscall
	move $a1, $v0 # $a1 == B
	jal whoIsBigger
	lw $ra , 0($sp)
	addi $sp, $sp, 4
	jr $ra


whoIsBigger:
	bge $a0, $a1, aIsBigger
	div $a1, $a0  # B is bigger than A
	move $a2, $a1
	move $a3, $a0 
	mfhi $t0
	beq $zero, $t0, isMultiple
	j notMultiples

isMultiple:
	li $v0, 1
	move $a0, $a2
	syscall # print the integer in $a0
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 1
	move $a0, $a3
	syscall
	jr $ra
	
notMultiples:
	li $v0, 1
	move $a0, $a2
	syscall # print the integer in $a0
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	move $a0, $a3
	syscall # print the integer in $a0
	li $v0, 4
	la $a0, str3
	syscall
	jr $ra

aIsBigger:
	move $a2, $a0
	move $a3, $a1
	div $a0, $a1 
	mfhi $t0
	beq $zero, $t0, isMultiple
	j notMultiples