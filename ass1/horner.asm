horner  START   0

        LDS     x

        RMO     S,A
        ADD    #2

        MULR    S,A
        ADD    #3

        MULR    S,A
        ADD    #4

        MULR    S,A
        ADD    #5

        STA     rez

halt    J       halt

x       WORD    2
rez     RESW    1

        END     horner