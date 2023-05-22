;codewithshamse
;Memory Interfacing
;Transferrring data from ROM to RAM

DATA SEGMENT
 PORTA EQU 00H
 PORTB EQU 02H
 PORTC EQU 04H
 PORT_CON EQU 06H
DATA ENDS
CODE SEGMENT
 MOV AX,DATA
 MOV DS, AX

ORG 0000H
START:

 MOV DX, PORT_CON
 MOV AL, 10000000B
 OUT DX, AL


 MOV AX,00H
 MOV CX,01FH  
 PUSH AX
   
XX:

 
 PUSH CX
 POP CX
 POP AX
 PUSH CX 
 MOV DX, PORTA
 OUT DX,AX
 INC AX 
 PUSH AX
  
  MOV DX, PORTB
 MOV AL, 00000000B
 OUT DX, AL

 MOV cx, 0df36H
D1: LOOP D1


  MOV DX, PORTB
 MOV AL, 00000001B
 OUT DX, AL 
  MOV cx, 0df36H
D2: LOOP D2 

 POP AX
 POP CX
 PUSH AX
 LOOP XX   
 
 JMP START

CODE ENDS
END