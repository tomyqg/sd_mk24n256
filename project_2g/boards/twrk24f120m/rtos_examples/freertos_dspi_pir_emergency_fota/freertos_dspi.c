/*
* Copyright (c) 2013 - 2015, Freescale Semiconductor, Inc.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* o Redistributions of source code must retain the above copyright notice, this list
*   of conditions and the following disclaimer.
*
* o Redistributions in binary form must reproduce the above copyright notice, this
*   list of conditions and the following disclaimer in the documentation and/or
*   other materials provided with the distribution.
*
* o Neither the name of Freescale Semiconductor, Inc. nor the names of its
*   contributors may be used to endorse or promote products derived from this
*   software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
* ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/* FreeRTOS kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "event_groups.h"

/* Freescale includes. */
#include "fsl_device_registers.h"
#include "fsl_debug_console.h"
#include "fsl_dspi.h"
#include "fsl_dspi_freertos.h"
#include "board.h"

#include "fsl_common.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "A7139.h"
#include "SPI_A7139.h"

#include "hb_protocol.h"
/*******************************************************************************
* Definitions
******************************************************************************/

#if (EXAMPLE_DSPI_MASTER_BASE == SPI0_BASE)
#define DSPI_MASTER_CLK_SRC (DSPI0_CLK_SRC)
#elif(EXAMPLE_DSPI_MASTER_BASE == SPI1_BASE)
#define DSPI_MASTER_CLK_SRC (DSPI1_CLK_SRC)
#elif(EXAMPLE_DSPI_MASTER_BASE == SPI2_BASE)
#define DSPI_MASTER_CLK_SRC (DSPI2_CLK_SRC)
#elif(EXAMPLE_DSPI_MASTER_BASE == SPI3_BASE)
#define DSPI_MASTER_CLK_SRC (DSPI3_CLK_SRC)
#elif(EXAMPLE_DSPI_MASTER_BASE == SPI4_BASE)
#define DSPI_MASTER_CLK_SRC (DSPI4_CLK_SRC)
#else
#error Should define the DSPI_MASTER_CLK_SRC!
#endif

/*******************************************************************************
* Variables
******************************************************************************/
SemaphoreHandle_t dspi_sem;
extern dspi_rtos_handle_t master_rtos_handle;

extern void SPI_A7139_INIT(void);
extern void shell_task(void *pvParameters);
extern void uart_task(void*);
extern EventGroupHandle_t FIFO_event;

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/



static void DelayBlinkRfCallback(TimerHandle_t xTimer)
{	
    GPIO_ClearPinsOutput(GPIOD, 1U << 14);
    vTaskDelay(10);
    GPIO_SetPinsOutput(GPIOD, 1U << 14);
}


void rf_get_message_task(void *pvParameters)
{
    TimerHandle_t 	DelayBlinkRfHandle = NULL;
	uint8_t k = 0;
    uint8_t fifobuf[21];
	init_A7139();


    GPIO_PinInit(GPIOD, 14U, &(gpio_pin_config_t){kGPIO_DigitalOutput, (0U)});
	GPIO_ClearPinsOutput(GPIOD, 1U << 14);
    vTaskDelay(500);
    GPIO_SetPinsOutput(GPIOD, 1U << 14);
    
    DelayBlinkRfHandle = xTimerCreate("delay_blink_rf",     /* Text name. */
                                 ((TickType_t)50U), 			/* Timer period. */
							   	 pdFALSE,                   /* Enable auto reload. */
                                 0,                         /* ID is not used. */
								 DelayBlinkRfCallback);    /* The callback function. */
    

    
#if 1   /* test RF send and recv */
    //A7139_SetPackLen(36);
    while(1)
    {
        
    	xEventGroupWaitBits(A7139EventGroup,    	/* The event group handle. */
    						B_GIO2_FYNC,			/* The bit pattern the event group is waiting for. */
							pdTRUE,         		/* BIT will be cleared automatically. */
							pdTRUE,         		/* Don't wait for both bits, either bit unblock task. */
							portMAX_DELAY); 		/* Block indefinitely to wait for the condition to be met. */

        if ((GIO2S == RX) && GIO2_FLAG)
        {
            vTaskDelay(10);
            GIO2_FLAG  = 0;
            A7139_StrobeCmd(CMD_RFR);
            A7139_ReadFIFO((uint8_t*)&recv_packet.header, 21);
            A7139_StrobeCmd(CMD_RX);
            
            xEventGroupSetBits(FIFO_event, B_FIFO_event);
        }
        
//    	vTaskDelay(3);
//        if ((GIO2S == RX) && GIO2_FLAG)
//        {
//            GIO2_FLAG  = 0;
//            A7139_ReadFIFO((uint8_t *)fifobuf, 21);
//            A7139_StrobeCmd(CMD_RX);
//            //rf_message_send_msqg(fifobuf);
//#if 1
//            for(uint32_t j=0;j<21;j++)
//    		{
//    			PRINTF("%02x ", fifobuf[j]);
//    		}
//    		PRINTF("\r\n");
//    		if (k == 2) {
//    			send_packet.sn_dest = (0x0a<<28)|0x0AAAbbbb;
//    			rf_send_then_receive_no_preamble(&send_packet);
//                rf_send_then_receive_no_preamble(&send_packet);
//    			k = 0;
//    		}
//    		k++;
//#endif
//        }
    }
#endif 
}

/*!
 * @brief Application entry point.
 */
int main(void)
{
    /* Init board hardware. */
    BOARD_InitPins();
    BOARD_BootClockRUN();
    BOARD_InitDebugConsole();

    PRINTF("PIR emergency OTA start.\r\n");

    FIFO_event = xEventGroupCreate();
    xTaskCreate(uart_task, "uart_task",   configMINIMAL_STACK_SIZE * 30, NULL,  configMAX_PRIORITIES-6, NULL);
    xTaskCreate(rf_get_message_task, "Rf_get_message_task", configMINIMAL_STACK_SIZE + 64, NULL, configMAX_PRIORITIES - 1, NULL);
    
    PRINTF("Initialize done.\r\n");
    vTaskStartScheduler();
    while(1);
}

