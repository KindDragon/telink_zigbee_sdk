################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
S_UPPER_SRCS += \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/platform/boot/b91/cstartup_b91.S

OBJS += \
./platform/boot/b91/cstartup_b91.o

S_UPPER_DEPS += \
./platform/boot/b91/cstartup_b91.d


# Each subdirectory must supply rules for building sources it contributes
platform/boot/b91/cstartup_b91.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/platform/boot/b91/cstartup_b91.S
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_SWITCH__=1 -I../../../apps/common -I../../../apps/sampleSwitch -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

