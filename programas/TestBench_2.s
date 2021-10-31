.data

TEST:	.space 4

.text

	lui t0,0x12345		#testa lui
	lui t1,0x12345
	auipc a1,0
	jal COMP
	nop
	nop
	nop

	addi t0,zero,2		#testa addi
	addi t1,zero,2
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	auipc t0,0		#testa auipc
	lui t1,0x00400
	nop
	nop
	nop
	addi t1,t1,0x038
	auipc a1,0
	jal COMP
	nop
	nop
	nop

	addi t0,zero,3		#testa slli
	nop
	nop
	nop
	slli t0,t0,1
	addi t1,zero,6
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,-1		#testa slti
	nop
	nop
	nop
	slti t0,t0,1
	addi t1,zero,1
	auipc a1,0
	jal COMP
	nop
	nop
	nop

	addi t0,zero,1		#testa sltiu
	nop
	nop
	nop
	sltiu t0,t0,-1
	addi t1,zero,1
	auipc a1,0
	jal COMP
	nop
	nop
	nop

	addi t0,zero,0x0F	#testa xori
	nop
	nop
	nop
	xori t0,t0,0x0C
	addi t1,zero,3
	auipc a1,0
	jal COMP
	nop
	nop
	nop

	addi t0,zero,0x03	#testa ori
	nop
	nop
	nop
	ori t0,t0,0x0C
	addi t1,zero,0x0F
	auipc a1,0
	jal COMP
	nop
	nop
	nop

	addi t0,zero,0xF	#testa andi
	nop
	nop
	nop
	andi t0,t0,1
	addi t1,zero,1
	auipc a1,0
	jal COMP
	nop
	nop
	nop

	lui t1,0xF0CAF		#testa sw e lw
	nop
	nop
	nop
	addi t1,t1,0x0FA
	lui t2,0x10010
	nop
	nop
	nop
	sw t1,0(t2)
	lw t0,0(t2)
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,2		#testa add
	addi t2,zero,3
	nop
	nop
	nop
	add t0,t0,t2
	addi t1,zero,5
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,5		#testa sub
	addi t2,zero,3
	nop
	nop
	nop
	sub t0,t2,t0
	addi t1,zero,-2
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,3		#testa sll
	addi t2,zero,1
	nop
	nop
	nop
	sll t0,t0,t2
	addi t1,zero,6
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,-1		#testa slt
	addi t2,zero,1
	nop
	nop
	nop
	slt t0,t0,t2
	addi t1,zero,1
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,1		#testa sltu
	addi t2,zero,-1
	nop
	nop
	nop
	sltu t0,t0,t2
	addi t1,zero,1
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,0x0F	#testa xor
	addi t2,zero,0x0C
	nop
	nop
	nop
	xor t0,t0,t2
	addi t1,zero,3
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,0x03	#testa or
	addi t2,zero,0x0C
	nop
	nop
	nop
	or t0,t0,t2
	addi t1,zero,0x0F
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	
	addi t0,zero,0xF	#testa and
	addi t2,zero,1
	nop
	nop
	nop
	and t0,t0,t2
	addi t1,zero,1
	auipc a1,0
	jal COMP
	nop
	nop
	nop
	addi a0,zero,0x0CC
	
	
FIM:
	jal FIM	
	nop
	nop
	nop

ERRO:
	addi a0,zero,0x0EE
	jal FIM
	nop
	nop
	nop

	
COMP:
	beq t0,t1,OK
	nop
	nop
	nop
	jal ERRO
	nop
	nop
	nop
OK:
	jalr zero,ra,0
	nop
	nop
	nop
	
