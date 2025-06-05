.data 
	numeros: .half 1,2,3,4,5
	res: .half 0

.text
	li $s7, 5		#tope
	
	addi $t2, $zero, 0
	la $s1, numeros		#direccion de memoria de numeros
	
	while:
		slt $t7, $zero, $s7
		bne $t7, 1, fin
		
	loop:
		lh $t0, 0($s1)		#toma el valor de numeros en t0
		
		add $t2, $t2, $t0
		addi $s1, $s1, 2		#mueve al siguiente valor del arreglo
		
		sub $s7, $s7, 1
		j while
	fin: 
		sh  $t2, res
		li $v0, 1
		move $a0, $t2
		syscall
		li $v0, 10
		syscall
		