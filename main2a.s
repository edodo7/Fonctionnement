TRISF=0xBF886140
LATF=0xBF886160
DELAY=10000000

	.text
	.globl main
	.ent main
main:
	# configuration RG6 en sortie
	li 	$a2, TRISF
	lw 	$a0, 0($a2)
	li 	$a1, 0xFFFFFFBF
	and	$a0, $a0, $a1
	sw 	$a0, 0($a2)
	# chargement valeur LATF dans $a2
	li 	$a2, LATF
	lw 	$a0, 0($a2)
main_loop:
	# extinction LD4 (LATF6=0)
	li 	$a1, 0xFFFFFFBF
	and 	$a0, $a0, $a1
	sw 	$a0, 0($a2)
	li 	$a3, DELAY
loop2:
	addi $a3, $a3,-1
	bgtz $a3, loop2
	# allumage LD4 (LATF6=1)
	li 	$a1, 0x00000040
	or 	$a0, $a0, $a1
	sw 	$a0, 0($a2)
	li 	$a3, DELAY
loop:
	addi $a3, $a3,-1
	bgtz $a3, loop
	b 	main_loop
	.end main
