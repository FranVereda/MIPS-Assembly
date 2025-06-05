
.data	
numeros: .space 20
lineavacia: .asciiz "\n"

.text
.globl main
main: 
	addi $t6, $zero, 0		#index = $t6
	addi $s1, $zero, 5
	sub $s2, $zero, 6
	sub $s3, $zero, 9
	addi $s4, $zero, 3
	addi $s5, $zero, 7
	
	addi $t0, $zero, 0
	
	sw $s1, numeros($t0)
		addi $t0, $t0, 4
	sw $s2, numeros($t0)
		addi $t0, $t0, 4
	sw $s3, numeros($t0)
		addi $t0, $t0, 4
	sw $s4, numeros($t0)
		addi $t0, $t0, 4
	sw $s5, numeros($t0)
		addi $t0, $t0, 4
		
	la $t1, numeros		#$t1 tiene la dir de memoria de numeros
	
	li $t0, 0
	li $s2, 20
	
	while:
		slt $s2, $t0, $s2
		beq $t0, 20, finw		
		
	loop:
	
		lw $t3, 0($t1)		#$t3 tiene el valor de numeros[]
		
		
		if:
			slt $t7, $t3, $zero
			bne $t7, $zero, else
			
		then:	
			sub $t3, $t3, 1
			sw $t3, numeros($t0)
			li $t7, 0		#resetea el valor de t7 para la siguiente evaluacion
			addi $t1, $t1, 4
			addi $t0, $t0, 4
			j endif
		else:
			addi $t3, $t3, 1
			sw $t3, numeros($t0)
			li $t7, 0		#resetea el valor de t7 para la siguiente evaluacion
			addi $t1, $t1, 4
			addi $t0, $t0, 4
		endif:
		
		j while
	finw:
	
	li $t0, 0
	li $t1, 5
	
	la $t2, numeros
	
	j whilee
	
	whilee:
		beq $t0, 20, fin
		
		lw $t6, 0($t2)
		li $v0, 1
		move $a0, $t6
		syscall
		
		addi $t2, $t2, 4
		addi $t0, $t0, 4
		
		li $v0, 4
		la $a0, lineavacia
		syscall
		j whilee
		
		j whilee
							
			
			
	
					
fin: 
	li $v0, 10 
	syscall
