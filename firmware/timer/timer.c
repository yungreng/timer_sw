/* Name: main.c
 * Project: hid-data, example how to use HID for data transfer
 * Author: Christian Starkjohann
 * Creation Date: 2008-04-11
 * Tabsize: 4
 * Copyright: (c) 2008 by OBJECTIVE DEVELOPMENT Software GmbH
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 */

/*
   This example should run on most AVRs with only little changes. No special
   hardware resources except INT0 are used. You may have to change usbconfig.h for
   different I/O pins for USB. Please note that USB D+ must be the INT0 pin, or
   at least be connected to INT0 as well.
   */

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>  /* for sei() */
#include <util/delay.h>     /* for _delay_ms() */
#include <avr/eeprom.h>
#include <stdlib.h>

#include <avr/pgmspace.h>   /* required by usbdrv.h */
#include "oddebug.h"        /* This is also an example for using debug macros */

#include "../message.h"
#include "timer.h"






#define DELAY 10
#define START 0

#define SWITCH_PORT      PORTD
#define SWITCH_PORT_DIR      DDRD
#define SWITCH_PIN1      PD1
#define SWITCH_PIN0      PD0
#define SWITCH_OUT()    (SWITCH_PORT_DIR   = 1<<SWITCH_PIN1 | 1<<SWITCH_PIN0) // PC1 OUTPUT
#define OFF(a)		(SWITCH_PORT  |=  1<<a) /* short */
#define ON(a)		(SWITCH_PORT  &=  ~(1<<a)) /*open*/





static unsigned short gTicks = 0;
timer_RAM_t gTimer[2];

#define READ_CONFIG()   eeprom_read_block(&gTimer[0].config, (uchar *)ADDR_CONFIG, sizeof(timer_config_t))
#define READ_RTC()      eeprom_read_block(&gTimer[0].rtc, (uchar *)ADDR_RTC, sizeof(rtc_t))
#define WRITE_RTC()     eeprom_write_block(p_RTC_TIME, (uchar *)(ADDR_RTC), sizeof(rtc_t));
#define READ_STATUS()   eeprom_read_block(&gTimer[0].status, (uchar *)ADDR_STATUS, sizeof(timer_status_t))
#define WRITE_STATUS()   eeprom_write_block(&gTimer[0].status, (uchar *)ADDR_STATUS, sizeof(timer_status_t));
/* ------------------------------------------------------------------------- */
void power_on(timer_RAM_t *pTimer){
    pTimer->SW_status = UP;
    if (pTimer->config.power_type == POWER_AT){
        ON(pTimer->pin);/*led off*/
    }else{
        ON(pTimer->pin);/*led off*/
        _delay_ms(100);
        OFF(pTimer->pin);/*led off*/
    }
}

/* ------------------------------------------------------------------------- */
void power_off(timer_RAM_t *pTimer){
    pTimer->SW_status = DOWN;
    if (pTimer->config.power_type == POWER_AT){
        OFF(pTimer->pin);/*led off*/
    }else{ // power ATX
        ON(pTimer->pin);/*led off*/
        _delay_ms(100);
        OFF(pTimer->pin);/*led off*/
    }
}

char timer_configure(void)
{
    // read configure from eeprom
    READ_CONFIG();
    if (gTimer[0].config.magic_number != MAGIC_INIT){
        gTimer[0].config.magic_number =  MAGIC_NONE_INIT;
        gTimer[0].config.up_time =  DEFAULT_UP;
        gTimer[0].config.down_time =  DEFAULT_DOWN;
        gTimer[0].config.time_unit =  DEFAULT_UNIT;
        gTimer[0].config.count =  DEFAULT_COUNT;
        gTimer[0].config.power_type =  DEAULT_POWER_TYPE;
        gTimer[0].config.groups = 1;
        gTimer[0].timer_groups = malloc(sizeof(timer_group_t)) ;
    }else{

        gTimer[0].timer_groups = malloc(sizeof(timer_group_t) * gTimer[0].config.groups); //
        if (!gTimer[0].timer_groups)
            return ERROR;
        //read groups setting from eeprom ,refer eeprom storage format in timer.h
        if (gTimer[0].config.groups ==0){
            gTimer[0].config.groups = 1;
            eeprom_read_block(gTimer[0].timer_groups, (uchar *)ADDR_GROUP1,sizeof(timer_group_t) );
        }else{
            eeprom_read_block(gTimer[0].timer_groups, (uchar *)ADDR_GROUPS,sizeof(timer_group_t)* gTimer[0].config.groups );
        }
    }
    gTimer[0].timer_groups->up_time  = gTimer[0].config.up_time;
    gTimer[0].timer_groups->down_time= gTimer[0].config.down_time;
    gTimer[0].pin = PC1;
    gTimer[0].current_group = gTimer[0].timer_groups;
    gTimer[0].end_group = gTimer[0].current_group + gTimer[0].config.groups;
    gTimer[0].time_left = START;
    gTimer[0].count_left = gTimer[0].config.count; // gCount3 is OK2

    gTimer[1].config.magic_number =  MAGIC_NONE_INIT;
    gTimer[1].config.up_time =  1;
    gTimer[1].config.down_time =  1;
    gTimer[1].config.time_unit =  SECOND;
    gTimer[1].config.count =  DEFAULT_COUNT;
    gTimer[1].config.power_type =  DEAULT_POWER_TYPE;
    gTimer[1].config.groups = 1;

    gTimer[1].timer_groups = malloc(sizeof(timer_group_t)) ;
    gTimer[1].timer_groups->up_time  = gTimer[1].config.up_time;
    gTimer[1].timer_groups->down_time= gTimer[1].config.down_time;
    gTimer[1].pin = PC0;

    gTimer[1].current_group = gTimer[1].timer_groups;
    gTimer[1].end_group = gTimer[1].current_group + gTimer[1].config.groups;
    gTimer[1].time_left = START; // restart value of counter
    gTimer[1].count_left = gTimer[1].config.count; // reload value of cycles
    return 0;

}



