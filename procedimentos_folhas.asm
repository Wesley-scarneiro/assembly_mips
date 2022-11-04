#	Traduza o seguinte procedimento (função) para Assembly:
#	
#       a = 10, b = 5, c = 3, d = 10
#	int soma (a, b, c, d) {
#		e = (a+b) + (c+d)
#		return e
#	}
#	imprima o resultado do retorno do procedimento.		
#
#	Para exercícitar a manipulação de pilhas, considere que todos os registradores
#	to tipo t e s precisam ser preservados se forem manipulados pelo procedimento.
#       Obs.: Os procedimentos sempre devem preservar os valores dos registradores que o
#	caller pode precisar em algum outro momento. 

.text

li $a0, 10		# Inicializando os argumentos do procedimento.
li $a1, 5
li $a2, 3
li $a3, 10
jal soma		# Chamando o procedimento, guarda em $ra o endereço da instrução seguinte ao jal.

add $a0, $v0, $zero	# Chamando o SO para imprimir o resultado guardado em $v0.
li $v0, 1
syscall

li $v0, 10		# Encerra o programa.
syscall

soma:
addi $sp, $sp, -12	# Criando uma pilha para preservar t0, t1 e s0 (push); escreve os conteúdos na memória.
sw $t0, 8($sp)		# Base da pilha.
sw $t1, 4($sp)
sw $s0, 0($sp)		# Topo da pilha, no qual sp sempre aponta.

add $t0, $a0, $a1
add $t1, $a2, $a3
add $s0, $t0, $t1
add $v0, $s0, $zero

lw $s0, 0($sp)		# Restaurando os registradores t0, t1 e s0 (pop); lê os conteúdos da memória.
lw $t1, 4($sp)
lw $t0, 8($sp)
jr $ra			# Término do procedimento (callee), retorna o resultado para o caller.

#	Saída:
#	28
# -- program is finished running --
