################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_adc.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_calibration.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_flash.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_gpio.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_hw.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_i2c.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_keyboard.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_nv.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_pm.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_putchar.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_pwm.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_spi.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_timer.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_uart.c

OBJS += \
./proj/drivers/drv_adc.o \
./proj/drivers/drv_calibration.o \
./proj/drivers/drv_flash.o \
./proj/drivers/drv_gpio.o \
./proj/drivers/drv_hw.o \
./proj/drivers/drv_i2c.o \
./proj/drivers/drv_keyboard.o \
./proj/drivers/drv_nv.o \
./proj/drivers/drv_pm.o \
./proj/drivers/drv_putchar.o \
./proj/drivers/drv_pwm.o \
./proj/drivers/drv_spi.o \
./proj/drivers/drv_timer.o \
./proj/drivers/drv_uart.o

C_DEPS += \
./proj/drivers/drv_adc.d \
./proj/drivers/drv_calibration.d \
./proj/drivers/drv_flash.d \
./proj/drivers/drv_gpio.d \
./proj/drivers/drv_hw.d \
./proj/drivers/drv_i2c.d \
./proj/drivers/drv_keyboard.d \
./proj/drivers/drv_nv.d \
./proj/drivers/drv_pm.d \
./proj/drivers/drv_putchar.d \
./proj/drivers/drv_pwm.d \
./proj/drivers/drv_spi.d \
./proj/drivers/drv_timer.d \
./proj/drivers/drv_uart.d


# Each subdirectory must supply rules for building sources it contributes
proj/drivers/drv_adc.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_adc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_calibration.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_calibration.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_flash.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_flash.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_gpio.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_hw.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_hw.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_i2c.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_keyboard.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_keyboard.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_nv.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_nv.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_pm.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_pm.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_putchar.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_putchar.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_pwm.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_pwm.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_spi.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_timer.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_timer.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/drv_uart.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/drv_uart.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -D__PROJECT_TL_BOOT_LOADER__=1 -I../../../apps/common -I../../../apps/bootLoader -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


