	.global main
	.func main

main:
	BL _scanf
	MOV R1,R0
	BL _scanf
	MOV R2,R0
	BL count_part
	MOV R1,R0
	BL _printf
	BL main

count_part:
	PUSH {LR}
	CMP R1,#0
	MOVEQ R0,#1
	MOVLT R0,#0
	CMP R2,#0
	MOVEQ R0,#0
	BL _magic
	POP {LR}
	MOV PC,LR
_magic:
	PUSH {LR}
	MOV R3,R1
	SUB R1,R3,R2
	BL count_part
	MOV R4,R0
	MOV R1,R3
	SUB R2,R2,#1
	BL count_part
	POP {LR}
	MOV PC,LR

_scanf:
	PUSH {LR}
	SUB SP,SP,#4
	LDR R0,=format_str
	MOV R1,SP
	BL scanf
	LDR R0,[SP]
	ADD SP,SP,#4
	POP {LR}
	MOV PC,LR

_printf:
	PUSH {LR}
	LDR R0,=printf_str
	MOV R1,R1
	BL printf
	POP {LR}
	MOV PC,LR


.data
format_str:		.asciz		"%d"
printf_str:		.asciz		"%d\n"
