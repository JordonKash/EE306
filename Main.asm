; Main.asm
; Name: Jordon Kashanchi, Derek Lilya
; UTEid: jak4363, djl2772
; Continuously reads from x4600 making sure its not reading duplicate
; symbols. Processes the symbol based on the program description
; of mRNA processing.
               .ORIG x4000
; initialize the stack pointer

LD R6, StackStart


; First, write the 3 steps of setup

; set up the keyboard interrupt vector table entry

LD R1, ISRstart
STI R1, Vector

; enable keyboard interrupts

LD R2, bitchange
STI R2, BitsKBSR

; start of actual program


RESTART 	

LDI R0, pullme
BRz #-2
TRAP x21

AND R2, R2, #0
STI R2, pullme

LD R1, CharA
ADD R1, R1, R0
BRnp RESTART

BRnzp 4
RESTART1
LD R1, CharA
ADD R1, R1, R0
BRnp RESTART

LDI R0, pullme       
BRz #-2
TRAP x21

AND R2, R2, #0
STI R2, pullme

LD R1, CharU	
ADD R1, R1, R0
BRnp RESTART1

LDI R0, pullme       
BRz #-2
TRAP x21

AND R2, R2, #0
STI R2, pullme

LD R1, CharG
ADD R1, R1, R0
BRnp RESTART

LD R0, Pipe
TRAP x21

BRnzp nextstage
;/////////////////////////////////////////////////////////////////////////////////////
nextstage

LDI R0, pullme
BRz #-2
TRAP x21

AND R2, R2, #0
STI R2, pullme

LD R1, CharU	
ADD R1, R1, R0
BRnp nextstage

nextstepU
LDI R0, pullme
BRz #-2
TRAP x21

AND R2, R2, #0
STI R2, pullme


LD R1, CharA	
ADD R1, R1, R0
BRz nextstepA
LD R1, CharG
ADD R1, R1, R0
BRz nextstepG
BRnzp nextstage


nextstepA

LDI R0, pullme
BRz #-2
TRAP x21

AND R2, R2, #0
STI R2, pullme


LD R1, CharA	
ADD R1, R1, R0
BRz nextstep1
LD R1, CharG
ADD R1, R1, R0
BRz nextstep1
BRnzp nextstage

nextstepG

LDI R0, pullme
BRz #-2
TRAP x21

AND R2, R2, #0
STI R2, pullme

LD R1, CharA
ADD R1, R1, R0
BRz nextstep1

LD R1, CharU
ADD R1, R1, R0
BRz nextstepU
BRnzp nextstage


nextstep1
TRAP x25 




CharA		.FILL x-41
CharC		.FILL x-43
CharU		.FILL x-55
CharG		.FILL x-47
Pipe		.FILL x7C
StackStart 	.FILL x4000
ISRstart	.FILL x2600
pullme		.FILL x4600
Vector 		.FILL x0180
BitsKBSR	.FILL xFE00
bitchange	.FILL x4000

.END
