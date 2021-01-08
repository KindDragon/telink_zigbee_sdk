/********************************************************************************************************
 * @file	drv_gpio.c
 *
 * @brief	This is the source file for drv_gpio
 *
 * @author	Zigbee Group
 * @date	2019
 *
 * @par     Copyright (c) 2019, Telink Semiconductor (Shanghai) Co., Ltd. ("TELINK")
 *          All rights reserved.
 *
 *          Redistribution and use in source and binary forms, with or without
 *          modification, are permitted provided that the following conditions are met:
 *
 *              1. Redistributions of source code must retain the above copyright
 *              notice, this list of conditions and the following disclaimer.
 *
 *              2. Unless for usage inside a TELINK integrated circuit, redistributions
 *              in binary form must reproduce the above copyright notice, this list of
 *              conditions and the following disclaimer in the documentation and/or other
 *              materials provided with the distribution.
 *
 *              3. Neither the name of TELINK, nor the names of its contributors may be
 *              used to endorse or promote products derived from this software without
 *              specific prior written permission.
 *
 *              4. This software, with or without modification, must only be used with a
 *              TELINK integrated circuit. All other usages are subject to written permission
 *              from TELINK and different commercial license may apply.
 *
 *              5. Licensee shall be solely responsible for any claim to the extent arising out of or
 *              relating to such deletion(s), modification(s) or alteration(s).
 *
 *          THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 *          ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 *          WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *          DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
 *          DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 *          (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *          LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 *          ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *          (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 *          SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *******************************************************************************************************/
#include "../tl_common.h"


typedef struct gpio_conf_list
{
	struct gpio_conf_list 	*next;
	irq_callback 			gpio_irq_callback;
	u32 					pin;
	drv_gpioIrqMode_t 		mode;
	drv_gpioPoll_e 			polarity;
}gpio_conf_list;

#define GPIO_IRQ_HANDLER_Q_NUM		3

LIST(gpioIrqHandlerQ);

struct gpio_conf_list *list_head = NULL;

/****
* brief: initialize the gpio interrupt
* param[in] pin, the gpio interrupt pin
* param[in] polarity, the falling edge or the rising edge.
* param[in] gpio_irq_callback, the callback function
* @return, 0 success, -1 failed(fail to allocate the node buffer)
*/
int drv_gpio_irq_config(drv_gpioIrqMode_t mode, u32 pin, drv_gpioPoll_e polarity, irq_callback gpio_irq_callback)
{
	bool searched = 0;
	if(listLength(gpioIrqHandlerQ)){
		gpio_conf_list *pList = listHead(gpioIrqHandlerQ);
		while(pList){
			if(pList->mode == mode && pList->pin == pin){
				if(pList->polarity != polarity){
					pList->polarity = polarity;
				}
				if(pList->gpio_irq_callback != gpio_irq_callback){
					pList->gpio_irq_callback = gpio_irq_callback;
				}

				searched = 1;
				break;
			}

			pList = pList->next;
		}
	}

	if(!searched){
		if(listLength(gpioIrqHandlerQ) >= GPIO_IRQ_HANDLER_Q_NUM){
			return -1;
		}

		gpio_conf_list *list_node = (gpio_conf_list*)ev_buf_allocate(sizeof(gpio_conf_list));
		if(!list_node){
			return -1;
		}

		memset((u8 *)list_node, 0, sizeof(gpio_conf_list));
		list_node->mode = mode;
		list_node->pin = pin;
		list_node->polarity = polarity;
		list_node->gpio_irq_callback = gpio_irq_callback;
		listAdd(gpioIrqHandlerQ, (void *)list_node);
	}

	if(mode == GPIO_IRQ_MODE){
		drv_gpio_irq_set(pin, polarity);
	}else if(mode == GPIO_IRQ_RISC0_MODE){
		drv_gpio_irq_risc0_set(pin, polarity);
	}else if(mode == GPIO_IRQ_RISC1_MODE){
		drv_gpio_irq_risc1_set(pin, polarity);
	}

	return 0;
}

/****
* brief: gpio interrupt handler
* param[in]
* @return
*/
static void drv_gpio_irq_process(drv_gpioIrqMode_t mode)
{
	if(listLength(gpioIrqHandlerQ)){
		gpio_conf_list *pList = listHead(gpioIrqHandlerQ);
		while(pList){
			if(pList->mode == mode){
				if(pList->gpio_irq_callback){
					pList->gpio_irq_callback();
					break;
				}
			}

			pList = pList->next;
		}
	}
}

void drv_gpio_irq_handler(void)
{
	drv_gpio_irq_process(GPIO_IRQ_MODE);
}

void drv_gpio_irq_risc0_handler(void)
{
	drv_gpio_irq_process(GPIO_IRQ_RISC0_MODE);
}

