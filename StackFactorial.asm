.data
	num1: .word 5
	num2: .word 1
	res: .word 0
	stack: .space 400
	newline: .asciiz "\n"
	
.text
	
	lw $t0, num1
	lw $t1, num2
	lw $t2, res

	la $sp, stack

	addi $sp, $sp, 400
	
	#agregar espacio para los parametros de entrada y salida 2 entrada, 1 salida
	
	addi $sp, $sp, -16		#16fp	= variable de salida
	
	addi $fp, $sp, 0
	
	sw $t0, 8($fp)			#4fp = direccion de retorno
	sw $t1, 12($fp)
	sw $t2, 16($fp)
	
	#main
	
	jal factorial
	j fin
	
	factorial:
		sw $ra, 4($fp)
		sw $t0, 16($fp)
		while:
			lw $a0, 8($fp)		#a0 tiene el n
			beq $a0, $t1, finw			#se va  a ir guardando el factorial en 16fp
		loop:
			lw $a0, 8($fp)
			sub $t9, $a0, 1		#t9 tiene el n-1
			lw $s3, 16($fp)
			mult $s3, $t9
			mflo $t8			#t8 tiene el producto de n x n-1
			sw $t8, 16($fp)
			sw $t9, 8($fp)		#n = n-1
			j while
			
		finw:
			jal esUno
			jr $ra
	
	esUno:
		lw $ra, 4($fp)
		li $v0, 1
		lw $a0, 16($fp)
		syscall
		jr $ra
	
	fin:
		li $v0, 10
		syscall
