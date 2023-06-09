; Stepper Motor
CODE SEGMENT
 PORTA  EQU 00H    ;Address of Port A       = 00H
 Config EQU 06H    ;Address of Config. Word = 06H
ORG 100H
  MOV DX, Config
  MOV AL, 10000000B;port A=output/ mode 0, PORT B=output/ mode 0 ,port C=output
  OUT DX, AL 
  
START:
  MOV DX, PORTA
  MOV AL, 00000110B
  OUT DX,AL
;--------------------
  MOV CX, 0ffffh     ; Delay 
loopy1:loop loopy1   ;
;--------------------
  MOV AL, 00001100B
  OUT DX,AL
;--------------------
  MOV CX, 0ffffh     ; Delay again
loopy2:loop loopy2   ;
;--------------------    
  MOV AL, 00001001B
  OUT DX,AL
;--------------------
  MOV CX, 0ffffh     ; Delay again
loopy3:loop loopy3   ;
;--------------------    
  MOV AL, 00000011B
  OUT DX,AL
;--------------------
  MOV CX, 0ffffh     ; Delay again
loopy4:loop loopy4   ;
;--------------------
JMP START          ;Loop forever
CODE ENDS
END