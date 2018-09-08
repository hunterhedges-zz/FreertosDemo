/*
 * usb.h
 *
 *  Created on: Sep 8, 2018
 *      Author: hhedg
 */

#ifndef USB_H_
#define USB_H_

void usb_init(void);
void usb_taskFxn(void);
void usb_intHandler(void);
void usb_sendBuffer(uint8_t* buffer, uint8_t bufferSize);
void usb_sendBufferInReverse(uint8_t* buffer, uint8_t bufferSize);
void uint32ToString(uint32_t num, uint8_t* str);

#endif /* USB_H_ */
