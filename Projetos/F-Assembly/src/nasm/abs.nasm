; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

INICIO:

	leaw $R1 ,%A ;Salva o local de R1 em A
	movw (%A),%D ;Salva o valor de Ram[A] em D

IF:
	leaw $END,%A ;Passa a direcao do salto de A
	jg %D        ;Salta se D > 0
	nop

	negw %D      ;D = -D
	leaw $IF,%A  ;Faz o comando voltar para o comeco do IF
	jmp
	nop

END:
	leaw $R0,%A ;Salva o local de R0 em A
	movw %D,(%A);Salva o valor de D na Ram 0
