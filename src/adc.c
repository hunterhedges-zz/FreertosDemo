/*
 * adc.c
 *
 *  Created on: Sep 8, 2018
 *      Author: hhedg
 */

/***************************
 * Includes
 ***************************/
#include <stdbool.h>
#include <stdint.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include <driverlib.h>
#include "adc.h"

/***************************
 * Intertask communication
 ***************************/
extern QueueHandle_t usbAdcQueue;

/***************************
 * Initialize ADC module
 ***************************/
void adc_init(void)
{
    ADC14_enableModule();

    // This sets the conversion clock to 3MHz
    ADC14_initModule(ADC_CLOCKSOURCE_ADCOSC,
                     ADC_PREDIVIDER_1,
                     ADC_DIVIDER_1,
                     0
                     );

    // This configures the ADC to store output results
    // in only one single output register, ADC_MEM0.
    ADC14_configureSingleSampleMode(ADC_MEM0, true);

    // This configures the ADC in manual conversion mode
    ADC14_enableSampleTimer(ADC_MANUAL_ITERATION);

    // This configures ADC_MEM0 to store the result
    ADC14_configureConversionMemory(ADC_MEM0,
                                  ADC_VREFPOS_AVCC_VREFNEG_VSS,
                                  ADC_INPUT_A15,
                                  ADC_NONDIFFERENTIAL_INPUTS);

    // A15 is multiplexed on GPIO port P6 pin PIN0
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P6,
                                               GPIO_PIN0,
                                               GPIO_PRIMARY_MODULE_FUNCTION);
}

/***************************
 * Returns ADC sample
 ***************************/
uint32_t getSample(void)
{
    // This starts the conversion process
    ADC14_enableConversion();
    ADC14_toggleConversionTrigger();

    // We wait for the ADC to complete
    while(ADC14_isBusy());

    // and we read the output result from buffer ADC_MEM0
    return ADC14_getResult(ADC_MEM0);
}
/*-----------------------------------------------------------*/

void adc_taskFxn(void)
{
    adc_init();

    static const TickType_t tenthSecondBlock = pdMS_TO_TICKS( 500 );
    static uint32_t values[128];
    static uint32_t ptr = 0;

    while(true)
    {
        vTaskDelay(tenthSecondBlock);

        if(ptr == 128)
        {
            ptr = 0;
        }

        values[ptr] = getSample();
        xQueueSend(usbAdcQueue, &values[ptr], 0U );
        ptr++;
    }
}
