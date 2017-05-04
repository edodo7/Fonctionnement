.global main
.text
.ent main

main:

# configuration RG6 en sortie

	la $a0, TRISGCLR
	li $a1, 0x00000040
	sw $a1, 0($a0)

# configuration RD8 en entree
	la $a0, TRISDSET
	li $a1, 0x00000100
	sw $a1, 0($a0)
main_loop:

	# lit le port D
	la $a0, PORTD
	lw $a1, 0($a0)
# isole la valeur de RD8
	andi $a1, $a1, 0x00000100
	beq $a1, $zero, zero
one:
	la $a0, LATGSET
	li $a1, 0x00000040
	sw $a1, 0($a0)
	b main_loop
zero:
	la $a0, LATGCLR
	li $a1, 0x00000040
	sw $a1, 0($a0)
	b main_loop
.end main
