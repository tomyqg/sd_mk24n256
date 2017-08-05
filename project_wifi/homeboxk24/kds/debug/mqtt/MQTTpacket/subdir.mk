################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTConnectClient.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTConnectServer.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTDeserializePublish.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTFormat.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTPacket.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTSerializePublish.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTSubscribeClient.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTSubscribeServer.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTUnsubscribeClient.c \
E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTUnsubscribeServer.c 

OBJS += \
./mqtt/MQTTpacket/MQTTConnectClient.o \
./mqtt/MQTTpacket/MQTTConnectServer.o \
./mqtt/MQTTpacket/MQTTDeserializePublish.o \
./mqtt/MQTTpacket/MQTTFormat.o \
./mqtt/MQTTpacket/MQTTPacket.o \
./mqtt/MQTTpacket/MQTTSerializePublish.o \
./mqtt/MQTTpacket/MQTTSubscribeClient.o \
./mqtt/MQTTpacket/MQTTSubscribeServer.o \
./mqtt/MQTTpacket/MQTTUnsubscribeClient.o \
./mqtt/MQTTpacket/MQTTUnsubscribeServer.o 

C_DEPS += \
./mqtt/MQTTpacket/MQTTConnectClient.d \
./mqtt/MQTTpacket/MQTTConnectServer.d \
./mqtt/MQTTpacket/MQTTDeserializePublish.d \
./mqtt/MQTTpacket/MQTTFormat.d \
./mqtt/MQTTpacket/MQTTPacket.d \
./mqtt/MQTTpacket/MQTTSerializePublish.d \
./mqtt/MQTTpacket/MQTTSubscribeClient.d \
./mqtt/MQTTpacket/MQTTSubscribeServer.d \
./mqtt/MQTTpacket/MQTTUnsubscribeClient.d \
./mqtt/MQTTpacket/MQTTUnsubscribeServer.d 


# Each subdirectory must supply rules for building sources it contributes
mqtt/MQTTpacket/MQTTConnectClient.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTConnectClient.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTConnectServer.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTConnectServer.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTDeserializePublish.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTDeserializePublish.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTFormat.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTFormat.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTPacket.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTPacket.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTSerializePublish.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTSerializePublish.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTSubscribeClient.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTSubscribeClient.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTSubscribeServer.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTSubscribeServer.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTUnsubscribeClient.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTUnsubscribeClient.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mqtt/MQTTpacket/MQTTUnsubscribeServer.o: E:/sbox_all/project_wifi/mqtt/MQTTpacket/MQTTUnsubscribeServer.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall -Wredundant-decls  -g -DDEBUG -DWIFI_MODULE -DUSE_RTOS=1 -DCPU_MK24FN256VDC12 -DFSL_RTOS_FREE_RTOS -DTWR_K24F120M -DTOWER -DAUDIO_PLAY -DPRODUCE_TEST -I../../../../rtos/freertos_8.2.3_k24/Source/portable/GCC/ARM_CM4F -I../../../../rtos/freertos_8.2.3_k24/Source/include -I../../../../rtos/freertos_8.2.3_k24/Source -I../../../CMSIS/Include -I../../../../devices -I../../../../devices/MK24F25612 -I../../../../devices/MK24F25612/drivers -I../../../../devices/MK24F25612/utilities -I../.. -I../../../7139 -I../../../mqtt -I../../../mqtt/MQTTpacket -I../../../json -I../../../uplink -I../../../middleware/lwip_1.4.1 -I../../../middleware/lwip_1.4.1/port -I../../../middleware/lwip_1.4.1/port/arch -I../../../middleware/lwip_1.4.1/src -I../../../middleware/lwip_1.4.1/src/include -I../../../middleware/lwip_1.4.1/src/include/ipv4 -I../../../middleware/lwip_1.4.1/src/include/ipv4/lwip -I../../../middleware/lwip_1.4.1/src/include/ipv6 -I../../../middleware/lwip_1.4.1/src/include/ipv6/lwip -I../../../middleware/lwip_1.4.1/src/include/lwip -I../../../middleware/lwip_1.4.1/src/include/netif -I../../../middleware/lwip_1.4.1/src/include/posix -I../../../middleware/lwip_1.4.1/src/netif/ppp -I../../../http_client -I../../../modem_gprs -I../../../modem_flash -I../../../modem_plc/drv_st7580 -I../../../modem_plc/ -I../../../protocol -I../../../../protocol -I../../../../crypto -std=gnu99 -mapcs $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


