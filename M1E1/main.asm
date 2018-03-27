;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
M1E1:		mov		#vetor,R5
			call	#MENOR
			jmp		$

MENOR:		mov.b	@R5,R8					;R8 = contador
			mov.b	#0xFF,R6				;R6 = Menor
			mov.b	#0,R7					;R7 = Frequência do menor
LOOP:		inc		R5
			cmp.b	R6,0(R5)
			jn		label1
label2:		inc		R7
			jmp		FIM
label1:		mov.b	@R5,R6
			mov.b	#1,R7
FIM:		dec.b	R8
			jnz		LOOP
			ret



;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
			.data
vetor:		.byte		10,"DIEGOMOISES"
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
