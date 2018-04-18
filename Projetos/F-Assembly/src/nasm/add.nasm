; Arquivo: add.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; 2018 @ Rafael Corsi

; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].

leaw $R1,%A      ;A=R1

movw (%A),%S     ;S=ram[A]=ram[1]



leaw $R0,%A      ;A=R0



addw %S,(%A),%D  ;D=S+ram[A]=S+ram[0]



leaw $R2,%A      ;A=R2

movw %D,(%A)     ;ram[A]=ram[3]=D
