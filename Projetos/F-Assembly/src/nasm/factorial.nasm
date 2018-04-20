; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.
;
	

leaw $0, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)
movw (%A), %S
decw %S
leaw $2, %A
movw %S, (%A)
leaw $3, %A
movw (%A), %D
leaw $1, %A 		   ;init loop multi
addw (%A), %D, %D      
decw %S
leaw $10, %A
jg %S
nop
leaw $1, %A
movw %D, (%A)
leaw $2, %A
movw (%A), %S
decw %S
movw %S, (%A)
leaw $8, %A
jg %S
nop
leaw $1, %A
movw %D, (%A)
leaw $33, %A
jg %D
nop
incw %D
leaw $1, %A
movw %D, (%A)
