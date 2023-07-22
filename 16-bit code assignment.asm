;PROGRAM TO ADD TWO 16-BIT DATA (METHOD-1)

DATA SEGMENT          ;Assembler directive
    org 1104h         ;Assembler directive
    sum DW 0          ;Assembler directive
    Carry DB 0        ;Assembler directive
    
DATA ENDS             ;Assembler directive

CODE SEGMENT          ;Assembler directive
    ASSUME CS:CODE    ;Assembler directive
    ASSUME DS:DATA    ;Assembler directive
    ORG 1000h         ;Assembler directive
    
    MOV AX,239BH            ;Load the first data in AX register
    MOV BX,459CH            ;Load the second data in BX register
    MOV CL,00H              ;Clear the CL register for carry
    SUB AX,BX               ;Subtract the two data, subtraction will be in AX
    MOV SUM,AX              ;Store the sum in memory location (1104h)
    JNC AHEAD               ;Check the status of the carry flag
    INC CL                  ;If carry flag is set, increment CL by one
AHEAD:    MOV CARRY, CL     ;Store the carry in memory location (1106h)
    HLT
CODE ENDS             ;Assembler directive
END                   ;Assembler directive