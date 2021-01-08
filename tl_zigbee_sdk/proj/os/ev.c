/********************************************************************************************************
 * @file	ev.c
 *
 * @brief	This is the source file for ev
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
#include "ev.h"

#define ZB_TIMER_EV_DBG_EN  		0

#define EV_TIMER_SAFE_MARGIN(v)		(EV_TIMER_SAFE_MARGIN_US*v)

typedef struct ev_loop_ctrl_t{
    ev_poll_t       poll[EV_POLL_MAX];
	/*
	Time events is sorted, use single linked list
	*/
    ev_time_event_t	*timer_head;
    ev_time_event_t *timer_nearest;        // find the nearest fired timer,
}ev_loop_ctrl_t;

static ev_loop_ctrl_t ev_loop, *loop = &ev_loop;
sys_exception_cb_t g_sysExceptCallbak = NULL;

#if ZB_TIMER_EV_DBG_EN
typedef struct{
	ev_timer_callback_t  cb;
	u8 *p;
}zb_timer_task_dbg_t;
zb_timer_task_dbg_t  g_zbTimerTaskDbg[256];
u32 g_zbTimerTaskDbgCnt = 0;
#endif

ev_time_event_pool_t g_timerEventPool;   //timer event pool

static void ev_timerTaskQCheck(ev_time_event_t *e);



void ev_on_poll(ev_poll_e e, ev_poll_callback_t cb){
    loop->poll[e].valid = 1;
    loop->poll[e].cb = cb;
}

void ev_enable_poll(ev_poll_e e){
    loop->poll[e].valid = 1;
}

void ev_disable_poll(ev_poll_e e){
    loop->poll[e].valid = 0;
}

/* Process poll */
static void ev_poll(void){
    for(u8 i = 0; i < EV_POLL_MAX; ++i){
        if(loop->poll[i].valid){
            loop->poll[i].cb();
        }
    }
}

static u32 inline ev_cal_timer_distant(u32 t, u32 now){
    if((u32)(now - t) < EV_TIMER_SAFE_MARGIN(CLOCK_SYS_CLOCK_1US)){
        return 0;
    }else{
        return (u32)(t - now);
    }
}

static s8 ev_cmp_timer(ev_time_event_t *e1, ev_time_event_t *e2, u32 now){
	//fixed, to avoid unsigned to signed convert overflow problem
	if(ev_cal_timer_distant(e1->t, now) < ev_cal_timer_distant(e2->t, now)){
		return -1;
	}else if(ev_cal_timer_distant(e1->t, now) > ev_cal_timer_distant(e2->t, now)){
		return 1;
	}else{
		return 0;
	}
}

static void ev_reset_timer(ev_time_event_t *e){
    e->t = clock_time() + e->interval;    // be care of overflow
}

void ev_set_timer(ev_time_event_t *e, u32 t_us){
    e->interval = t_us * CLOCK_SYS_CLOCK_1US;
    ev_reset_timer(e);
}

static bool inline ev_is_timer_expired(ev_time_event_t *e, u32 now){
    return ((u32)(now - e->t) < EV_TIMER_SAFE_MARGIN(CLOCK_SYS_CLOCK_1US));
}

static ev_time_event_t *ev_search_nearest_timer(void){
    ev_time_event_t *te = loop->timer_head;
    ev_time_event_t *nearest = NULL;
    u32 now = clock_time();

    while(te){
        if(!nearest || ev_cmp_timer(te, nearest, now) < 0){
            nearest = te;
        }
        te = te->next;
    }
    return nearest;
}

u32 ev_nearestInterval(void){
	if(loop->timer_nearest){
		return ev_cal_timer_distant(loop->timer_nearest->t, clock_time());
	}
	else{
		return 0xFFFFFFFF;
	}
}

bool ev_timer_exist(const ev_time_event_t *e){
    ev_time_event_t *te = loop->timer_head;
    while(te){
        if(te == e){
            return TRUE;
        }
        te = te->next;
    }
    return FALSE;
}

static void ev_start_timer(ev_time_event_t *e){
    u32 r = drv_disable_irq();
    
    u32 now = clock_time();

    u32 t = now + e->interval;    // becare of overflow
    
    // add to timer list
    ev_time_event_t *out;
    LIST_EXIST(loop->timer_head, e, out);
    if(out){
        out->t = t;
    }else{
        e->t = t;
        LIST_ADD(loop->timer_head, e);
    }
    
	//**timer events congestion would happen, if a timer event re-started before it executed and happen that this event
	//is the nearest timer event, the next event timer would adjust to a new value however this value would mask other timer events
	//To avoid this happen, need to search nearest timer at the end of this function

	// check if e will be the nearest timer
	// "Use sorted list or skiplist to improve performance"
    if(!loop->timer_nearest || ev_cmp_timer(e, loop->timer_nearest, now) < 0){
        loop->timer_nearest = e;
    }

    drv_restore_irq(r);
	loop->timer_nearest = ev_search_nearest_timer();//need to search nearest timer in case of timer event stuck
}

void ev_on_timer(ev_time_event_t *e, u32 t_us){
	if(e == NULL){
		ZB_EXCEPTION_POST(SYS_EXCEPTTION_COMMON_TIMER_EVEVT);
		return;
	}
    e->interval = t_us * CLOCK_SYS_CLOCK_1US;
    ev_start_timer(e);
}

