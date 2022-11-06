#
#	Escreva um código em Assembly que receba um número do tipo 
#	float do usuário e depois o imprima.
#
	
.data
	msg: .asciiz "Forneça um número decimal: "
	zero: .float 0.0 

.text
	# Imprimindo a mensagem para o usuário.
	la $v0, 4
	la $a0, msg
	syscall
	
	# Lendo o float fornecido, sempre recebido no $f0.
	li $v0, 6
	syscall
	
	# Repassando o valor de f0 para f12 e imprimindo.
	lwc1 $f12, zero
	add.s $f12, $f12, $f0
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall