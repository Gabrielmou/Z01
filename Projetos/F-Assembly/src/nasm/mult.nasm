; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]
INICIO:
    leaw $0, %A   ; define A como 0
    movw (%A), %D ; define S=RAM[0]
    leaw $1, %A   ; define A como 1
    movw (%A), %S ; define D=RAM[1]
WHILE:
    leaw $END, %A ;
    je
    nop
    leaw $1, %A
    addw (%A), %S, %S
    decw %D
    leaw $WHILE, %A
    jmp
    nop 
END: ; 
    leaw $3, %A ; define A como 3       
    movw %S,(%A); guarda S na RAM[3]