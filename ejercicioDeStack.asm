.data 
	num1: .word 3
	num2: .word 5
	newline: .asciiz "\n"
	cont: .word 0
	
	
.text
	
	#ingresar los numeros a los registros
	
	lw $s1, num1
	lw $s2, num2
	
	
	#cargar los numeros en el stack
	jal darLugar
	sw $s1, 0($sp)
	jal darLugar
	sw $s2, 0($sp)

	jal multiplicacion
	

	#multiplicacion
	multiplicacion:
		#le doy los valores de x e y
		lw $t0, 0($sp)		#valor de y = t0
		jal quitarLugar
		lw $t1, 0($sp)		#valor de x = t1
		jal darLugar		#retorno al tope de la pila
		
		lw $t2, cont		#t2 = i
		
		while:
			lw $t0, 0($sp)		#estoy en el iltimo lugar de la pila/ actualizado cada vez que se llama a while
			ble $t0, $zero, finw
			
		loop:
			add $a1, $zero, $t2		#a1 tiene el acumulador
			add $a0, $zero, $t1		#a0 tiene el valor de x
			
			jal suma
			add $t2, $t2, $v0
			sub $t0, $t0, 1
			sw $t0, 0($sp)
			j while
		
		finw:
			jal imprimir
			j fin
	
	#funcion suma
	suma: 
		li $v0, 0
		#a0 deberia tener el valor de x
		add $v0, $a1, $a0			#a1 el cont
		jr $ra		#v0 va a tener el resultado de la suma
		
		
	#dar lugar a la pila
	darLugar:
		sub $sp, $sp, 4
		jr $ra
		
	#borrar lugar de la pila
	quitarLugar:
		addi $sp, $sp, 4
		jr $ra
	
	#imprimir un numero
	imprimir:
		#add $t7		#t7 tiene el valor de a0
		li $v0, 1
		#add $a0, $zero, $t7
		add $a0, $zero, $a1
		syscall
		jr $ra
	fin:
		li $v0, 10
		syscall
	
	
	
	
	
	