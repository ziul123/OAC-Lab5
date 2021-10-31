# Comentar e descomentar! Vetor e SHOW

.eqv N 32

.data
#Vetor:  .word 9,2,5,1,8,2,4,3,6,7,10,2,32,54,2,12,-6,3,1,78,54,23,1,54,2,65,3,6,55,31,4,-4
Vetor: .space 1

.text	
MAIN:   jal INICIALIZA
	nop
	nop
	nop
	
	mv a0,zero
	lui a0,0x10010
	li a1,N
	#jal SHOW
	jal SHOW2
	nop
	nop
	nop

	mv a0,zero
	lui a0,0x10010
	li a1,N
	jal SORT
	nop
	nop
	nop

	mv a0,zero
	lui a0,0x10010
	li a1,N
	#jal SHOW
	jal SHOW2
	nop
	nop
	nop


	#li a7,10
	#ecall
FINAL:	jal FINAL
	nop
	nop
	nop

SWAP:	slli t1,a1,2
	add t1,a0,t1
	lw t0,0(t1)
	lw t2,4(t1)
	nop
	sw t2,0(t1)
	sw t0,4(t1)
	ret
	nop
	nop
	nop

SORT:	addi sp,sp,-20
	sw ra,16(sp)
	sw s3,12(sp)
	sw s2,8(sp)
	sw s1,4(sp)
	sw s0,0(sp)
	mv s2,a0
	mv s3,a1
	mv s0,zero
for1:	bge s0,s3,exit1
	nop
	nop
	nop
	addi s1,s0,-1
for2:	blt s1,zero,exit2
	nop
	nop
	nop
	slli t1,s1,2
	add t2,s2,t1
	lw t3,0(t2)
	lw t4,4(t2)
	nop
	bge t4,t3,exit2
	nop
	nop
	nop
	mv a0,s2
	mv a1,s1
	jal SWAP
	nop
	nop
	nop
	addi s1,s1,-1
	j for2
	nop
	nop
	nop
exit2:	addi s0,s0,1
	j for1
	nop
	nop
	nop
exit1: 	lw s0,0(sp)
	lw s1,4(sp)
	lw s2,8(sp)
	lw s3,12(sp)
	lw ra,16(sp)
	addi sp,sp,20
	ret
	nop
	nop
	nop

SHOW2:	mv t0,a0
	mv t1,a1
	mv t2,zero
loop12: beq t2,t1,fim12
	nop
	nop
	nop
	lw a0,0(t0)		# mostra elemento do vetor em a0
	addi t0,t0,4
	addi t2,t2,1
	mv a1,t2		# mostra a posi��o do elemento em a1
	j loop12
	nop
	nop
	nop
fim12:	ret	
	nop
	nop
	nop
	


INICIALIZA:       # Inicializa a RAM de dados com o vetor a partir do endere�o 0x10010000
#Vetor:  .word 9,2,5,1,8,2,4,3,6,7,10,2,32,54,2,12,-6,3,1,78,54,23,1,54,2,65,3,6,55,31,4,-4
	mv t0,zero
	lui t0,0x10010
	li a0,9
	sw a0,0(t0)
	li a0,2
	sw a0,4(t0)	
	li a0,5
	sw a0,8(t0)
	li a0,1
	sw a0,12(t0)
	li a0,8
	sw a0,16(t0)
	li a0,2
	sw a0,20(t0)	
	li a0,4
	sw a0,24(t0)
	li a0,3
	sw a0,28(t0)	
	li a0,6
	sw a0,32(t0)
	li a0,7
	sw a0,36(t0)	
	li a0,10
	sw a0,40(t0)
	li a0,2
	sw a0,44(t0)	
	li a0,32
	sw a0,48(t0)
	li a0,54
	sw a0,52(t0)	
	li a0,2
	sw a0,56(t0)
	li a0,12
	sw a0,60(t0)	
	li a0,-6
	sw a0,64(t0)
	li a0,3
	sw a0,68(t0)	
	li a0,1
	sw a0,72(t0)
	li a0,78
	sw a0,76(t0)	
	li a0,54
	sw a0,80(t0)
	li a0,23
	sw a0,84(t0)	
	li a0,1
	sw a0,88(t0)
	li a0,54
	sw a0,92(t0)	
	li a0,2
	sw a0,96(t0)
	li a0,65
	sw a0,100(t0)	
	li a0,3
	sw a0,104(t0)
	li a0,6
	sw a0,108(t0)	
	li a0,55
	sw a0,112(t0)
	li a0,31
	sw a0,116(t0)	
	li a0,4
	sw a0,120(t0)
	li a0,-4
	sw a0,124(t0)	

	ret
	nop
	nop
	nop
