################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbcdc.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbkb.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbmouse.c \
C:/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbvendor.c

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
proj/drivers/usb/app/usbcdc.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbcdc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DROUTER=1 -D__PROJECT_TL_DIMMABLE_LIGHT__=1 -I../../../apps/common -I../../../apps/sampleLight -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/usb/app/usbkb.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbkb.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DROUTER=1 -D__PROJECT_TL_DIMMABLE_LIGHT__=1 -I../../../apps/common -I../../../apps/sampleLight -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/usb/app/usbmouse.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbmouse.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DROUTER=1 -D__PROJECT_TL_DIMMABLE_LIGHT__=1 -I../../../apps/common -I../../../apps/sampleLight -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

proj/drivers/usb/app/usbvendor.o: /cygdrive/C/Users/arkad/AndeSight3/workspace/zigbee_sdk/tl_zigbee_sdk/proj/drivers/usb/app/usbvendor.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -DMCU_CORE_B91=1 -DROUTER=1 -D__PROJECT_TL_DIMMABLE_LIGHT__=1 -I../../../apps/common -I../../../apps/sampleLight -I../../../platform/chip_b91 -I../../../platform/riscv -I../../../platform -I../../../proj/common -I../../../proj -I../../../zigbee/common/includes -I../../../zigbee/zbapi -I../../../zigbee/bdb/includes -I../../../zigbee/gp -I../../../zigbee/zcl -I../../../zigbee/ota -I../../../zbhci -O2 -mcmodel=small -fpack-struct -fshort-enums -flto -Wall -mcpu=d25f -ffunction-sections -fdata-sections -mext-dsp -mabi=ilp32f  -c -fmessage-length=0  -fomit-frame-pointer -fno-strict-aliasing -fshort-wchar -fuse-ld=bfd -Wno-nonnull-compare -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


