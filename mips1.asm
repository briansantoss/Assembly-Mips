.data

	msg: .asciiz "Ola, Mundo!"
.text

	li $v0, 4
	la $a0, msg
	syscall