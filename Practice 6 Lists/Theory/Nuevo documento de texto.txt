ORG 1000H
NUM1 DB 150
NUM2 DB 10
RESUL DW ?
;_________________________________________________
; Subrutina SUB2
ORG 3000H
 SUB2: MOV DX, 0 ;Inicializo DX
 MOV BX, AX ;Paso la direccion de num1 a BX
 CMP BYTE PTR [BX], 0 ;Comparo num1 - 0
 JZ FIN ;Si num1 - 0 = 0 termina
 MOV BX, CX ;Paso la direccion de num2 a BX
 CMP BYTE PTR [BX], 0;Comparo num1 - 0
 JZ FIN ;Si num1 - 0 = 0 termina
 LAZO: MOV BX, AX ;Le paso la direccion de num1 a BX
 ADD DL, [BX] ;Sumo en DL num1
 ADC DH, 0 ;DH + el carry en caso de haber
 PUSH DX ;IP aumenta en 2 y SP baja en 2
 MOV BX, CX ;Le paso la direccion de num2 a BX
 MOV DL, [BX] ;Le paso el valor de num2 a DL
 DEC DL ;Declremento num2 en 1
 MOV [BX], DL ;A lo que apunta le paso num2 - 1
 POP DX ;IP aumenta en 2 y SP aumenta en 2 y libero el 96H a DX
 JNZ LAZO
FIN: RET
;_________________________________________________
; Programa principal
ORG 2000H
 MOV AX, OFFSET NUM1 ;Paso la direccion de num1 a AX
 MOV CX, OFFSET NUM2 ;Paso la direccion de num2 a CX
 CALL SUB2 ;Llamo a SUB2
 MOV RESUL, DX; Guarda el valor final de DX que es la multiplicacion
 HLT
END
;Este programa multiplica we