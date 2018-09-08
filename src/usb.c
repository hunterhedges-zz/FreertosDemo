/*
 * usb.c
 *
 *  Created on: Sep 8, 2018
 *      Author: hhedg
 */

/***************************
 * Includes
 ***************************/
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include <driverlib.h>
#include "usb.h"

/***************************
 * File Specific Defines
 ***************************/
#define PRIMARY_FUNCTION        GPIO_PRIMARY_MODULE_FUNCTION
#define USB_UART_PINS           GPIO_PORT_P1, GPIO_PIN2 | GPIO_PIN3
#define USB_UART_BASE           EUSCI_A0_BASE
#define RX_INTERRUPT            EUSCI_A_UART_RECEIVE_INTERRUPT
#define TX_INTERRUPT            EUSCI_A_UART_TRANSMIT_INTERRUPT
#define USB_UART_INT            INT_EUSCIA0

#define MAX_BUFFER_SIZE         128
#define ENTER_KEY               13
#define BACKSPACE_KEY           8

/***************************
 * Intertask communication
 ***************************/
extern QueueHandle_t usbAdcQueue;
static bool shouldDisplayValues = false;

/***************************
 * UART Configuration based on TI Tool:
 * http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430BaudRateConverter/index.html
 ***************************/
const eUSCI_UART_Config usbUARTConfig =
{
    EUSCI_A_UART_CLOCKSOURCE_SMCLK,                 // SMCLK Clock Source
    26,                                             // BRDIV = 26
    0,                                              // UCxBRF = 0 Baud 115200
    111,                                            // UCxBRS = 111
    EUSCI_A_UART_NO_PARITY,                         // No Parity
    EUSCI_A_UART_LSB_FIRST,                         // MSB First
    EUSCI_A_UART_ONE_STOP_BIT,                      // One stop bit
    EUSCI_A_UART_MODE,                              // UART mode
    EUSCI_A_UART_OVERSAMPLING_BAUDRATE_GENERATION   // Over sampling
};

/***************************
 * Initialize USB UART
 ***************************/
void usb_init(void)
{
    GPIO_setAsPeripheralModuleFunctionInputPin(USB_UART_PINS, PRIMARY_FUNCTION);

    UART_initModule(USB_UART_BASE, &usbUARTConfig);

    UART_enableModule(USB_UART_BASE);

    UART_enableInterrupt(USB_UART_BASE, RX_INTERRUPT);

    Interrupt_enableInterrupt(USB_UART_INT);
}
/*-----------------------------------------------------------*/

void usb_taskFxn(void)
{
    usb_init();

    uint32_t receivedValue = 0;

    while(true)
    {
        // Take ADC value off of Queue
        xQueueReceive(usbAdcQueue, &receivedValue, portMAX_DELAY);

        if(shouldDisplayValues)
        {
            // Convert uint32_t value to char array to print
            uint8_t string[8];
            uint32ToString(receivedValue, string);
            usb_sendBufferInReverse(string, 8);
            usb_sendBuffer("\n\r", 2);
        }

    }

}

/***************************
 * Triggered on all EUSCI_A0 UART interrupts
 ***************************/
void usb_intHandler(void)
{
    uint32_t intStatus = UART_getEnabledInterruptStatus(USB_UART_BASE);
    static uint8_t rxBuffer[MAX_BUFFER_SIZE];
    static uint8_t rxPtr = 0;

    if(intStatus == RX_INTERRUPT)
    {
        UART_clearInterruptFlag(USB_UART_BASE, RX_INTERRUPT);

        // Command too long...
        if(rxPtr == MAX_BUFFER_SIZE)
        {
            rxPtr = 0;
        }

        uint8_t charReceived = UART_receiveData(USB_UART_BASE);

        usb_sendBuffer(&charReceived, 1);

        if(charReceived == ENTER_KEY)
        {
            rxPtr = 0;

            if(shouldDisplayValues)
            {
                shouldDisplayValues = false;
            }
            else if(strcmp((char *)rxBuffer, "start") == 0)
            {
                usb_sendBuffer("\n\r", 2);
                shouldDisplayValues = true;
            }

        }
        else if(charReceived == BACKSPACE_KEY)
        {
            rxPtr--;
        }
        else
        {
            rxBuffer[rxPtr++] = charReceived;
        }

    }
}
/*-----------------------------------------------------------*/

void usb_sendBuffer(uint8_t* buffer, uint8_t bufferSize)
{
    int i;
    for(i = 0; i < bufferSize; i++)
    {
        UART_transmitData(USB_UART_BASE, buffer[i]);
    }
}
/*-----------------------------------------------------------*/

void usb_sendBufferInReverse(uint8_t* buffer, uint8_t bufferSize)
{
    int i;
    for(i = bufferSize - 1; i >= 0; i--)
    {
        if(buffer[i] >= '0' && buffer[i] <= '9')
        {
            UART_transmitData(USB_UART_BASE, buffer[i]);
        }
    }
}
/*-----------------------------------------------------------*/

void uint32ToString(uint32_t num, uint8_t* str)
{
    uint8_t i = 0;

    /* Handle 0 explicitly, otherwise empty string is printed for 0 */
    if (num == 0)
    {
        str[i++] = '0';
        str[i] = '\0';
        return;
    }

    // Process individual digits
    while (num != 0)
    {
        int rem = num % 10;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num / 10;
    }

    str[i] = '\0'; // Append string terminator
}

