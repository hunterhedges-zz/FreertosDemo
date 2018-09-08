################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
FreeRTOS_Source/croutine.obj: C:/Users/hhedg/FreeRTOS/Source/croutine.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="FreeRTOS_Source/croutine.d_raw" --obj_directory="FreeRTOS_Source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

FreeRTOS_Source/event_groups.obj: C:/Users/hhedg/FreeRTOS/Source/event_groups.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="FreeRTOS_Source/event_groups.d_raw" --obj_directory="FreeRTOS_Source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

FreeRTOS_Source/list.obj: C:/Users/hhedg/FreeRTOS/Source/list.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="FreeRTOS_Source/list.d_raw" --obj_directory="FreeRTOS_Source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

FreeRTOS_Source/queue.obj: C:/Users/hhedg/FreeRTOS/Source/queue.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="FreeRTOS_Source/queue.d_raw" --obj_directory="FreeRTOS_Source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

FreeRTOS_Source/stream_buffer.obj: C:/Users/hhedg/FreeRTOS/Source/stream_buffer.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="FreeRTOS_Source/stream_buffer.d_raw" --obj_directory="FreeRTOS_Source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

FreeRTOS_Source/tasks.obj: C:/Users/hhedg/FreeRTOS/Source/tasks.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="FreeRTOS_Source/tasks.d_raw" --obj_directory="FreeRTOS_Source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

FreeRTOS_Source/timers.obj: C:/Users/hhedg/FreeRTOS/Source/timers.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP432 Compiler'
	"C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O0 --opt_for_speed=2 --include_path="C:/ti8/ccsv8/ccs_base/arm/include" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib/inc" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo/driverlib" --include_path="C:/Users/hhedg/FreeRTOS/Source/include" --include_path="C:/Users/hhedg/FreeRTOS/Source/portable/CCS/ARM_CM4F" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include" --include_path="C:/ti8/ccsv8/tools/compiler/ti-cgt-arm_18.1.1.LTS/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/" --include_path="C:/ti8/ccsv8/ccs_base/arm/include/CMSIS" --include_path="C:/Users/hhedg/Source/Repos/freeRTOS-demo" -g --gcc --define=__MSP432P401R__ --define=USE_CMSIS_REGISTER_FORMAT=1 --define=TARGET_IS_MSP432P4XX --define=ccs --diag_warning=225 --diag_wrap=off --display_error_number --verbose_diagnostics --gen_func_subsections=on --preproc_with_compile --preproc_dependency="FreeRTOS_Source/timers.d_raw" --obj_directory="FreeRTOS_Source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


