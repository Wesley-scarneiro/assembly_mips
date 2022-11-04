#	Faça o seguinte programa em Assembly
#	a = 10
#	b = 20
#	c = 10
#	d = (a*b) + c
#	Imprima o resultado de d

.text
li $t0, 10
li $t1, 20
li $t2, 10
mul $t3, $t0, $t1
add $t3, $t3, $t2

la $a0, print
li $v0, 4
syscall

resultado:
la $a0, ($t3)			# Quando for um endereço não precisa de parênteses. Quando for um inteiro, precisa. 
li $v0, 1
syscall

.data
print: .asciiz "Total = "