/* ------------------------------------------------------------------------- */
void timer_check_status(void) //must called after timer_setup_()
{
    READ_STATUS();
    if (gTimer[0].status.run_status  == RUNNING ){ // power failure resuming
        if (gTimer[0].status.count1 != gTimer[0].status.count2 ){ //only one is different from other two
            gTimer[0].count_left = gTimer[0].status.count3; // cunt3 is OK
        }else{
            gTimer[0].count_left = gTimer[0].status.count1; // count1 are OK
        }
    }else{
        gTimer[0].count_left = gTimer[0].config.count; // start running,  initialize gTimer[0].count_left to configure
    }
}


/* ------------------------------------------------------------------------- */
void update_status(void)
{
    gTimer[0].status.count1=gTimer[0].count_left;
    gTimer[0].status.count2=gTimer[0].count_left;
    gTimer[0].status.count3=gTimer[0].count_left;
    gTimer[0].status.run_status  = RUNNING;
    if(gTimer[0].count_left == 0)
        gTimer[0].status.run_status  = NOT_RUNNING;
    //update RTC in eeprom every minute
    WRITE_STATUS();

}


/* ------------------------------------------------------------------------- */

void timer_init(void)
{

    T2_IRQ_ENABLE(); // enabel T2 irq & clear T2 irq
    T2_IRQ_CLEAR();
    T2_SCALER256(); // set prescaler to 256

    //read configure from eeprom, check something
    if (timer_configure() == ERROR)
        return ;

    //read status from eeprom, check power failure
    timer_check_status();
    update_status();

    // read real time from eeprom address of ADDR_RTC
    READ_RTC();

    SWITCH_OUT();
    power_on(&gTimer[0]);
    power_on(&gTimer[1]);
}

/* (*p_RTC_TIME) = hour:minute */
#define p_RTC_TIME ((unsigned short*)&(gTimer[0].rtc.minute))
/* ------------------------------------------------------------------------- */
void timer_switch(timer_RAM_t *pTimer)
{
    unsigned short *pCurrent_count; // power down count object
    if (pTimer->count_left==0){
        return ;
    }
    pTimer->time_left++;
    if ( pTimer->config.time_unit == DAY){
        pCurrent_count = p_RTC_TIME;
    }else{
        pCurrent_count = &pTimer->time_left;
    }
    if(pTimer->SW_status == DOWN){
        if ( *pCurrent_count == pTimer->current_group->down_time ){/*now, it's time to switch on*/
            power_on(pTimer);
            pTimer->time_left = START;
        }
    }else if(pTimer->SW_status == UP){
        if(*pCurrent_count == pTimer->current_group->up_time){ /*now, it's time to switch off*/
            power_off(pTimer);
            pTimer->time_left = START;
            /* next group */
            pTimer->current_group++;
            if (pTimer->current_group == pTimer->end_group) //one cycle of groups
            {
                pTimer->count_left--;
                pTimer->current_group = pTimer->timer_groups;
                update_status();
            }
        }
    }
}



/* ------------------------------------------------------------------------- */
ISR (TIMER2_OVF_vect)/* Note [2] */
{
    //	TIFR |=  1<< TOV2;

    gTicks++; // gTimer[0].count_left
    SIG_TICK(); // signal T2 overflow

}


/* ------------------------------------------------------------------------- */
void serve_tick_msg(void){
    CLEAR_SIG_TICK();  //clear message as it's been processed.
    if (gTicks == TICKS_PER_SECOND){
        gTicks= 0;
        SIG_SECOND();
    }
}

/* ------------------------------------------------------------------------- */
void serve_second_msg(void){
    CLEAR_SIG_SECOND();  //clear message as it's been processed.
    gTimer[0].rtc.second++;
    if (gTimer[0].rtc.second == SECONDS_PER_MINUTE){
        gTimer[0].rtc.second = 0;
        SIG_MINUTE();
    }
    if (gTimer[0].config.time_unit==SECOND){
        timer_switch(&gTimer[0]);
    }
    if (gTimer[1].config.time_unit==SECOND){
        timer_switch(&gTimer[1]);
    }

}


/* ------------------------------------------------------------------------- */
void serve_minute_msg(void){
    CLEAR_SIG_MINUTE();  //clear message as it's been processed.
    gTimer[0].rtc.minute++;
    if (gTimer[0].rtc.minute  == MINUTES_PER_HOUR){
        gTimer[0].rtc.minute = 0;
        SIG_HOUR();
    }
    WRITE_RTC(); //update gTimer[0].RTC in eeprom
    /* normal or real_time switch on and off*/
    if (gTimer[0].config.time_unit==MINUTE  || gTimer[0].config.time_unit==DAY ){
        timer_switch(&gTimer[0]);
    }
    if (gTimer[1].config.time_unit==MINUTE  || gTimer[1].config.time_unit==DAY ){
        timer_switch(&gTimer[1]);
    }
}

/* ------------------------------------------------------------------------- */
void serve_hour_msg(void){
    CLEAR_SIG_HOUR();  //clear message as it's been processed.
    gTimer[0].rtc.hour++;
    if (gTimer[0].rtc.hour  ==  HOURS_PER_DAY){
        gTimer[0].rtc.hour = 0;
        gTimer[0].rtc.day++;
    }
    if (gTimer[0].config.time_unit==HOUR){
        timer_switch(&gTimer[0]);
    }
    if (gTimer[1].config.time_unit==HOUR){
        timer_switch(&gTimer[1]);
    }
}
/* ------------------------------------------------------------------------- */
