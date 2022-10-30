.data
	cad0: .asciiz "Introduzca un número entero: "
	cr: .byte 13,10,0 
.text
main:
	addi $v0, $zero, 4
	la $a0, cad0 
	syscall 
	# Se lee el primer número 
	addi $v0, $zero, 5

	subu $sp, $sp, 32
	sw $ra, 20($sp)
	sw $fp, 16($sp)
	addu $fp, $sp, 32
	li $a0, 3
	jal fact
	move $a0, $v0
	li $v0, 1
	
	syscall
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addu $sp, $sp, 32
	j $ra
	
	fact: subu $sp, $sp, 32
		sw $ra, 20($sp)
		sw $fp, 16($sp)
		addu $fp, $sp, 32
		sw $a0, 0($fp)
		lw $v0, 0($fp)
		bgtz $v0, L2
		li $v0, 1
		j L1
		
		L2: lw $v1, 0($fp)
		subu $v0, $v1, 1
		move $a0, $v0
		jal fact
		lw $v1, 0($fp)
		mul $v0, $v0, $v1
		
		L1: lw $ra, 20($sp)
		lw $fp, 16($sp)
		addu $sp, $sp, 32
		jr $ra
