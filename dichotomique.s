# This is a MIPS assembly implementation of following search algorithm

# public static int recherche( int[] tab , int bas, int haut, int c) {
#	 if( bas > haut)
#		 return -1;
#	 int milieu = bas + ( haut - bas )/ 2;
#	 if(c == tab[milieu])
#		 return milieu;
#	 else if(c < tab[milieu])
#		 return recherche(tab, bas, milieu - 1,c);
#	 else 
#		 return recherche(tab, milieu + 1, haut, c);
# }

# At the moment of writing this comment, the following code make a stack overflow and crash.
# I don't know how to fix it now :'( .

.data

tab:
	.word 1
	.word 7
	.word 19
	.word 223
	.word 511
	.word 32
	.word 90

.text

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, tab # address of first elem of array
	li $a1, 0 # bas 
	li $a2 , 6 # haut
	li $a3, 90 # c
	jal recherche
	move $a0 , $v0
	li $v0, 1
	syscall # this syscall print return value to the console
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

recherche:
	bgt $a1, $a0, basPlusGrand # if bas > haut
	sub $t0, $a2, $a1 # $t0 = bas - haut
	li $t1, 2
	div $t0,$t1
	mflo $t0 # $t0 = (bas - haut) / 2
	add $t0, $t0, $a1 # $t0 = bas + (bas - haut) / 2 <==> milieu
	sll $t1, $t0, 2
	add $t1, $t1, $a0
	lw $t2, 0($t1) # $t2 = tab[milieu]
	beq $a3, $t2, cEgalTabMilieu # if c == tab[milieu]
	blt $a3 , $t2 , cPlusPetit # if c < tab[milieu]
	j cPlusGrand # else
	

basPlusGrand:# if bas > haut
	li $v0, -1
	jr $ra # return -1


cEgalTabMilieu: # if c == tab[milieu]
	move $v0, $t0 
	jr $ra # return milieu

cPlusPetit:# if c < tab[milieu]
	addi $sp, $sp, -4
	sw $ra, 0($sp) 
	addi $t0, $t0, -1 
	move $a2, $t0 # haut = milieu - 1
	jal recherche # call recherche(tab, bas, milieu - 1,c)
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

cPlusGrand:# else
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $t0, $t0, 1
	move $a1, $t0 # bas = milieu + 1
	jal recherche # call recherche(tab, milieu + 1, haut, c)
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra