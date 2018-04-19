; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.
;





INICIO:
	leaw $R0, %A;
	movw (%A), %D; Define D = Ram[0]
	movw %D, %S
	decw %D
	movw %D, (%A)

	leaw $R1, %A;
	movw (%A), %S; Define S = Ram[1]

WHILE:
	leaw $END, %A;
	jg
	nop
	
	leaw $1, %A
	addw (%A), %S, %S
	decw %D
	leaw $WHILE, %A
	jmp
	nop


END: ;
	leaw $1, %A; define A como 1
	movw %S, (%A); guarda S na Ram[1]





