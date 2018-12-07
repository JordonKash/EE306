; Main.asm
; Name: Derek Lilya & Jordan Kash
; UTEid: djl2772
; Continuously reads from x4600 making sure its not reading duplicate
; symbols. Processes the symbol based on the program description
; of mRNA processing.
               .ORIG x4000
; initialize the stack pointer
; First, write the 3 steps of setup

; set up the keyboard interrupt vector table entry

; enable keyboard interrupts

; start of actual program

LEA R1, S1
LDI R2, ISRstart
state_machine_loop
	ADD R0, R1, #0
	TRAP x22
	ADD R1, R1, R2
	LDR R1, R1, #0
	BR state_machine_loop


;START	
;	.FILL NEXT_STATEA
;	.FILL NEXT_STATEC
;	.FILL NEXT_STATEG
;	.FILL NEXT_STATEU
;       .FILL OUTPUT

S1	.FILL S2
	.FILL S1
	.FILL S1
	.FILL S1
	.STRINGZ "HEY" ;OUTPUT CHARACTER

S2	.FILL S1
	.FILL S1
	.FILL S1
	.FILL S3
	.STRINGZ "A"

S3	.FILL S1
	.FILL S1
	.FILL S4
	.FILL S1
	.STRINGZ "U"
	
S4	.FILL S5     ;;START
	.FILL S5
	.FILL S5
	.FILL S6
	.STRINGZ "G|"

S5	.FILL S5
	.FILL S5
	.FILL S5
	.FILL S6
	.STRINGZ "HEY" ;OUTPUT CHARACTER

S6	.FILL S7
	.FILL S5
	.FILL S9
	.FILL S6
	.STRINGZ "U"

S7	.FILL S8
	.FILL S5
	.FILL S8
	.FILL S6
	.STRINGZ "HEY" ;OUTPUT CHARCTER

S8	TRAP x25

S9	.FILL S7
	.FILL S5
	.FILL S5
	.FILL S6
	.STRINGZ "G"
	; This is going to be re-written
	

;START	
;	.FILL NEXT_STATEA
;	.FILL NEXT_STATEC
;	.FILL NEXT_STATEG
;	.FILL NEXT_STATEU
;       .FILL OUTPUT









StackStart 	.FILL x4000
ISRstart	.FILL x2600
Vector 		.FILL x0180
BitsKBSR	.FILL xFE00
bitchange	.FILL x4000

		.END
