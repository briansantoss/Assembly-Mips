.data
	espaco: .byte  ' '
.text
	li $a0, 1
	
	for:
		li $v0, 1
		syscall
		move $t0, $a0
		la $a0, espaco
		li $v0, 4
		syscall
		move $a0, $t0
		addi $a0, $a0, 1
		ble $a0, 100, for
	fim:
	
