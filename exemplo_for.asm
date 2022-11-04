#	Faça o seguinte programa usando for:
#
#	a = 0
#	for (i = 0; i < 10; i++) {
#		a += 2
#	}

.text

li $t0, 0	# i = 0
li $t1, 0	# a = 0

loop:
beq $t0, 10, end
addi $t1, $t1, 2
addi $t0, $t0, 1
j loop

end: