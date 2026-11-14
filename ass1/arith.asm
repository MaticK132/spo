arith   START   0

        LDA     x
        ADD     y
        STA     sum
        
        LDA     x
        SUB     y
        STA     diff

        LDA     x
        MUL     y
        STA     prod

        LDA     x
        DIV     y
        STA     quot

        LDA     quot
        MUL     y
        STA     mod
        LDA     x
        SUB     mod
        STA     mod

halt    J       halt   

x       WORD    23
y       WORD    5
sum     RESW    1
diff    RESW    1
prod    RESW    1
quot    RESW    1
mod     RESW    1

        END     arith