################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
$(PWD)/../../../platform/services/b91m/plic_isr.c

OBJS += \
./platform/services/plic_isr.o

C_DEPS += \
./platform/services/plic_isr.d


# Each subdirectory must supply rules for building sources it contributes
platform/services/plic_isr.o: $(PWD)/../../../platform/services/b91m/plic_isr.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


