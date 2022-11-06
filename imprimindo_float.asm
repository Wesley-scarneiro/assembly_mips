#	
#	Imprima a constante PI = 3.141592
#

.text
	lwc1 $f12, PI 		# Pega o float do endereço PI e guarda em f12 (registrador do coprocessador 1).
	li $v0, 2		# Faz o print de um float.
	syscall
	
	li, $v0, 10
	syscall
	
.data
	PI: .float 3.14159265	# Id da região da memória: tipo de dado, valor