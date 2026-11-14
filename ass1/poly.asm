poly    START   0

        LDA     x

        MUL     x
        STA     x2

        MUL     x
        STA     x3

        MUL     x
        STA     x4

        LDS     x3
        LDT     #2
        MULR    T,S
        ADDR    S,A

        LDS     x2
        LDT     #3
        MULR    T,S
        ADDR    S,A

        LDS     x
        LDT     #4
        MULR    T,S
        ADDR    S,A

        LDT     #5
        ADDR    T,A

        STA     rez

halt    J       halt

x       WORD    2
x2      RESW    1
x3      RESW    1
x4      RESW    1
rez     RESW    1
      
        END     poly