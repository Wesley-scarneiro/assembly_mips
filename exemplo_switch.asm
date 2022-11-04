#	Faça o seguinte programa:
#	
#	switch(a) {
#		case 0:
#			a++		
#			break
#		case 1:
#			a--		
#			break
#		case 2:
#			a = 0		
#			break
#		default:
#			a = -1

.text
li $t0, 5
beq $t0, 0, case0
beq $t0, 1, case1
beq $t0, 2, case2
li $t0, -1
j end

case0:
addi $t0, $t0, 1
j end

case1:
addi $t0, $t0, -1
j end

case2:
li $t0, 0
j end

end:
