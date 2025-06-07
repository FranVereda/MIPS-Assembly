.data
	num1: .word 5
	num2: .word 5
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
	move $fp, $sp		#8-12 variables de entrada
	
	sw $t0, 8($fp)			#4fp = direccion de retorno
	sw $t1, 12($fp)
	sw $t2, 16($fp)
	
	#main
	
	jal multiplicacion
	
	lw $a0, 16($fp)
	li $v0, 1
	syscall
	
	
	j fin
	
	multiplicacion:
		sw $ra, 4($fp)		#guardo la direccion de retorno
		while:
			lw $t7, 12($fp) 		#t7 tiene el numero actualizado de 12fp = numero de recursiones
			beq $t7, $zero, finw
		loop:
			
			lw $a0, 16($fp)		#a0 = acumulador
			lw $a1, 8($fp)			#a1 = x
			
			jal suma
			
			sub $t7, $t7, 1
			sw $t7, 12($fp)
			j while
		finw:
			lw $ra, 4($fp)
			jr $ra		
	
	suma:
		lw $s5, 16($fp)
		add $v0, $a0, $a1		#suma x al acumulador _ retorna en v0 el valor del i+a
		sw $v0, 16($fp)		#actualiza el valor del acumulador
		
		jr $ra

	fin:
		li $v0, 10
		syscall
