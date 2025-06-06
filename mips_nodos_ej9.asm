.data 
	letraASacar: .word 'a'
	acceso: .word nodo1
	
	nodo5: .word 'e'
		.word 0 		#puntero a null
	nodo4: .word 'd'
		.word nodo5 
	nodo3: .word 'a'
		.word nodo4
	nodo2: .word 'c'
		.word nodo3
	nodo1: .word 'b'
		.word nodo2
	newline: .asciiz "\n"
.text
	la $s1, acceso #s1 direccion de los nodos
	lw $s1, 0($s1)		#valor del nodo
	lw $t6, letraASacar		#$t6 a tiene 'a'
	
	while: 
		beqz $s1, finw
	loop:
		beq $s1, $t6, esA		#compara si s1 es a
		j sumar
	finw:
		la $s1, acceso
		j muestra
	
	sumar:	
		la $s1, 4($s1)			#pasa el siguiente nodo
		lw $s1, 0($s1)			#le da a s1 el contenido del "siguiente" nodo, ahora actual
		j while
	esA: 
		beqz $s1, while
		
		la $s1, ($s1)			#s1 = dir del nodo actual
		la $s3, 4($t4)		#s3 dir del nodo siguiente
		
		lw $s2, 0($s3)		#s2 tiene el contenido del siguiente nodo
		lw $s5, 4($s3)		#s5 contiene el puntero al siguiente nodo del siguiente nodo
		
		sw $s2, 0($s1)		#reemplaza el contenido del nodo actual con el del siguiente
		sw $s5, 4($s1)		#reemplaza el puntero del actual con el del siguiente
		
		j esA
	muestra: 
		lw $s1, 0($s1)
		beqz $s1, fin
		li $v0, 4
		la $a0, 0($s1)
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		la $s1, 4($s1)
		j muestra
		
	fin: 
		li $v0, 10
		syscall
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	