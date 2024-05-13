################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_ace.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_wd.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_wd_attr.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_zone.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_zone_attr.c

OBJS += \
./zigbee/zcl/security_safety/zcl_ias_ace.o \
./zigbee/zcl/security_safety/zcl_ias_wd.o \
./zigbee/zcl/security_safety/zcl_ias_wd_attr.o \
./zigbee/zcl/security_safety/zcl_ias_zone.o \
./zigbee/zcl/security_safety/zcl_ias_zone_attr.o

C_DEPS += \
./zigbee/zcl/security_safety/zcl_ias_ace.d \
./zigbee/zcl/security_safety/zcl_ias_wd.d \
./zigbee/zcl/security_safety/zcl_ias_wd_attr.d \
./zigbee/zcl/security_safety/zcl_ias_zone.d \
./zigbee/zcl/security_safety/zcl_ias_zone_attr.d


# Each subdirectory must supply rules for building sources it contributes
zigbee/zcl/security_safety/zcl_ias_ace.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_ace.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zigbee/zcl/security_safety/zcl_ias_wd.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_wd.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zigbee/zcl/security_safety/zcl_ias_wd_attr.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_wd_attr.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zigbee/zcl/security_safety/zcl_ias_zone.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_zone.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zigbee/zcl/security_safety/zcl_ias_zone_attr.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/security_safety/zcl_ias_zone_attr.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


