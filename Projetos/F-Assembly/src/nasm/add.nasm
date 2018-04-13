; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].

leaw $R0,%A ;Adicionando o valor de R0 em A
movw (%A),%S ;Adicionando o valor de A em S
leaw $R1,%A ;Adicionando o valor de R1 em A
movw (%A),%D
movw %D, %A
addw %S,%A,%A ;Somando e colocando o resultado em A
movw %A, %D
leaw $R3, %A
movw %D, (%A)
