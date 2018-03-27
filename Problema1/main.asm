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

INIT:
			mov.w	#vetor, R5
			call	#ORDENA
			jmp		$
			nop
ORDENA:
			mov.b	@R5, R8
			inc 	R5
			jmp		BOOTSTRAP

BOOTSTRAP:
			dec.b	R8								;Decrementa contador principal
			mov 	R8, R7							;Atribui contador auxiliar para primário
			mov.w	R5, R6							;Atribui ao endereço canditado, o endereço avaliado
LOOP:

			dec.b	R7								;Decrementa contador auxiliar
			jnz		COMPARA
			jmp		BOOTSTRAP

COMPARA:
			inc  	R6
			mov.b	@R5, R10
			mov.b	@R6, R11						;Vai para a posição adjacente
			cmp		R10, R11						;Compara posição avalidada com posição candidata
			jge		LOOP								;Se posição candidata não for menor que posição avaliada, nada acontece
			jmp		TROCA							;O conteúdo da posição avaliada recebe o conteúdo da posição candidata e vice versa

TROCA:
			mov 	@R6, R9							;Pivô recebe o conteúdo da posição candidata
			mov 	@R5, 0(R6)						;Posição canditada recebe o conteúdo de posição avaliada
			mov  	R9, 0(R5)						;Posição avaliada recebe o conteúdo do pivô
			jmp		LOOP
			nop






;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
 			.data
vetor:		.byte	14, "DIEGOGUILHERME"
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
