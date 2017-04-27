TRISG=0xBF886180
LATG=0xBF8861A0
DELAY=10000000

TRISGCLR=TRISG+4
LATGSET=LATG+8

	.text
	.globl main
	.ent main
main:
	# configuration RG6 en sortie
	li $a0, TRISGCLR
	li $a1, 0x00000040
	sw $a1, 0($a0)



	li 	$a2, TRISG
	lw 	$a0, 0($a2)
	li 	$a1, CLEARCST
	and	$a0, $a0, $a1
	sw 	$a0, 0($a2)
	# chargement valeur LATG dans $a2
	li 	$a2, LATG
	lw 	$a0, 0($a2)
main_loop:
	# extinction LD4 (LATG6=0)
	li 	$a1, CLEARCST
	and 	$a0, $a0, $a1
	sw 	$a0, 0($a2)
	li 	$a3, DELAY
loop2:
	addi $a3, $a3,-1
	bgtz $a3, loop2
	# allumage LD4 (LATG6=1)
	li	$a1, SETCST
	or	$a0, $a0, $a1
	sw	$a0, 0($a2)
	li	$a3, DELAY
loop:
	addi $a3, $a3,-1
	bgtz $a3, loop
	b	main_loop
	.end main