void drv_gpio_irq_risc1_handler(void)
{
	drv_gpio_irq_process(GPIO_IRQ_RISC1_MODE);
}

void drv_gpio_func_set(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_set_func(pin, AS_GPIO);
#elif defined(MCU_CORE_B91)
	gpio_function_en(pin);
#endif
}

void drv_gpio_output_en(u32 pin, bool enable)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_set_output_en(pin, enable);
#elif defined(MCU_CORE_B91)
	gpio_set_output(pin, enable);
#endif
}

void drv_gpio_input_en(u32 pin, bool enable)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_set_input_en(pin, enable);
#elif defined(MCU_CORE_B91)
	gpio_set_input(pin, enable);
#endif
}

void drv_gpio_up_down_resistor(u32 pin, u8 res)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_setup_up_down_resistor(pin, res);
#elif defined(MCU_CORE_B91)
	gpio_set_up_down_res(pin, res);
#endif
}

void drv_gpio_write(u32 pin, bool value)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_write(pin, value);
#elif defined(MCU_CORE_B91)
	gpio_set_level(pin, value);
#endif
}

bool drv_gpio_read(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	return gpio_read(pin);
#elif defined(MCU_CORE_B91)
	return gpio_get_level(pin);
#endif
}

void drv_gpio_read_all(u8 *p)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_read_all(p);
#elif defined(MCU_CORE_B91)
	gpio_get_level_all(p);
#endif
}

void drv_gpio_irq_set(u32 pin, drv_gpioPoll_e polarity)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_set_interrupt(pin, polarity);
#elif defined(MCU_CORE_B91)
	gpio_set_irq(pin, polarity);
#endif
}

void drv_gpio_irq_risc0_set(u32 pin, drv_gpioPoll_e polarity)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_set_interrupt_risc0(pin, polarity);
#elif defined(MCU_CORE_B91)
	gpio_set_gpio2risc0_irq(pin, polarity);
#endif
}

void drv_gpio_irq_risc1_set(u32 pin, drv_gpioPoll_e polarity)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_set_interrupt_risc1(pin, polarity);
#elif defined(MCU_CORE_B91)
	gpio_set_gpio2risc1_irq(pin, polarity);
#endif
}

/****
* brief: enable the gpio interrupt
* param[in] pin, the pin of node.
* @return
*/
void drv_gpio_irq_en(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_en_interrupt(pin, 1);
#elif defined(MCU_CORE_B91)
	gpio_irq_en(pin);
	plic_interrupt_enable(IRQ25_GPIO);
#endif
}

void drv_gpio_irq_risc0_en(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_en_interrupt_risc0(pin, 1);
#elif defined(MCU_CORE_B91)
	gpio_gpio2risc0_irq_en(pin);
	plic_interrupt_enable(IRQ26_GPIO2RISC0);
#endif
}

void drv_gpio_irq_risc1_en(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_en_interrupt_risc1(pin, 1);
#elif defined(MCU_CORE_B91)
	gpio_gpio2risc1_irq_en(pin);
	plic_interrupt_enable(IRQ27_GPIO2RISC1);
#endif
}

void drv_gpio_irq_dis(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_en_interrupt(pin, 0);
#elif defined(MCU_CORE_B91)
	gpio_irq_dis(pin);
	plic_interrupt_disable(IRQ25_GPIO);
#endif
}

void drv_gpio_irq_risc0_dis(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_en_interrupt_risc0(pin, 0);
#elif defined(MCU_CORE_B91)
	gpio_gpio2risc0_irq_dis(pin);
	plic_interrupt_disable(IRQ26_GPIO2RISC0);
#endif
}

void drv_gpio_irq_risc1_dis(u32 pin)
{
#if defined(MCU_CORE_826x) || defined(MCU_CORE_8258) || defined(MCU_CORE_8278)
	gpio_en_interrupt_risc1(pin, 0);
#elif defined(MCU_CORE_B91)
	gpio_gpio2risc1_irq_dis(pin);
	plic_interrupt_disable(IRQ27_GPIO2RISC1);
#endif
}


#if 0
/****
* brief: gpio interrupt handler
* param[in]
* @return
*/
extern void ev_synchronous_timer(void);
void timer_synchronous_irq_callback()
{
	u32 r = drv_disable_irq();
	ev_synchronous_timer();
	drv_restore_irq(r);
}


/****
* brief: configure the timer synchronous gpio and  polarity
* param[in] pin, the pin of node.
* param[in] polarity, the falling edge or the rising edge.
* @return
*/
void gpio_timer_synchronous_set(u32 pin, drv_gpioPoll_e polarity)
{
	drv_gpio_irq_config(GPIO_IRQ_MODE, pin, polarity, timer_synchronous_irq_callback);
}
#endif
