/*
 * main.c
 *  Author: Hunter Hedges
 *  Date: 9-7-2018
 */

/***************************
 * Includes
 ***************************/
#include <stdio.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "led.h"
#include "adc.h"
#include "usb.h"

/***************************
 * File Specific Defines
 ***************************/
#define FLASH_LED_TASK_STACK_SIZE       ( configMINIMAL_STACK_SIZE )
#define FLASH_LED_TASK_PRIORITY         ( tskIDLE_PRIORITY )

#define READ_ADC_TASK_STACK_SIZE        ( configMINIMAL_STACK_SIZE )
#define READ_ADC_TASK_PRIORITY          ( tskIDLE_PRIORITY + 1 )

#define USB_TASK_STACK_SIZE             ( configMINIMAL_STACK_SIZE * 2 )
#define USB_TASK_PRIORITY               ( tskIDLE_PRIORITY + 2 )

#define USB_ADC_QUEUE_LENGTH            1

/***************************
 * File Specific Functions
 ***************************/
static void configureClock(void);
static void configureButton(void);
void button_intHandler(void);

/***************************
 * Intertask communication
 ***************************/
QueueHandle_t usbAdcQueue = NULL;

/***************************
 * Start of Program
 ***************************/
void main(void)
{
    extern void FPU_enableModule(void);

    MAP_WDT_A_holdTimer(); // Stop the Watchdog timer

    FPU_enableModule(); // Ensure the FPU is enabled

    configureButton(); // Set button S1 to trigger interrupts

    configureClock(); // Set clock to 48MHz

    usbAdcQueue = xQueueCreate(USB_ADC_QUEUE_LENGTH, sizeof(uint32_t)); // Provides communication between USB and ADC tasks

    /* Create Tasks */
    xTaskCreate((TaskFunction_t)led_taskFxn,            // The function that implements the task
                "Flash LED",                            // The text name assigned to the task - for debug only as it is not used by the kernel
                FLASH_LED_TASK_STACK_SIZE,              // The size of the stack to allocate to the task
                NULL,                                   // The parameter passed to the task
                FLASH_LED_TASK_PRIORITY,                // The priority assigned to the task
                NULL);                                  // The task handle is not required, so NULL is passed

    xTaskCreate((TaskFunction_t)adc_taskFxn, "Read ADC", READ_ADC_TASK_STACK_SIZE, NULL, READ_ADC_TASK_PRIORITY, NULL);

    xTaskCreate((TaskFunction_t)usb_taskFxn, "USB", USB_TASK_STACK_SIZE, NULL, USB_TASK_PRIORITY, NULL);

    vTaskStartScheduler(); // Starts the tasks

	while(true); // Once the scheduler is started, this shouldn't be reached
}
/*-----------------------------------------------------------*/

static void configureClock(void)
{
    /* Set Flash wait state for high clock frequency.  Refer to datasheet for
    more details. */
    FlashCtl_setWaitState(FLASH_BANK0, 2);
    FlashCtl_setWaitState(FLASH_BANK1, 2);

    /* From the data sheet:  For AM_LDO_VCORE1 and AM_DCDC_VCORE1 modes, the maximum
    CPU operating frequency is 48 MHz and maximum input clock frequency for
    peripherals is 24 MHz. */
    PCM_setCoreVoltageLevel(PCM_VCORE1);
    CS_setDCOCenteredFrequency(CS_DCO_FREQUENCY_48);
    CS_initClockSignal(CS_HSMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);
    CS_initClockSignal(CS_MCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);
    CS_initClockSignal(CS_ACLK, CS_REFOCLK_SELECT, CS_CLOCK_DIVIDER_1);
}
/*-----------------------------------------------------------*/

static void configureButton(void)
{
    /* Configure button S1 to generate interrupts */
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P1, GPIO_PIN1);
    GPIO_enableInterrupt(GPIO_PORT_P1, GPIO_PIN1);
    Interrupt_enableInterrupt(INT_PORT1);
}
/*-----------------------------------------------------------*/

void button_intHandler(void)
{
    (void) P1->IV; // Clear the interrupt

    while(true); // Keep the program here
}
/*-----------------------------------------------------------*/

void vApplicationMallocFailedHook( void )
{
	/* vApplicationMallocFailedHook() will only be called if
	configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
	function that will get called if a call to pvPortMalloc() fails.
	pvPortMalloc() is called internally by the kernel whenever a task, queue,
	timer or semaphore is created.  It is also called by various parts of the
	demo application.  If heap_1.c or heap_2.c are used, then the size of the
	heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
	FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
	to query the size of free heap space that remains (although it does not
	provide information on how the remaining heap might be fragmented). */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationIdleHook( void )
{
	/* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
	to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
	task.  It is essential that code added to this hook function never attempts
	to block in any way (for example, call xQueueReceive() with a block time
	specified, or call vTaskDelay()).  If the application makes use of the
	vTaskDelete() API function (as this demo application does) then it is also
	important that vApplicationIdleHook() is permitted to return to its calling
	function, because it is the responsibility of the idle task to clean up
	memory allocated by the kernel to any task that has since been deleted. */
}
/*-----------------------------------------------------------*/

void vApplicationTickHook( void )
{
    /* This function will be called by each tick interrupt if
    configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
    added here, but the tick hook is called from an interrupt context, so
    code must not attempt to block, and only the interrupt safe FreeRTOS API
    functions can be used (those that end in FromISR()). */

    /* Only the full demo uses the tick hook so there is no code is
    executed here. */
}
/*-----------------------------------------------------------*/

void vPreSleepProcessing( uint32_t ulExpectedIdleTime )
{
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
	function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void *malloc( size_t xSize )
{
	/* There should not be a heap defined, so trap any attempts to call
	malloc. */
	Interrupt_disableMaster();
	for( ;; );
}
/*-----------------------------------------------------------*/


