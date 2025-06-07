.data
	n: .word 5
	casoBase: .word 1
	factoriall: .word 0
	stack: .space 400
	newline: .asciiz "\n"
	
.text
	
	lw $a0, n					#a0 n
	lw $a1, casoBase			#a1	n==1
	lw $a2, factoriall			#a2 		n!

	la $sp, stack

	addi $sp, $sp, 400
	
	#agregar espacio para los parametros de entrada y salida 2 entrada, 1 salida
	
	addi $sp, $sp, -16		#16fp	= variable de salida
	
	addi $fp, $sp, 0
	
	sw $a0, 8($fp)			#4fp dir de retorno - 8fp = n - 12fp n == 1 - 16fp = factorial
	sw $a1, 12($fp)
	sw $a2, 16($fp)
	
	#main
	sw $a0, 16($fp)
	jal factorial
	j fin
	
	factorial:
		sw $ra, 4($fp)
		if:	
			lw $a0, 8($fp)
			beq $a0, $a1, else
		then:
			sub $t9, $a0, 1		#t9 = n-1
			lw $t8, 16($fp)		#t8 = factorial
			mult $t8, $t9
			mflo $v0
			sw $v0, 16($fp)		# (n.n-1) --> v0
			sw $t9, 8($fp)
			j factorial
		else:
			li $v0, 1
			lw $a0, 16($fp)
			syscall
		endif:
			lw $ra, 4($fp)
			jr $ra
			
	fin:
		li $v0, 10
		lw $a0, 16($fp)
		syscall