void ev_unon_timer(ev_time_event_t *e){
	if(e == NULL) {
		ZB_EXCEPTION_POST(SYS_EXCEPTTION_COMMON_TIMER_EVEVT);
		return;
	}
	u32 r = drv_disable_irq();

	ev_timerTaskQCheck(e);

    LIST_DELETE(loop->timer_head, e);
    loop->timer_nearest = ev_search_nearest_timer();

    drv_restore_irq(r);
}

/* Process time events */
static void ev_process_timer(void){
    u32 now = clock_time();
    if(!loop->timer_nearest || !ev_is_timer_expired(loop->timer_nearest, now)){
        return;
    }
    ev_time_event_t *te = loop->timer_head;
    ev_time_event_t *prev_head = te;
    while(te){
        if(ev_is_timer_expired(te, now)){
			s32 t = te->cb(te->data);
#if ZB_TIMER_EV_DBG_EN
			g_zbTimerTaskDbg[g_zbTimerTaskDbgCnt&0xff].cb = te->cb;
			g_zbTimerTaskDbg[g_zbTimerTaskDbgCnt&0xff].p = te->data;
			g_zbTimerTaskDbgCnt++;
#endif
            if(t < 0){
                ev_unon_timer(te);        // delete timer
            }else if(0 == t){
                te->t = now + te->interval;    // becare of overflow
            }else{
                te->interval = t * CLOCK_SYS_CLOCK_1US;
                te->t = now + te->interval;    // becare of overflow
            }
            if(prev_head != loop->timer_head){
                // restart the whole from timer_head.  because the head could be changed within the loop
                te = loop->timer_head;
                prev_head = te;
            }else{
                te = te->next;
            }
        }else{
            te = te->next;
        }
    }
    // recalculate the nearest timer
    loop->timer_nearest = ev_search_nearest_timer();
}

volatile u32 T_DBG_zbTimerTaskPostCb = 0;
volatile u32 T_DBG_zbTimerTaskPostArg = 0;
ev_time_event_t *ev_timerTaskPost(ev_timer_callback_t func, void *arg, u32 t_us){
	ev_time_event_t *te = NULL;

	if(t_us == 0){
		return te;
	}

	u32 r = drv_disable_irq();

	if(g_timerEventPool.used_num < TIMER_EVENT_SIZE){
		for(s32 i = 0; i < TIMER_EVENT_SIZE; i++){
			if(g_timerEventPool.evt[i].used == 0){
				g_timerEventPool.evt[i].used = 1;
				te = &g_timerEventPool.evt[i];
				g_timerEventPool.used_num++;
				break;
			}
		}
	}

	if(te){
		te->cb = func;
		te->data = arg;
		te->resv = 0x5a;
		ev_on_timer(te, t_us);

		drv_restore_irq(r);
		return te;
	}

	T_DBG_zbTimerTaskPostCb = (u32)func;
	T_DBG_zbTimerTaskPostArg = (u32)arg;
	ZB_EXCEPTION_POST(SYS_EXCEPTTION_ZB_TIMER_TASK);

	drv_restore_irq(r);
	return te;
}

u8 ev_timerTaskCancel(ev_time_event_t **te){
	u8 ret = NO_TIMER_AVAIL;
	ev_time_event_t *ev = *te;

	if(ev == NULL){
		return ret;
	}

	if(ev->used){
		ev_unon_timer(ev);
		*te = NULL;
		return SUCCESS;
	}

	return ret;
}

static void ev_timerTaskQCheck(ev_time_event_t *e){
	if((((u32)e) >= (u32)&(g_timerEventPool.evt[0]) && (((u32)e) <= (u32)&(g_timerEventPool.evt[TIMER_EVENT_SIZE-1]))) && e->used){
		e->used = 0;
		g_timerEventPool.used_num--;
	}
}

bool ev_timerTaskIdle(void){
	if(g_timerEventPool.used_num == 0){
		return TRUE;
	}
	return FALSE;
}

bool ev_timerTaskQEnough(void){
	if(g_timerEventPool.used_num < TIMER_EVENT_SIZE){
		return TRUE;
	}
	return FALSE;
}

void ev_timerTaskQInit(void){
	memset((u8 *)&g_timerEventPool, 0, sizeof(g_timerEventPool));
}

volatile u16 T_evtExcept[4] = {0};
u8 sys_exceptionPost(u16 line, u8 evt){
	T_evtExcept[0] = line;
	T_evtExcept[1] = evt;

	/* TODO: some information stored in NV */
	if(g_sysExceptCallbak){
		g_sysExceptCallbak();
	}

	return 0;
}

u8 sys_stackStatusCheck(void){
	extern u32 _end_bss_;
	u8 *stackEnd = (u8*)&_end_bss_;
	u8 stackOverflown = 0;
	for(s32 i = 0; i < 4; i++){
		if(stackEnd[i] != 0xff){
			/* stack overflown */
			stackOverflown = 1;
			break;
		}
	}

	if(stackOverflown){
		ZB_EXCEPTION_POST(SYS_EXCEPTTION_COMMON_STACK_OVERFLOWN);
	}

	return 0;
}

void sys_exceptHandlerRegister(sys_exception_cb_t cb){
	g_sysExceptCallbak = cb;
}

void ev_main(void){
    ev_process_timer();
    ev_poll();

	//sys_stackStatusCheck();
}

#if 0
volatile int T_timer_fix_cnt = 0;
void ev_synchronous_timer(void){
	u32 now = clock_time();
    T_timer_fix_cnt++;

	ev_time_event_t *te = loop->timer_head;
	while(te){
		if(te->t >= now){
			te->t = te->t - now;
		}
		te = te->next;
	}
	reg_system_tick = 0;
}
#endif
