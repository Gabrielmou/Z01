; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01

; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros]
;
INICIO:
    leaw $0,%A   ; define A como 0
    movw (%A),%S ; define S=RAM[0]
    leaw $1,%A   ; define A como 1
    subw %S, (%A), %D ; define D = RAM[0] - RAM[1]
    leaw $POSITIVO, %A ; define A como POSITIVO
    jge %D ; Se D é maior ou igual a zero pula pra A(POSITIVO)
    nop ;
NEGATIVO:
    leaw $1, %A ; define A como 1
    movw (%A), %S ; guarda em S o valor da RAM1 (S=RAM[1])
    leaw $END, %A; define A como END
    jmp ; pula pra A(END)
    nop ;
POSITIVO:
    leaw $0, %A ; define A como 0
    movw (%A),%S ; guarda em S o valor da RAM0 (S = RAM[0])
    leaw $END, %A ; define A como END
    jmp ; pula pra A (END)
    nop ; 
END: ; 
    leaw $2, %A ; define A como 2        
    movw %S,(%A); guarda S na RAM[2]

    
