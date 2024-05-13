################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_toucklink_security.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_zllTouchLinkDiscovery.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_zllTouchLinkJoinOrStart.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_zll_commissioning.c

OBJS += \
./zigbee/zcl/zll_commissioning/zcl_toucklink_security.o \
./zigbee/zcl/zll_commissioning/zcl_zllTouchLinkDiscovery.o \
./zigbee/zcl/zll_commissioning/zcl_zllTouchLinkJoinOrStart.o \
./zigbee/zcl/zll_commissioning/zcl_zll_commissioning.o

C_DEPS += \
./zigbee/zcl/zll_commissioning/zcl_toucklink_security.d \
./zigbee/zcl/zll_commissioning/zcl_zllTouchLinkDiscovery.d \
./zigbee/zcl/zll_commissioning/zcl_zllTouchLinkJoinOrStart.d \
./zigbee/zcl/zll_commissioning/zcl_zll_commissioning.d


# Each subdirectory must supply rules for building sources it contributes
zigbee/zcl/zll_commissioning/zcl_toucklink_security.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_toucklink_security.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_SWITCH__=1 -I../../../apps/common -I../../../apps/sampleSwitch -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zigbee/zcl/zll_commissioning/zcl_zllTouchLinkDiscovery.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_zllTouchLinkDiscovery.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_SWITCH__=1 -I../../../apps/common -I../../../apps/sampleSwitch -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zigbee/zcl/zll_commissioning/zcl_zllTouchLinkJoinOrStart.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_zllTouchLinkJoinOrStart.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_SWITCH__=1 -I../../../apps/common -I../../../apps/sampleSwitch -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zigbee/zcl/zll_commissioning/zcl_zll_commissioning.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/zigbee/zcl/zll_commissioning/zcl_zll_commissioning.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_SWITCH__=1 -I../../../apps/common -I../../../apps/sampleSwitch -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


