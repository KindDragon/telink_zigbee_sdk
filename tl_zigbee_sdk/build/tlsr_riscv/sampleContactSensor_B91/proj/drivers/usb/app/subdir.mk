################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
$(PWD)/../../../proj/drivers/usb/app/usbcdc.c \
$(PWD)/../../../proj/drivers/usb/app/usbkb.c \
$(PWD)/../../../proj/drivers/usb/app/usbmouse.c \
$(PWD)/../../../proj/drivers/usb/app/usbvendor.c

OBJS += \
./proj/drivers/usb/app/usbcdc.o \
./proj/drivers/usb/app/usbkb.o \
./proj/drivers/usb/app/usbmouse.o \
./proj/drivers/usb/app/usbvendor.o

C_DEPS += \
./proj/drivers/usb/app/usbcdc.d \
./proj/drivers/usb/app/usbkb.d \
./proj/drivers/usb/app/usbmouse.d \
./proj/drivers/usb/app/usbvendor.d


# Each subdirectory must supply rules for building sources it contributes
proj/drivers/usb/app/usbcdc.o: $(PWD)/../../../proj/drivers/usb/app/usbcdc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/usb/app/usbkb.o: $(PWD)/../../../proj/drivers/usb/app/usbkb.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/usb/app/usbmouse.o: $(PWD)/../../../proj/drivers/usb/app/usbmouse.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/usb/app/usbvendor.o: $(PWD)/../../../proj/drivers/usb/app/usbvendor.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DEND_DEVICE=1 -D__PROJECT_TL_CONTACT_SENSOR__=1 -I../../../apps/common -I../../../apps/sampleContactSensor -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


