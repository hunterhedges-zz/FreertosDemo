/*
 * flash_led.c
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
#include "semphr.h"
#include <driverlib.h>
#include "led.h"

/***************************
 * Initialize on board LED
 ***************************/
void led_init(void)
{
    MAP_GPIO_setOutputLowOnPin( GPIO_PORT_P1, GPIO_PIN0 );
    MAP_GPIO_setAsOutputPin( GPIO_PORT_P1, GPIO_PIN0 );
}
/*-----------------------------------------------------------*/

void led_taskFxn(void)
{
    led_init();

    static const TickType_t halfSecondBlock = pdMS_TO_TICKS( 500 );

    while(true)
    {
        vTaskDelay(halfSecondBlock);
        configTOGGLE_LED();
    }
}
