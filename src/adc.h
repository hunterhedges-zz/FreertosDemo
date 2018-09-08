/*
 * adc.h
 *
 *  Created on: Sep 8, 2018
 *      Author: hhedg
 */

#ifndef ADC_H_
#define ADC_H_

void adc_init(void);
uint32_t getSample(void);
void adc_taskFxn(void);

#endif /* ADC_H_ */
