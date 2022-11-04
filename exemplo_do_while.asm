#	Faça o seguinte programa usando do...while:
#
#	a = 0
#	do {
#		a++
#	} while (a < 10)


.text

li $t0, 0

loop:
addi $t0, $t0, 1
beq $t0, 10, end
j loop

end: