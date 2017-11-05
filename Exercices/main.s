main:
	li $t0, 0 # sum
	li $t1, 0 # i
	li $t2, 5 # num
	li $t3, 1 # pow
	li $t4, 2
	
for:
	beq $t1, $t2, end_loop
	addi $t0, $t0, 1 # sum = sum + 1
	addi $t1, $t1, 1 # i = i + 1
	mult $t3, $t4
	mflo $t3
	j for

end_loop: