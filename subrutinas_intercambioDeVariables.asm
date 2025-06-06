.data 	
	numero1: .asciiz "Numero 1: "
	numero2: .asciiz "Numero 2: "
	num1: .word 4
	num2: .word 2
	numaux: .word 0
	newline: .asciiz "\n"
	
.text
	li  $v0, 4
	la $a0, numero1
	syscall
	li  $v0, 1
	lw $a0, num1
	syscall
	li  $v0, 4
	la $a0, newline
	syscall
	li  $v0, 4
	la $a0, numero2
	syscall
	li  $v0, 1
	lw $a0, num2
	syscall
	li  $v0, 4
	la $a0, newline
	syscall
	
	lw $a0, num1
	lw $a1, num2
	jal intercambio
	j impresion
	
	intercambio:
		move $v0, $a0
		move $a0, $a1
		move $a1, $v0
		
		sw $a0, num1
		sw $a1, num2

		jr $ra
		
	impresion:
		li  $v0, 4
		la $a0, numero1
		syscall
		li  $v0, 1
		lw $a0, num1
		syscall
		li  $v0, 4
		la $a0, newline
		syscall
		la $a0, numero2
		syscall
		li  $v0, 1
		lw $a0, num2
		syscall
		li  $v0, 4
		la $a0, newline
		syscall
		j fin
		
	fin: 
		li $v0, 10
		syscall
		
	
	
	
	
	
	
	
	
	
	
	
	
	