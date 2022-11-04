#	Faça o seguinte programa usando while:
#
#	a = 0
#	while (a < 10) {
#		a++
#	}


.text

li $t0, 0

loop:
beq $t0, 10, end
addi $t0, $t0, 1
j loop

end: