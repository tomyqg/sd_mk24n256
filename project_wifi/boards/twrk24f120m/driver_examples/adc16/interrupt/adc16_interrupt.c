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

#include "fsl_debug_console.h"
#include "board.h"
#include "fsl_pdb.h"
#include "fsl_adc16.h"

#include "pin_mux.h"
#include "clock_config.h"

#include "fsl_lptmr.h"
#include "fsl_dma_manager.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define DEMO_PDB_BASE PDB0
#define DEMO_PDB_IRQ_ID PDB0_IRQn
#define DEMO_PDB_IRQ_HANDLER PDB0_IRQHandler

#define DEMO_PDB_ADC_TRIGGER_CHANNEL 0U    /* For ADC0. */
#define DEMO_PDB_ADC_PRETRIGGER_CHANNEL 0U /* For ADC0_SC1[0]. */

#define DEMO_ADC_BASE ADC0
#define DEMO_ADC_CHANNEL_GROUP  0U
#define DEMO_ADC_USER_CHANNEL   8U
#define DEMO_ADC_IRQ_ID ADC0_IRQn
#define DEMO_ADC_IRQ_HANDLER ADC0_IRQHandler

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*!
 * @brief Initialize the ADC16
 */
static void DEMO_InitPDB_ADC(void);

/*******************************************************************************
 * Variables
 ******************************************************************************/
volatile uint32_t g_PdbDelayInterruptCounter;
volatile bool g_PdbDelayInterruptFlag;
volatile uint32_t g_AdcInterruptCounter;
volatile bool g_AdcInterruptFlag;
volatile uint32_t g_AdcConvValue;

/*******************************************************************************
 * Code
 ******************************************************************************/
void static DEMO_InitPDB_ADC(void)
{
    adc16_config_t adc16ConfigStruct;
    adc16_channel_config_t adc16ChannelConfigStruct;

    /*
     * adc16ConfigStruct.referenceVoltageSource = kADC16_ReferenceVoltageSourceVref;
     * adc16ConfigStruct.clockSource = kADC16_ClockSourceAsynchronousClock;
     * adc16ConfigStruct.enableAsynchronousClock = true;
     * adc16ConfigStruct.clockDivider = kADC16_ClockDivider8;
     * adc16ConfigStruct.resolution = kADC16_ResolutionSE12Bit;
     * adc16ConfigStruct.longSampleMode = kADC16_LongSampleDisabled;
     * adc16ConfigStruct.enableHighSpeed = false;
     * adc16ConfigStruct.enableLowPower = false;
     * adc16ConfigStruct.enableContinuousConversion = false;
     */
    ADC16_GetDefaultConfig(&adc16ConfigStruct);
    ADC16_Init(DEMO_ADC_BASE, &adc16ConfigStruct);
#if defined(FSL_FEATURE_ADC16_HAS_CALIBRATION) && FSL_FEATURE_ADC16_HAS_CALIBRATION
    ADC16_EnableHardwareTrigger(DEMO_ADC_BASE, false);
    ADC16_DoAutoCalibration(DEMO_ADC_BASE);
#endif /* FSL_FEATURE_ADC16_HAS_CALIBRATION */
    ADC16_EnableHardwareTrigger(DEMO_ADC_BASE, true);

    adc16ChannelConfigStruct.channelNumber = DEMO_ADC_USER_CHANNEL;
    adc16ChannelConfigStruct.enableInterruptOnConversionCompleted = true; /* Enable the interrupt. */
#if defined(FSL_FEATURE_ADC16_HAS_DIFF_MODE) && FSL_FEATURE_ADC16_HAS_DIFF_MODE
    adc16ChannelConfigStruct.enableDifferentialConversion = false;
#endif /* FSL_FEATURE_ADC16_HAS_DIFF_MODE */
    ADC16_SetChannelConfig(DEMO_ADC_BASE, DEMO_ADC_CHANNEL_GROUP, &adc16ChannelConfigStruct);
}

/*!
 * @brief ISR for PDB interrupt function
 */
void DEMO_PDB_IRQ_HANDLER(void)
{
    PDB_ClearStatusFlags(DEMO_PDB_BASE, kPDB_DelayEventFlag);
    g_PdbDelayInterruptCounter++;
    g_PdbDelayInterruptFlag = true;
}

/*!
 * @brief ISR for ADC16 interrupt function
 */
void DEMO_ADC_IRQ_HANDLER(void)
{
    /* Read to clear COCO flag. */
    g_AdcConvValue = ADC16_GetChannelConversionValue(DEMO_ADC_BASE, DEMO_ADC_CHANNEL_GROUP);
    g_AdcInterruptCounter++;
    g_AdcInterruptFlag = true;
    PRINTF("%d\r\n", g_AdcInterruptCounter);
}

void LPTMR0_IRQHandler(void)
{
    LPTMR_ClearStatusFlags(LPTMR0, kLPTMR_TimerCompareFlag);
}

/*!
 * @brief Main function
 */
int main(void)
{
    lptmr_config_t lptmrConfig;
    pdb_config_t pdbConfigStruct;
    pdb_adc_pretrigger_config_t pdbAdcPreTriggerConfigStruct;

    BOARD_InitPins();
    BOARD_BootClockRUN();
    BOARD_InitDebugConsole();
    //EnableIRQ(DEMO_PDB_IRQ_ID);
    EnableIRQ(DEMO_ADC_IRQ_ID);

    PRINTF("\r\nPDB ADC16 Pre-Trigger Example.\r\n");

    /* Configure the PDB counter. */
    /*
     * pdbConfigStruct.loadValueMode = kPDB_LoadValueImmediately;
     * pdbConfigStruct.prescalerDivider = kPDB_PrescalerDivider1;
     * pdbConfigStruct.dividerMultiplicationFactor = kPDB_DividerMultiplicationFactor1;
     * pdbConfigStruct.triggerInputSource = kPDB_TriggerSoftware;
     * pdbConfigStruct.enableContinuousMode = false;
     */
    PDB_GetDefaultConfig(&pdbConfigStruct);
    pdbConfigStruct.triggerInputSource = kPDB_TriggerInput14;
    PDB_Init(DEMO_PDB_BASE, &pdbConfigStruct);
    
    /* Configure the delay interrupt. */
    PDB_SetModulusValue(DEMO_PDB_BASE, 1000U);

    /* The available delay value is less than or equal to the modulus value. */
    PDB_SetCounterDelayValue(DEMO_PDB_BASE, 1000U);
    //PDB_EnableInterrupts(DEMO_PDB_BASE, kPDB_DelayInterruptEnable);

    /* Configure the ADC Pre-Trigger. */
    pdbAdcPreTriggerConfigStruct.enablePreTriggerMask = 1U << DEMO_PDB_ADC_PRETRIGGER_CHANNEL;
    pdbAdcPreTriggerConfigStruct.enableOutputMask = 1U << DEMO_PDB_ADC_PRETRIGGER_CHANNEL;
    pdbAdcPreTriggerConfigStruct.enableBackToBackOperationMask = 0U;
    PDB_SetADCPreTriggerConfig(DEMO_PDB_BASE, DEMO_PDB_ADC_TRIGGER_CHANNEL, &pdbAdcPreTriggerConfigStruct);
    PDB_SetADCPreTriggerDelayValue(DEMO_PDB_BASE, DEMO_PDB_ADC_TRIGGER_CHANNEL, DEMO_PDB_ADC_PRETRIGGER_CHANNEL, 200U);
    /* The available Pre-Trigger delay value is less than or equal to the modulus value. */

    PDB_DoLoadValues(DEMO_PDB_BASE);

    /* Configure the ADC. */
    DEMO_InitPDB_ADC();

    /* Configure the LPTMR. */
    LPTMR_GetDefaultConfig(&lptmrConfig);
    lptmrConfig.timerMode = kLPTMR_TimerModeTimeCounter;
    lptmrConfig.pinSelect = kLPTMR_PinSelectInput_0;
    lptmrConfig.enableFreeRunning = false;
    /* Initialize the LPTMR */
    LPTMR_Init(LPTMR0, &lptmrConfig);
    /* Set timer period */
    LPTMR_SetTimerPeriod(LPTMR0, USEC_TO_COUNT(LPTMR_USEC_COUNT, LPTMR_SOURCE_CLOCK));
//    /* Enable timer interrupt */
//    LPTMR_EnableInterrupts(LPTMR0, kLPTMR_TimerInterruptEnable);
//    /* Enable at the NVIC */
//    EnableIRQ(LPTMR0_IRQn);
    /* Start counting */
    LPTMR_StartTimer(LPTMR0);
    
    g_PdbDelayInterruptCounter = 0U;
    g_AdcInterruptCounter = 0U;

    while (1)
    {
//        PRINTF("\r\nType any key into terminal to trigger the PDB and then trigger the ADC's conversion ...\r\n");
        //GETCHAR();
//        PRINTF("\r\n");
        g_PdbDelayInterruptFlag = false;
        g_AdcInterruptFlag = false;
//        PDB_DoSoftwareTrigger(DEMO_PDB_BASE);
        //while ((!g_PdbDelayInterruptFlag) || (!g_AdcInterruptFlag))
        while ((!g_AdcInterruptFlag))
        {
        }
//        PRINTF("PDB Interrupt Counter: %d\r\n", g_PdbDelayInterruptCounter);
//        PRINTF("ADC Conversion Interrupt Counter: %d\r\n", g_AdcInterruptCounter);
        PRINTF("ADC Conversion Value: %d\r\n", g_AdcConvValue);
    }
}

void UserDmaTest(void)
{
    DMAMGR_Init();
    /* Request dma channels from DMA manager. */
    DMAMGR_RequestChannel(kDmaRequestMux0ADC0, 0U, &g_adc0EdmaHandle);
       
    /* Create UART DMA handle. */
    //UART_TransferCreateHandleEDMA(DEMO_UART, &g_uartEdmaHandle, UART_UserCallback, NULL, &g_uartTxEdmaHandle, &g_uartRxEdmaHandle);

    
}