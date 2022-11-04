#	Faça o seguinte programa:
#	
#	a = 10
#	b = 15
#	if (a == b) a++
#	else a--

.text
li $t0, 15
li $t1, 15
bne $t0, $t1, true		# se verdadeiro
add $t0, $t0, 1			# se falso
j end

true:
addi $t0, $t0, -1
j end

end: