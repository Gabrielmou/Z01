; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide o número posicionado na RAM[1] pelo número posicionado no RAM[2] e armazena o resultado na RAM[0].

INICIO:
    leaw $R1, %A
    movw (%A), %S; S = RAM[1]

    ;leaw %R2,%A  
    ;movw (%A),%D ; D = RAM[2]
WHILE:
    movw %S,%D

    leaw $R2, %A
    subw %S,(%A),%S

    leaw $WHILE, %A

    jge %S
    nop

    leaw $0,%A
    movw %D,(%A)