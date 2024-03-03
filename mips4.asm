.data
	msg: .asciiz "Elementos vetor: "
	espaco: .byte ' '
	vetor:
		.align 2
		.space 16
.text
	move $t0, $zero # Inicializando o registrador que vai servir de indice
	li $t1, 1 # Inicializando o registrador que vai servir como contador para parar o laco/loop
	
	loopEntrar:
		bgt $t1, 4, saidaLoop # Condicao de saida do loop
		li $v0, 5 # Configgurando o valor adequado no registrador v0 para realizar o servico desejado, no caso, pegar uma entrada do usuario
		syscall
		sw $v0, vetor($t0) # Carregando o conteudo do registrador v0, no caso, o inteiro inserido pelo usuario, para o vetor na sua posicao adequada
		addi $t0, $t0, 4
		addi $t1, $t1, 1
		j loopEntrar
	saidaLoop:
		# Imprimindo a mensagem
			li $v0, 4
			la $a0, msg
			syscall
		# Segemento usado para a imprimir os elementos do vetor
			move $t0, $zero
			li $t1, 1
			loopImprimir:
				bgt $t1, 4, fimPrograma # Condicao de saida do loop
				li $v0, 1
				lw $t2, vetor($t0)
				move $a0, $t2
				syscall
				li $v0, 4
				la $a0, espaco
				syscall
				addi $t0, $t0, 4
				addi $t1, $t1, 1
				j loopImprimir
		fimPrograma:
	