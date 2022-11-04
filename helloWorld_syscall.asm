.text
la $a0, print 	# instrução que será executada pelo SO
li $v0, 4    	# tipo de operação que o SO irá fazer com a instrução em a0
syscall

.data
print: .asciiz "Olá, mundo!"       # diretiva que indica ao SO que imprima a string no código ASCII
