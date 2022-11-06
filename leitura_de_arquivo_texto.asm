#
#	Faça um programa que leia os dados de um arquivo.txt e os imprima na tela.
#	Comente as operações de abertura, leitura e fechamento do arquivo.
#

.data
	localArquivo: .asciiz "C:/Users/wesle/Desktop/ler.txt"
	conteudoArquivo: .space 1024

.text
	# Operação de abertura do arquivo.
	# Abrindo o arquivo no modo leitura. Em a0 guardamos 0 para leitura.
	# O descritor, o ponteiro do arquivo, ficara em $v0.
	# Salvamos o descritor em s0 para uso no fechamento do arquivo.
	li $v0, 13
	la $a0, localArquivo
	li $a1, 0
	syscall
	move $s0, $v0
	
	# Operação para leitura do arquivo.
	# Com o descritor do arquivo obtido, agora realizamos a leitura do conteúdo.
	# É necessário passar o descritor, o endereço do buffer que armazenará o conteúdo
	# do arquivo e o seu tamanho (bytes), para os argumentos da chamada ao SO.
	li $v0, 14
	move $a0, $s0
	la $a1, conteudoArquivo
	li $a2, 1024
	syscall
	
	# Operação para a impressão do arquivo.
	li $v0, 4
	move $a0, $a1
	syscall
	
	# Operação de fechamento do arquivo.
	li $v0, 16
	move $a0, $s0
	syscall
	
	# Encerramento do programa (exit).
	li $v0, 10
	syscall

#
#	Saída:
#	Hello World!
# -- program is finished running --
#
