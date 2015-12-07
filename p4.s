	.global main
	.func main

main:

	BL _scanf
	VMOV S0, R0
	BL _scanf
	VMOV S1,R0
	BL _divide
_divide:
	VDIV.F32 S2,S0,S1
	VCVT.F64.F32 D4,S2
	VMOV R1,R2,D4
	BL _printf_result
	B main
	
_scanf:
	PUSH {LR}
	SUB SP,SP,#4
	LDR R0,=format_str
	MOV R1,SP
	BL scanf
	LDR R0,[SP]
	ADD SP,SP,#4
	POP {PC}
_printf_result:
	PUSH {LR}
	LDR R0, =result_str
	BL printf
	POP {PC}
	


.data
format_str:         .asciz       "%d"
printf_str:        .asciz       "%d / %d"
result_str:       .asciz         "%f\n"
