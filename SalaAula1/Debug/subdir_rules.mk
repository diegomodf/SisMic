################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
main.obj: ../main.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP430 Compiler'
	"/home/diego/ti/ccs740/ccsv7/tools/compiler/ti-cgt-msp430_16.9.6.LTS/bin/cl430" -vmspx --code_model=small --data_model=small --use_hw_mpy=F5 --include_path="/home/diego/ti/ccs740/ccsv7/ccs_base/msp430/include" --include_path="/home/diego/sismic/SalaAula1" --include_path="/home/diego/ti/ccs740/ccsv7/tools/compiler/ti-cgt-msp430_16.9.6.LTS/include" --advice:power=all --define=__MSP430F5529__ -g --printf_support=minimal --diag_warning=225 --diag_wrap=off --display_error_number --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --preproc_with_compile --preproc_dependency="main.d_raw" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '


