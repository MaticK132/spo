arithr  START   0

        LDS     x
        LDT     y

        RMO     S,A
        ADDR    T,A
        STA     sum

        RMO     S,A
        SUBR    T,A
        STA     diff

        RMO     S,A
        MULR    T,A
        STA     prod

        RMO     S,A
        DIVR    T,A
        STA     quot

        MULR    T,A
        SUBR    A,S
        STS     mod

halt    J       halt

x       WORD    23
y       WORD    5
sum     RESW    1
diff    RESW    1
prod    RESW    1
quot    RESW    1
mod     RESW    1

        END     arithr