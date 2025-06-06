.data 
	varA: .word 7
	var4: .word 4
	var2: .word 2
.text
	
	lw $a0, varA
	lw $a1, var4
	lw $a2, var2
	
	jal check
	j fin
	
	check: 
		andi $t0, $a0, 1
		beq $t0, $zero, esPar
		sll $a0, $a0, 2			#multiplica por 4
		addi $a0, $a0, 1
		add $v0, $zero, $a0
		jr $ra
		
	esPar:
		div $a0, $a2
		mflo $a0
		add $v0, $zero, $a0
		jr $ra
	
	fin:
		add $a0, $zero, $v0
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
