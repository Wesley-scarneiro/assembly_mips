#	Faça o seguinte programa:
#	
#	a = 10
#	b = 15
#	if (a == b) a++
#	else a--

.text
li $t0, 10
li $t1, 15
beq $t0, $t1, true
addi $t0, $t0, -1
j end

true:
addi $t0, $t0, 1
j end

end:
