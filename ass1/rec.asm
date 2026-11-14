rec     START   0

        +LDA    #stk
        STA     sp

main    JSUB    read    . A <- preberi število
        COMP    #0
        JEQ     halt    . zaključi ko prebereš 0
        JSUB    fact    . A <- A!
        JSUB    print   . izpiši rezultat <- A!
        J       main   

halt    J       halt

read    CLEAR   S
        LDT     #10
rloop   CLEAR   A
        RD      fa
        COMP    #13     . prebral CR
        JEQ     rloop
        COMP    #10     . prebral LF
        JEQ     rend
        SUB     #48     . znak - '0' = števka
        MULR    T,S     . S *= 10
        ADDR    A,S     . S += števka -> sestavljamo število
        J       rloop
rend    RMO     S,A     . A = število
        RSUB

push    STA     @sp     . shrani A na sklad
        LDA     sp
        ADD     #3
        STA     sp
        RSUB

pop     LDA     sp      . vzemi iz sklada in shrani v A
        SUB     #3
        STA     sp
        LDA     @sp
        RSUB

fact    COMP    #2
        JLT     fone    . če računamo faktoriel za 1 ali 0
        RMO     A,S
        RMO     L,A
        JSUB    push    . shrani L na sklad
        RMO     S,A
        JSUB    push    . shrani A na sklad
        RMO     S,A     . ker push pokvari A
        SUB     #1
        JSUB    fact    . rekurzija izračuna (n - 1)!
        RMO     A,S     . S = (n - 1)!
        JSUB    pop     . A = n
        MULR    S,A
        RMO     A,S     . shrani rezultat v S
        JSUB    pop     . stari L
        RMO     A,L
        RMO     S,A     . rezultat nazaj v A
        RSUB

fone    LDA     #1      . faktoriel za 0 in 1
        RSUB

print   RMO     A,S
        LDT     #10
        CLEAR   X
pload   RMO     S,A     . nalaganje števila v buffer po števkah
        DIVR    T,A     . A /= 10
        RMO     A,B     . shrani naslednje število za obdelavo v B
        MULR    T,A     . A *= 10 ; zadnja števka se 'izgubi' zaradi deljenja
        SUBR    A,S     . S = zadnja števka
        RMO     S,A
        ADD     #48     . zadnja števka + '0' -> znak
        STCH    buf,X   . dodamo v buffer
        TIXR    T       . X++
        RMO     B,S     . S = naslednje število
        RMO     S,A
        COMP    #0      . naslednje število > 0 ?
        JGT     pload
pout    RMO     X,A     . print števila v buffer
        SUB     #1
        RMO     A,X     . X--
        LDCH    buf,X
        WD      out
        RMO     X,A
        COMP    #0      . X > 0 ?
        JGT     pout
        LDA     #10     . print new line
        WD      out
        RSUB

fa      BYTE    X'FA'
out     BYTE    1
buf     RESB    8
sp      RESW    1           . kazalec na vrh sklada
stk     RESW    100         . prostor za sklad

        END     rec