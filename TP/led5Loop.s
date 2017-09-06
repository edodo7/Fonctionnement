TRISF=0xBF886140
LATF=0xBF886160

	.text
	.globl main
	.ent main
main:
	# configuration RF0 en sortie
	li $a2, TRISF
	lw $a0, 0($a2)
	li $a1, 0xFFFFFFFE
	and $a0, $a0, $a1
	sw $a0, 0($a2)
	# chargement valeur LATF dans $a2
	li $a2, LATF
	lw $a0, 0($a2)

main_loop:

	# extinction LD4 (LATF0=0)
	li $a1, 0xFFFFFFFE
	and $a0, $a0, $a1
	sw $a0, 0($a2)
        
	#Boucle d'attente
	li $a3, 1000000
	jal loop

	# allumage LD4 (LATF0=1)	
	li $a1, 0x00000001
	or $a0, $a0, $a1
	sw $a0, 0($a2)
	
	#Boucle d'attente
	li $a3, 1000000
	jal loop
        
	#Boucle cycle
	b main_loop
	.end main
loop:
	addi $a3, $a3, -1
	bgtz $a3, loop
	jr $ra
