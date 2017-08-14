# This is a MIPS assembly implementation of this palindrome algorithm
#	
#  def palindrome(chaine, length):
#	    if length <= 1:
#	        return True
#	    else:
#	        if chaine[0] != chaine[length - 1]:
#            	return False
#            else:
#            	return palindrome(chaine[1:length-1],length - 2)

.data
	str:   .asciiz "kayak"


.text
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, str # $a0 contains address of str's first character
	li $a1, 5 # $a1 contains length of str
	li $v0, 0 # We assume that str is not a palindrome
	jal palindrome
	move $a0, $v0
	li $v0, 1
	syscall
	lw $ra , 0($sp)
	addi $sp, $sp, 4
	jr $ra


palindrome:
	li $t0, 1
	ble $a1, $t0, isPalindrome
	lb $t1, 0($a0) # $t1 = chaine[0]
	addi $t2, $a1, -1
	add $t2, $t2, $a0
	lb $t3, 0($t2) # $t3 = chaine[length - 1]
	bne $t1, $t3, notPalindrome
	addi $a0, $a0, 1
	addi $a1, $a1, -2
	addi $sp, $sp , -4
	sw $ra , 0($sp)
	jal palindrome
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


isPalindrome:
	li $v0, 1

notPalindrome:
	jr $ra