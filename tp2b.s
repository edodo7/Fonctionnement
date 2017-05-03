TRISF=0xBF886140
TRISFCLR=TRISF+4
TRISFINV=TRISF+12
LATF=0xBF886160
LATFINV=LATF+12


	.text
	.globl main
	.ent main
main:
	# configuration RF6 en sortie
	li $a0, TRISFCLR
	li $a1, 0x00000000
	sw $a1, 0($a0)

	# chargement valeur LATF dans $a2
	li $a2, LATF
	lw $a0, 0($a2)

main_loop:
	
	# allumage LD5 (LATF6=1)
	li $a0, LATFINV	
	li $a1, 0x00000001
	sw $a1, 0($a0)
	
	#Boucle d'attente
	li $a3, 10000000
	jal loop
        
	#Boucle cycle
	b main_loop
	.end main
loop:
	addi $a3, $a3, -1
	bgtz $a3, loop
	jr $ra
