.data

	numero1: .space 4
	numero2: .space 4
	tope: .space 4
	res: .space 12
.text
	addi $s0, $zero, 5
	addi $s1, $zero, 5
	addi $s2, $zero, 5
	
	sw $s0, numero1		
	sw $s1, numero2
	sw $s2, tope
	
	lw $t0, numero1		#t0 tiene numero1 y t1 tiene el num2
	lw $t1, numero2
	lw $t4, tope
	lw $t3, res			#t3 para calcular el resultado
	
	
	while:
		slt $t7, $zero, $t4
		beq $t7, 0, finw
	loop:
		add $t3, $t3, $t0
		sub $t4, $t4, 1
		j while
	finw:
		sw $t3, res
		li $v0, 1
		lw $a0, res
		syscall
		j fin
fin: 
	li $v0, 10 
	syscall