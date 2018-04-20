; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

POW:    
	leaw $R1,%A	
	movw (%A),%S
	movw (%A),%D
	decw %D

WHILE: 
	leaw $FINAL,%A
	je
	nop
	
	leaw $R1,%A
	addw %S,(%A),%A
	movw %A,%S
	decw %D
	leaw $WHILE,%A
	jmp
	nop

FINAL: 
	leaw $R0,%A
	movw %S,(%A)
