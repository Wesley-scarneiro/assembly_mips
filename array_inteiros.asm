#	
#	Traduza o seguinte programa em C para Assembly:
#	
#	int n = 10;
#	int array[n];
#	int i;
#	for (i = 0; i < n, i++) {
#	
#		 array[i] = 1 + i;
#		 printf("%d ", array[i]);
#	}
#	 


.data
	array:
		.align 2	# Tipo inteiro.
		.space 40	# Tamanho do array (10 inteiros = 4*10)
	space:
		.asciiz " "
		
.text

	move $t0, $zero		# Índice do array, cresce de 4 em 4 bytes.
	move $t1, $zero		# Valor a ser copiado para uma posição do array.
	li $t2, 40		# Tamanho do array.
	
	# Escrevendo os valores no array.
	write:
		beq $t0, $t2, print
		addi $t1, $t1, 1 
		sw $t1, array($t0)
		addi $t0, $t0, 4
		j write
	
	# Imprimindo os valores do array.
	print:
		move $t0, $zero
		print_loop:
			beq $t0, $t2, end
		
			li $v0, 1		# Operação de imprimir um inteiro.	
			lw $a0, array($t0)
			syscall
		
			addi $t0, $t0, 4	# Incrementando o índice para próxima impressão. 
		
			li $v0, 4		# Imprime o espaçamento.
			la $a0, space
			syscall
		
			j print_loop		# Retornando ao início do laço.
		
	end:
		li $v0, 10
		syscall

#	
#	Saída:
#	1 2 3 4 5 6 7 8 9 10 
# -- program is finished running --
#	
	
	
	
	
	
	
	
	
	
	
			