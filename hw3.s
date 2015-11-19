	.global main
	.func main

main:
	MOV R0,#0
	BL _scanf
	MOV R1,R0
	PUSH {R1}
	BL _scanf
	MOV R2,R0
	POP {R1}
	BL count_part
	MOV R3,R2
	MOV R2,R1
	MOV R1,R0
	BL _printf
	BL main

count_part:
	PUSH {LR}
	CMP R1,#0
	MOVEQ R0,#1
	POPEQ {PC}
	MOVLT R0,#0
	POPLT  {PC}
	CMP R2,#0
	MOVEQ R0,#0
	POPEQ {PC}
	PUSH {R2}
	PUSH {R1}
	SUB R1,R1,R2
	BL count_part
	MOV R4,R0
	POP {R1}
	PUSH {R4}
	SUB R2,R2,#1
	BL count_part
	MOV R5,R0
	POP {R4}
	POP {R2}
	ADD R0,R4,R5
	POP {PC}


_scanf:
	PUSH {LR}
	SUB SP,SP,#4
	LDR R0,=format_str
	MOV R1,SP
	BL scanf
	LDR R0,[SP]
	ADD SP,SP,#4
	POP {PC}


_printf:
	PUSH {LR}
	LDR R0,=printf_str
	MOV R1,R1
	BL printf
	POP {PC}



.data
format_str:		.asciz		"%d"
printf_str:		.asciz		"There are %d partitions of %d using integers up to %d\n"
