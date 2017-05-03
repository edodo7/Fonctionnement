TRISG=0xBF886180
TRISGCLR=TRISG+4
TRISGINV=TRISG+12
LATG=0xBF8861A0
LATGINV=LATG+12
CLR=4


	.text
	.globl main
	.ent main
main:
	# configuration RG6 en sortie
	li $a0, TRISGCLR
	li $a1, 0x00000040
	sw $a1, 0($a0)

	# chargement valeur LATG dans $a2
	li $a2, LATG
	lw $a0, 0($a2)

main_loop:
	
	# allumage LD4 (LATG6=1)
	li $a0, LATGINV	
	li $a1, 0x00000040
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
