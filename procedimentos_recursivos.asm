############################################################
#	Traduza o seguinte programa para Assembly:	   #	
#							   #
#	fact(n) {					   #
#		if (n < 1) return 1			   #		
#		else return (n * fact(n-1))		   #	
#	}						   #
#							   #	
#	Imprima também o resultado do fatorial calculado.  #
############################################################

.text

li $a0, 10			# Argumento do procedimento fact().
jal fact

add $a0, $v0, $zero		# Imprimi o resultado retornado por fact().
li $v0, 1
syscall

li $v0, 10			# Encerra o programando, dando exit().
syscall

fact:
addi $sp, $sp, -8		# Preservando ra e a0.
sw $ra, 4($sp)
sw $a0, 0($sp)

slti $t0, $a0, 1		# Se a0 < 1 guarda 1 em t0, caso ao contrário guarda 0.
beq $t0, $zero, recursao
addi $v0, $zero, 1		# Valor de retorno de fact().
addi $sp, $sp, 8		# Removendo a pilha, não precisa fazer o pop, pois a0 e ra não são modificados se a0 < 1.
jr $ra

recursao:
addi $a0, $a0, -1
jal fact

lw $a0, 0($sp)			# Restaurando os valores de ra e a0, pois foram modificados na nova chamada.
lw $ra, 4($sp)
addi $sp, $sp, 8		# Removendo a pilha.
mul $v0, $a0, $v0		# Valor de retorno de fact()
jr $ra


###################################
#	Alguns testes:		  #
###################################
#	a0 = 5			  #	
#	120			  #
#-- program is finished running --#
###################################
#	a0 = 0			  #	
# 	1		  	  #	 
#-- program is finished running --#
###################################
#	a0 = 1			  #	
#	1			  #
#-- program is finished running --#
###################################
#	a0 = 10			  #
#	3628800			  #
#-- program is finished running --#
###################################
