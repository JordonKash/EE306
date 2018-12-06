; ISR.asm
; Name: Derek Lilya
; UTEid: djl2772
; Keyboard ISR runs when a key is struck
; Checks for a valid RNA symbol and places it at x4600
               .ORIG x2600

;Read KBDR(xFE02) to get character typed

START 	LDI R1, polling
	BRzp START
 

LDI R3, CharTyped

LD R4, CharA
ADD R5, R4, R3
BRz Vaild


LD R4, CharC
ADD R5, R4, R3
BRz Vaild


LD R4, CharU
ADD R5, R4, R3
BRz Vaild


LD R4, CharG
ADD R5, R4, R3
BRz Vaild

AND R3, R3, #0

Vaild
STI R3, Store

;Check for A,C,U, or G AND update x4600

;no loops

RTI

polling		.FILL xFE00
CharTyped	.FILL xFE02
CharA		.FILL x-41
CharC		.FILL x-43
CharU		.FILL x-55
CharG		.FILL x-47
Store		.FILL x4600

		.END
