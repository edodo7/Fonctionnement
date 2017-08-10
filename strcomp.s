# This is a MIPS assembly implementation of this following string comparaison algorithm

#	public static int strcomp(char[] str1, char[] str2) {
#		int str1Index = 0; 
#		int str2Index = 0;
#		while(str1[str1Index] != '\0') { 
#			if (str2[str2Index] == '\0' )
#				return 1;
#			if (str2[str2Index] > str1[str1Index])
#				return -1;
#			if (str1[str1Index] > str2[str2Index])
#				return 1;
#			str1Index++;
#			str2Index++;
#		}
#		if (str2[str2Index] != '\0' )
#				return -1;
#		return 0;


.data

str1:    .asciiz "test"
str2:    .asciiz "Test"

.text

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, str1 # $a0 = address of str1's first character
	la $a1 , str2 # $a1 = address of str2's first character
	jal strcomp
	move $a0, $v0
	li $v0, 1
	syscall # print the return value to the console
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

strcomp:
	lb $t0, 0($a0) # $t0 = str1[$a0]
	lb $t1, 0($a1) # $t1 = str2[$a1]
	beq $t0, $zero, checkIfstr2IsBigger
	beq $t1, $zero, str1IsBigger
	bgt $t1, $t0, str2IsBigger
	bgt $t0, $t1, str1IsBigger
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	j strcomp

str1IsBigger:
	li $v0, 1 # str1 > str2
	jr $ra


checkIfstr2IsBigger:
	bne $t1, $zero, str2IsBigger
	li $v0, 0 # str1 == str2
	jr $ra

str2IsBigger:
	li $v0, -1 # str1 < str2
	jr $ra