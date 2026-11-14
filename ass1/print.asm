print   START   0
        
        LDX     #0

zanka   TD      dev
        JEQ     zanka
        LDCH    txt,X
        WD      dev
        TIX     len
        JLT     zanka

halt    J       halt

dev     BYTE    X'AA'
txt     BYTE    C'SIC/XE'
        BYTE    X'0A'
len     WORD    7

        END     print