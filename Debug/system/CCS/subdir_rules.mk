################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
system/CCS/msp432_startup_ccs.obj: ../system/CCS/msp432_startup_ccs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="system/CCS/msp432_startup_ccs.d_raw" --obj_directory="system/CCS" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

system/CCS/printf-stdarg.obj: ../system/CCS/printf-stdarg.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="system/CCS/printf-stdarg.d_raw" --obj_directory="system/CCS" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

system/CCS/system_msp432p401r.obj: ../system/CCS/system_msp432p401r.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="system/CCS/system_msp432p401r.d_raw" --obj_directory="system/CCS" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


